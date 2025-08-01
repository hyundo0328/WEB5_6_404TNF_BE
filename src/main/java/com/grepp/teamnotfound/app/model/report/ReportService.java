package com.grepp.teamnotfound.app.model.report;

import com.grepp.teamnotfound.app.model.board.entity.Article;
import com.grepp.teamnotfound.app.model.board.repository.ArticleRepository;
import com.grepp.teamnotfound.app.model.reply.entity.Reply;
import com.grepp.teamnotfound.app.model.reply.repository.ReplyRepository;
import com.grepp.teamnotfound.app.model.report.code.ReportType;
import com.grepp.teamnotfound.app.model.report.dto.ReportCommand;
import com.grepp.teamnotfound.app.model.report.dto.ReportDetailDto;
import com.grepp.teamnotfound.app.model.report.entity.Report;
import com.grepp.teamnotfound.app.model.report.repository.ReportRepository;
import com.grepp.teamnotfound.app.model.user.entity.User;
import com.grepp.teamnotfound.app.model.user.repository.UserRepository;
import com.grepp.teamnotfound.infra.error.exception.BusinessException;
import com.grepp.teamnotfound.infra.error.exception.code.BoardErrorCode;
import com.grepp.teamnotfound.infra.error.exception.code.ReplyErrorCode;
import com.grepp.teamnotfound.infra.error.exception.code.ReportErrorCode;
import com.grepp.teamnotfound.infra.error.exception.code.UserErrorCode;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ReportService {

    private final ReportRepository reportRepository;
    private final ArticleRepository articleRepository;
    private final ReplyRepository replyRepository;
    private final UserRepository userRepository;

    @Transactional(readOnly = true)
    public ReportDetailDto getReportDetail(Long reportId) {

        Report report = reportRepository.findByReportIdWithUsers(reportId)
                .orElseThrow(() -> new BusinessException(ReportErrorCode.REPORT_NOT_FOUND));

        Article article = (report.getType() == ReportType.REPLY) ?
                replyRepository.findArticleWithBoardByReplyId(report.getContentId())
                        .orElseThrow(() -> new BusinessException(BoardErrorCode.ARTICLE_NOT_FOUND))
                : articleRepository.findWithBoardByArticleId(report.getContentId())
                .orElseThrow(() -> new BusinessException(BoardErrorCode.ARTICLE_NOT_FOUND));

        return ReportDetailDto.from(report, article);
    }


    @Transactional
    public Long createReport(ReportCommand command) {
        User reporter = validateReporter(command.getReporterId());
        User reported;
        if(command.getReportType().equals(ReportType.BOARD)) {
            Article reportedArticle = articleRepository.findByArticleIdWithWriter(command.getContentId())
                    .orElseThrow(() -> new BusinessException(BoardErrorCode.ARTICLE_NOT_FOUND));
            reported = reportedArticle.getUser();
            reportedArticle.isReported();
        } else if (command.getReportType().equals(ReportType.REPLY)) {
            Reply reportedReply = replyRepository.findByReplyIdWithWriter(command.getContentId())
                    .orElseThrow(() -> new BusinessException(ReplyErrorCode.REPLY_NOT_FOUND));
            reported = reportedReply.getUser();
            reportedReply.isReported();
        } else throw new BusinessException(ReportErrorCode.REPORT_TYPE_BAD_REQUEST);

        reporter.validateNotSelf(reported);
        validateDuplicateReport(reporter, command);

        Report report = Report.of(command, reporter, reported);
        reportRepository.save(report);

        return report.getReportId();
    }

    private void validateDuplicateReport(User reporter, ReportCommand command) {
        if (reportRepository.duplicateReport(reporter, command.getReportType(), command.getContentId())) {
            throw new BusinessException(ReportErrorCode.DUPLICATED_REPORT);
        }
    }

    private User findReportedUser(ReportType reportType, Long contentId) {
        if (reportType == ReportType.BOARD) {
            // 게시글 존재 확인 및 작성자 갖고 오기
            Article article = articleRepository.findByIdFetchUser(contentId)
                    .orElseThrow(() -> new BusinessException(BoardErrorCode.ARTICLE_NOT_FOUND));
            return article.getUser();

        } else if (reportType == ReportType.REPLY) {
            Reply reply = replyRepository.findByIdFetchUser(contentId)
                    .orElseThrow(() -> new BusinessException(ReplyErrorCode.REPLY_NOT_FOUND));
            return reply.getUser();

        } else throw new BusinessException(ReportErrorCode.REPORT_TYPE_BAD_REQUEST);
    }

    private User validateReporter(Long reporterId) {
        return userRepository.findByUserId(reporterId)
                .orElseThrow(() -> new BusinessException(UserErrorCode.USER_NOT_FOUND));
    }
}
