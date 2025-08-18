package com.grepp.teamnotfound.app.model.user.repository;

import com.grepp.teamnotfound.app.controller.api.admin.code.AdminListSortDirection;
import com.grepp.teamnotfound.app.controller.api.admin.code.UserStateFilter;
import com.grepp.teamnotfound.app.controller.api.admin.code.UsersListSortBy;
import com.grepp.teamnotfound.app.controller.api.admin.payload.UsersListRequest;
import com.grepp.teamnotfound.app.model.board.entity.QArticle;
import com.grepp.teamnotfound.app.model.reply.entity.QReply;
import com.grepp.teamnotfound.app.model.user.code.UserStatus;
import com.grepp.teamnotfound.app.model.user.dto.UsersListDto;
import com.grepp.teamnotfound.app.model.user.entity.QUser;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.ExpressionUtils;
import com.querydsl.core.types.Order;
import com.querydsl.core.types.OrderSpecifier;
import com.querydsl.core.types.Projections;
import com.querydsl.core.types.dsl.CaseBuilder;
import com.querydsl.core.types.dsl.NumberExpression;
import com.querydsl.jpa.JPAExpressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import java.time.OffsetDateTime;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class UserRepositoryImpl implements UserRepositoryCustom{

    private final JPAQueryFactory queryFactory;

    QUser user = QUser.user;
    QArticle article = QArticle.article;
    QReply reply = QReply.reply;

    @Override
    public Page<UsersListDto> findUserListWithMeta(UsersListRequest request, Pageable pageable) {

        // 검색 조건 : search - 닉네임, 이메일
        BooleanBuilder search = new BooleanBuilder();
        if(request.getSearch() != null && !request.getSearch().isEmpty()) {
            search.and(
                    user.email.containsIgnoreCase(request.getSearch())
                            .or(user.nickname.containsIgnoreCase(request.getSearch()))
            );
        }

        // 필터링 조건 : active, suspended, leave search.and
        if (request.getStatus() != null && request.getStatus() != UserStateFilter.ALL) {
            switch (request.getStatus()) {
                case ACTIVE -> search.and(
                        user.status.eq(UserStatus.ACTIVE));
                case SUSPENDED -> search.and(
                        user.status.eq(UserStatus.SUSPENDED));
                case LEAVE -> search.and(
                        user.status.eq(UserStatus.LEAVE));
            }
        }

        // 메인 쿼리
        List<UsersListDto> content = queryFactory
                .select(Projections.fields(
                        UsersListDto.class,
                        user.userId,
                        user.email,
                        user.nickname,
                        // 없는 필드값 서브 쿼리로 생성
                        ExpressionUtils.as(
                                JPAExpressions
                                        .select(article.count())
                                        .from(article)
                                        .where(article.user.userId.eq(user.userId)),
                                "postCount"
                        ),
                        ExpressionUtils.as(
                                JPAExpressions
                                        .select(reply.count())
                                        .from(reply)
                                        .where(reply.user.userId.eq(user.userId)),
                                "commentCount"
                        ),
                        user.lastLoginAt.as("lastLoginDate"),
                        user.createdAt.as("joinDate"),
                        user.status,
                        user.suspensionEndAt
                ))
                .from(user)
                .where(search)
                .orderBy(getOrderSpecifier(request.getSortBy(), request.getSort()))
                .offset(pageable.getOffset())
                .limit(pageable.getPageSize())
                .fetch();


        // count 쿼리 : 전체 개수 조회
        Long total = queryFactory
                .select(user.count())
                .from(user)
                .where(search)
                .fetchOne();

        // 리턴 new PageImpl<>(content, pageable, total)
        return new PageImpl<>(content, pageable, total != null ? total : 0);
    }

    // 정렬 처리 : 단일 정렬
    // sortBy case가 8개인데,
    // 이걸 다중 정렬로 모든 우선순위를 상정해서 반환해주는 게 너무 오버엔지니어링이라 판단
    private OrderSpecifier<?> getOrderSpecifier(UsersListSortBy sortBy, AdminListSortDirection direction) {
        if (sortBy == null) {
            return user.createdAt.asc();
        }

        return switch (sortBy) {
            case EMAIL -> direction.isAsc() ? user.email.asc() : user.email.desc();
            case NICKNAME -> direction.isAsc() ? user.nickname.asc() : user.nickname.desc();
            case POST_COUNT -> {
                var postCountQuery = JPAExpressions
                        .select(article.count())
                        .from(article)
                        .where(article.user.userId.eq(user.userId));
                Order order = direction.isAsc() ? Order.ASC : Order.DESC;
                yield new OrderSpecifier<>(order, postCountQuery);
            }
            case COMMENT_COUNT -> {
                var commentCountQuery = JPAExpressions
                        .select(reply.count())
                        .from(reply)
                        .where(reply.user.userId.eq(user.userId));
                Order order = direction.isAsc() ? Order.ASC : Order.DESC;
                yield new OrderSpecifier<>(order, commentCountQuery);
            }

            case LAST_LOGIN_DATE -> direction.isAsc() ? user.lastLoginAt.asc() : user.lastLoginAt.desc();
            case JOIN_DATE -> direction.isAsc() ? user.createdAt.asc() : user.createdAt.desc();
            // 설정
            case SUSPENSION_END_DATE -> direction.isAsc() ? user.suspensionEndAt.asc().nullsLast() : user.suspensionEndAt.desc().nullsLast();
            case STATE -> {
                NumberExpression<Integer> stateOrder = new CaseBuilder()
                        .when(user.status.eq(UserStatus.LEAVE)).then(3)            // LEAVE
                        .when(user.status.eq(UserStatus.SUSPENDED)).then(2) // SUSPENDED
                        .otherwise(1);                                       // ACTIVE or ALL
                yield direction.isAsc() ? stateOrder.asc() : stateOrder.desc();
            }
        };
    }


    // 전체 회원 목록 조회 전, suspend 종료된 회원 status update
    @Override
    public void refreshSuspendedUsers() {
        queryFactory.update(QUser.user)
                .set(QUser.user.status, UserStatus.ACTIVE)
                .where(QUser.user.status.eq(UserStatus.SUSPENDED)
                        .and(QUser.user.suspensionEndAt.before(OffsetDateTime.now())))
                .execute();
    }
}

