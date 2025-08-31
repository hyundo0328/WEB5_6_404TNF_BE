INSERT INTO vaccines (additional_cycle, booster_count, booster_cycle, period, created_at, deleted_at, updated_at, vaccine_id, name) VALUES (12, 4, 2, 6, '2025-07-11 18:46:52.808000 +09:00', null, null, 1, 'DHPPL');
INSERT INTO vaccines (additional_cycle, booster_count, booster_cycle, period, created_at, deleted_at, updated_at, vaccine_id, name) VALUES (12, 1, 2, 6, '2025-07-11 18:46:54.461000 +09:00', null, null, 2, 'CORONAVIRUS');
INSERT INTO vaccines (additional_cycle, booster_count, booster_cycle, period, created_at, deleted_at, updated_at, vaccine_id, name) VALUES (12, 1, 2, 10, '2025-07-11 18:46:55.954000 +09:00', null, null, 3, 'KENNEL_COUGH');
INSERT INTO vaccines (additional_cycle, booster_count, booster_cycle, period, created_at, deleted_at, updated_at, vaccine_id, name) VALUES (12, 1, 2, 14, '2025-07-11 18:46:56.739000 +09:00', null, null, 4, 'INFLUENZA');
INSERT INTO vaccines (additional_cycle, booster_count, booster_cycle, period, created_at, deleted_at, updated_at, vaccine_id, name) VALUES (12, 0, 0, 16, '2025-07-11 18:46:57.318000 +09:00', null, null, 5, 'RABIES');

INSERT INTO boards (board_id, name, created_at, updated_at, deleted_at) VALUES (1, 'FREE', '2024-01-01 00:00:00 ', NULL, NULL);
INSERT INTO boards (board_id, name, created_at, updated_at, deleted_at) VALUES (2, 'QUESTION', '2024-01-02 00:00:00', NULL, NULL);
INSERT INTO boards (board_id, name, created_at, updated_at, deleted_at) VALUES (3, 'BEGINNER', '2024-01-03 00:00:00', NULL, NULL);

-- 회원 더미데이터 (게시물 작성자 및 댓글 작성자) 비번 : 123qwe!@#
INSERT INTO users (user_id, email, state, name, nickname, role, password, provider, created_at, updated_at, deleted_at) VALUES
                                                                                                                            (1, 'user1@example.com', true, '김철수', '멍멍이아빠', 'ROLE_USER', NULL, 'google', '2024-01-01 10:00:00', NULL, NULL),
                                                                                                                            (2, 'user2@example.com', true, '이영희', '댕댕이맘', 'ROLE_USER', NULL, 'kakao', '2024-01-02 10:00:00', NULL, NULL),
                                                                                                                            (3, 'user3@example.com', true, '박민수', '강아지사랑', 'ROLE_USER', '{bcrypt}$2a$10$ooxh.Vi2a.Wz5slGKsWB8euywQV.pfCiGagyjHEEvnPwB1VHoK55m', 'local', '2024-01-03 10:00:00', NULL, NULL),
                                                                                                                            (4, 'user4@example.com', true, '최지영', '반려동물러버', 'ROLE_USER', '{bcrypt}$2a$10$ooxh.Vi2a.Wz5slGKsWB8euywQV.pfCiGagyjHEEvnPwB1VHoK55m', 'local', '2024-01-04 10:00:00', NULL, NULL),
                                                                                                                            (5, 'user5@example.com', true, '정다현', '펫맘', 'ROLE_USER', '{bcrypt}$2a$10$ooxh.Vi2a.Wz5slGKsWB8euywQV.pfCiGagyjHEEvnPwB1VHoK55m', 'local', '2024-01-05 10:00:00', NULL, NULL),
                                                                                                                            (6, 'user6@example.com', true, '황성민', '댕댕이', 'ROLE_USER', '{bcrypt}$2a$10$ooxh.Vi2a.Wz5slGKsWB8euywQV.pfCiGagyjHEEvnPwB1VHoK55m', 'local', '2024-01-06 10:00:00', NULL, NULL),
                                                                                                                            (7, 'user7@example.com', true, '강수진', '강아지집사', 'ROLE_USER', '{bcrypt}$2a$10$ooxh.Vi2a.Wz5slGKsWB8euywQV.pfCiGagyjHEEvnPwB1VHoK55m', 'local', '2024-01-07 10:00:00', NULL, NULL),
                                                                                                                            (8, 'user8@example.com', true, '오준호', '멍뭉이', 'ROLE_USER', '{bcrypt}$2a$10$ooxh.Vi2a.Wz5slGKsWB8euywQV.pfCiGagyjHEEvnPwB1VHoK55m', 'local', '2024-01-08 10:00:00', NULL, NULL),
                                                                                                                            (9, 'user9@example.com', true, '윤서연', '반려동물친구', 'ROLE_USER', '{bcrypt}$2a$10$ooxh.Vi2a.Wz5slGKsWB8euywQV.pfCiGagyjHEEvnPwB1VHoK55m', 'local', '2024-01-09 10:00:00', NULL, NULL),
                                                                                                                            (10, 'user10@example.com', true, '임태현', '강아지키우기', 'ROLE_USER', '{bcrypt}$2a$10$ooxh.Vi2a.Wz5slGKsWB8euywQV.pfCiGagyjHEEvnPwB1VHoK55m', 'local', '2024-01-10 10:00:00', NULL, NULL),
                                                                                                                            (11, 'user11@example.com', true, '한소영', '멍멍맘', 'ROLE_USER', '{bcrypt}$2a$10$ooxh.Vi2a.Wz5slGKsWB8euywQV.pfCiGagyjHEEvnPwB1VHoK55m', 'local', '2024-01-11 10:00:00', NULL, NULL),
                                                                                                                            (12, 'user12@example.com', true, '조민석', '펫러버', 'ROLE_USER', '{bcrypt}$2a$10$ooxh.Vi2a.Wz5slGKsWB8euywQV.pfCiGagyjHEEvnPwB1VHoK55m', 'local', '2024-01-12 10:00:00', NULL, NULL),
                                                                                                                            (13, 'user13@example.com', true, '김나래', '댕댕이사랑', 'ROLE_USER', '{bcrypt}$2a$10$ooxh.Vi2a.Wz5slGKsWB8euywQV.pfCiGagyjHEEvnPwB1VHoK55m', 'local', '2024-01-13 10:00:00', NULL, NULL),
                                                                                                                            (14, 'user14@example.com', true, '박준영', '반려견주', 'ROLE_USER', '{bcrypt}$2a$10$ooxh.Vi2a.Wz5slGKsWB8euywQV.pfCiGagyjHEEvnPwB1VHoK55m', 'local', '2024-01-14 10:00:00', NULL, NULL),
                                                                                                                            (15, 'user15@example.com', true, '이혜진', '동물사랑', 'ROLE_USER', '{bcrypt}$2a$10$ooxh.Vi2a.Wz5slGKsWB8euywQV.pfCiGagyjHEEvnPwB1VHoK55m', 'local', '2024-01-15 10:00:00', NULL, NULL);

-- user_imgs 테이블 더미데이터
INSERT INTO user_imgs (user_img_id, user_id, type, save_path, origin_name, renamed_name, created_at, updated_at, deleted_at) VALUES
                                                                                                                                 (1, 1, 'THUMBNAIL', '/uploads/profiles/2024/01/', 'my_dog_photo.jpg', 'profile_1_20240101_001.jpg', '2024-01-01 10:30:00', NULL, NULL),
                                                                                                                                 (2, 2, 'THUMBNAIL', '/uploads/profiles/2024/01/', 'dog_picture.png', 'profile_2_20240102_001.png', '2024-01-02 11:15:00', NULL, NULL),
                                                                                                                                 (3, 3, 'THUMBNAIL', '/uploads/profiles/2024/01/', 'golden_retriever.jpg', 'profile_3_20240103_001.jpg', '2024-01-03 09:45:00', NULL, NULL),
                                                                                                                                 (4, 4, 'THUMBNAIL', '/uploads/profiles/2024/01/', 'pet_family.jpeg', 'profile_4_20240104_001.jpeg', '2024-01-04 14:20:00', NULL, NULL),
                                                                                                                                 (5, 5, 'THUMBNAIL', '/uploads/profiles/2024/01/', 'cute_puppy.jpg', 'profile_5_20240105_001.jpg', '2024-01-05 16:30:00', NULL, NULL),
                                                                                                                                 (6, 6, 'THUMBNAIL', '/uploads/profiles/2024/01/', 'beagle_photo.png', 'profile_6_20240106_001.png', '2024-01-06 12:00:00', NULL, NULL),
                                                                                                                                 (7, 7, 'THUMBNAIL', '/uploads/profiles/2024/01/', 'poodle_dog.jpg', 'profile_7_20240107_001.jpg', '2024-01-07 13:45:00', NULL, NULL),
                                                                                                                                 (8, 8, 'THUMBNAIL', '/uploads/profiles/2024/01/', 'dog_family.jpeg', 'profile_8_20240108_001.jpeg', '2024-01-08 15:10:00', NULL, NULL),
                                                                                                                                 (9, 9, 'THUMBNAIL', '/uploads/profiles/2024/01/', 'pet_portrait.jpg', 'profile_9_20240109_001.jpg', '2024-01-09 10:20:00', NULL, NULL),
                                                                                                                                 (10, 10, 'THUMBNAIL', '/uploads/profiles/2024/01/', 'labrador_smile.png', 'profile_10_20240110_001.png', '2024-01-10 11:50:00', NULL, NULL),
                                                                                                                                 (11, 11, 'THUMBNAIL', '/uploads/profiles/2024/01/', 'shiba_inu.jpg', 'profile_11_20240111_001.jpg', '2024-01-11 08:30:00', NULL, NULL),
                                                                                                                                 (12, 12, 'THUMBNAIL', '/uploads/profiles/2024/01/', 'mixed_breed.jpeg', 'profile_12_20240112_001.jpeg', '2024-01-12 17:15:00', NULL, NULL),
                                                                                                                                 (13, 13, 'THUMBNAIL', '/uploads/profiles/2024/01/', 'corgi_dog.jpg', 'profile_13_20240113_001.jpg', '2024-01-13 14:40:00', NULL, NULL),
                                                                                                                                 (14, 14, 'THUMBNAIL', '/uploads/profiles/2024/01/', 'german_shepherd.png', 'profile_14_20240114_001.png', '2024-01-14 09:25:00', NULL, NULL),
                                                                                                                                 (15, 15, 'THUMBNAIL', '/uploads/profiles/2024/01/', 'rescue_dog.jpg', 'profile_15_20240115_001.jpg', '2024-01-15 12:35:00', NULL, NULL);

-- noti_managements 테이블 더미데이터
INSERT INTO noti_managements (noti_manage_id, user_id, is_noti_all, is_noti_schedule, is_noti_service, created_at, updated_at, deleted_at) VALUES
                                                                                                                                               (1, 1, true, true, true, NOW(), NULL, NULL),
                                                                                                                                               (2, 2, true, true, true, NOW(), NULL, NULL),
                                                                                                                                               (3, 3, true, true, true, NOW(), NULL, NULL),
                                                                                                                                               (4, 4, true, true, true, NOW(), NULL, NULL),
                                                                                                                                               (5, 5, true, true, true, NOW(), NULL, NULL),
                                                                                                                                               (6, 6, true, true, true, NOW(), NULL, NULL),
                                                                                                                                               (7, 7, true, true, true, NOW(), NULL, NULL),
                                                                                                                                               (8, 8, true, true, true, NOW(), NULL, NULL),
                                                                                                                                               (9, 9, true, true, true, NOW(), NULL, NULL),
                                                                                                                                               (10, 10, true, true, true, NOW(), NULL, NULL),
                                                                                                                                               (11, 11, true, true, true, NOW(), NULL, NULL),
                                                                                                                                               (12, 12, true, true, true, NOW(), NULL, NULL),
                                                                                                                                               (13, 13, true, true, true, NOW(), NULL, NULL),
                                                                                                                                               (14, 14, true, true, true, NOW(), NULL, NULL),
                                                                                                                                               (15, 15, true, true, true, NOW(), NULL, NULL);

-- pets 더미데이터
INSERT INTO pets (birthday, is_neutered, metday, sex, weight, created_at, deleted_at, pet_id, updated_at, user_id, name, size, breed, regist_number) VALUES
                                                                                                                                                         ('2025-07-20', true, '2025-07-20', true, 0.1, '2025-07-18 17:23:29.550503 +09:00', null, 1, null, 1, '뽀삐', 'SMALL', 'BEAGLE', '1111'),
                                                                                                                                                         ('2025-07-20', true, '2025-07-20', true, 0.1, '2025-07-18 17:23:29.550503 +09:00', null, 2, null, 1, '마음이', 'SMALL', 'BEAGLE', '2222'),
                                                                                                                                                         ('2025-07-20', true, '2025-07-20', true, 0.1, '2025-07-18 17:23:29.550503 +09:00', null, 3, null, 2, '울프', 'SMALL', 'BEAGLE', '3333'),
                                                                                                                                                         ('2025-07-20', true, '2025-07-20', true, 0.1, '2025-07-18 17:23:29.550503 +09:00', null, 4, null, 3, '돌쇠', 'SMALL', 'BEAGLE', '444'),
                                                                                                                                                         ('2025-07-20', true, '2025-07-20', true, 0.1, '2025-07-18 17:23:29.550503 +09:00', null, 5, null, 3, '밥푸리', 'SMALL', 'BEAGLE', '555'),
                                                                                                                                                         ('2025-07-20', true, '2025-07-20', true, 0.1, '2025-07-18 17:23:29.550503 +09:00', null, 6, null, 4, '애기', 'SMALL', 'BEAGLE', '666');

-- 게시물 더미데이터 (자유게시판 10개)
INSERT INTO articles (article_id, user_id, board_id, title, content, views, reported_at, created_at, updated_at, deleted_at) VALUES
                                                                                                                                 (1, 1, 1, '우리 강아지 산책 루트 추천해주세요', '안녕하세요! 3살 골든리트리버를 키우고 있는데, 매일 같은 곳으로만 산책을 가다 보니 강아지가 지루해하는 것 같아요. 혹시 서울 강남구 근처에서 강아지 산책하기 좋은 곳 있으면 추천해주세요! 자연이 많고 다른 강아지들과 만날 수 있는 곳이면 더 좋겠어요.', 87, NULL, '2024-07-01 14:30:00', NULL, NULL),
                                                                                                                                 (2, 2, 1, '강아지가 밥을 잘 안 먹어요 ㅠㅠ', '2살 푸들 강아지를 키우고 있는데, 며칠 전부터 사료를 잘 안 먹어요. 평소에 잘 먹던 사료인데 갑자기 왜 이럴까요? 혹시 비슷한 경험 있으신 분 계신가요? 병원에 가봐야 할까요?', 134, NULL, '2024-07-02 09:15:00', NULL, NULL),
                                                                                                                                 (3, 3, 1, '강아지 훈련 방법 공유해요', '안녕하세요! 6개월 된 비글을 키우고 있는데, 기본적인 훈련(앉아, 기다려, 이리와 등)을 성공적으로 시켰어요. 제가 사용한 방법들을 공유해드리려고 해요. 가장 중요한 건 일관성과 인내심이에요!', 203, NULL, '2024-07-03 16:45:00', NULL, NULL),
                                                                                                                                 (4, 4, 1, '반려동물 보험 가입하셨나요?', '반려동물을 키우면서 병원비가 부담되어서 보험 가입을 고민하고 있어요. 혹시 반려동물 보험 가입하신 분들 계신가요? 어떤 보험사가 좋은지, 보장 범위는 어떻게 되는지 궁금해요.', 156, NULL, '2024-07-04 11:20:00', NULL, NULL),
                                                                                                                                 (5, 5, 1, '우리 강아지 사진 자랑', '오늘 우리 댕댕이가 너무 귀여워서 사진을 찍었어요! 햇살을 받으며 낮잠 자는 모습이 너무 평화로워 보여요. 여러분도 우리 아이 예쁘다고 생각하지 않으세요? 다른 분들도 자랑할 사진 있으면 올려주세요!', 298, NULL, '2024-07-05 13:10:00', NULL, NULL),
                                                                                                                                 (6, 6, 1, '강아지 목욕 주기 궁금해요', '푸들을 키우고 있는데, 목욕을 얼마나 자주 시켜야 하는지 궁금해요. 지금은 2주에 한 번씩 시키고 있는데, 너무 자주 시키는 건 아닌가요? 털이 곱슬곱슬해서 관리가 어려워요.', 89, NULL, '2024-07-06 10:30:00', NULL, NULL),
                                                                                                                                 (7, 7, 1, '강아지 간식 추천', '강아지 간식을 바꿔보려고 하는데, 어떤 제품이 좋을까요? 지금 사용하는 건 너무 딱딱한 것 같아요. 소화 잘 되고 기호성 좋은 제품 추천해주세요!', 112, NULL, '2024-07-07 15:20:00', NULL, NULL),
                                                                                                                                 (8, 8, 1, '반려동물과 함께 여행 가본 분?', '이번 여름휴가에 강아지와 함께 여행을 가려고 해요. 펜션을 예약했는데, 여행 준비물이나 주의사항이 있을까요? 처음 데리고 가는 거라 걱정이 많아요. 경험담 공유해주세요!', 167, NULL, '2024-07-08 12:45:00', NULL, NULL),
                                                                                                                                 (9, 9, 1, '강아지 사회화 교육 언제부터?', '3개월 된 강아지를 키우고 있는데, 사회화 교육을 언제부터 시작해야 할까요? 아직 예방접종이 끝나지 않았는데 다른 강아지들과 만나게 해도 될까요? 초보 견주라 모르는 게 많아요.', 78, NULL, '2024-07-09 08:15:00', NULL, NULL),
                                                                                                                                 (10, 10, 1, '우리 강아지 특이한 습관', '우리 강아지가 매일 같은 시간에 현관문 앞에서 기다리는 습관이 있어요. 제가 퇴근할 시간을 정확히 알고 있는 것 같아요. 다른 집 강아지들도 이런 신기한 습관들이 있나요? 재미있는 이야기 들려주세요!', 223, NULL, '2024-07-09 17:30:00', NULL, NULL);

-- 게시글 이미지 더미데이터
-- article_imgs 더미데이터 (게시글별 첨부사진)
INSERT INTO article_imgs (article_img_id, article_id, type, origin_name, renamed_name, save_path, created_at, updated_at, deleted_at) VALUES
                                                                                                                                          -- 게시글 1: 우리 강아지 산책 루트 추천해주세요 (골든리트리버 산책사진 3개)
                                                                                                                                          (1, 1, 'THUMBNAIL', 'golden_retriever_walk.jpg', 'art1_thumb_20240701143000.jpg', '/uploads/articles/2024/07/art1_thumb_20240701143000.jpg', '2024-07-01 14:30:00', NULL, NULL),
                                                                                                                                          (2, 1, 'LARGE', 'park_scenery.jpg', 'art1_large_20240701143001.jpg', '/uploads/articles/2024/07/art1_large_20240701143001.jpg', '2024-07-01 14:30:01', NULL, NULL),
                                                                                                                                          (3, 1, 'MEDIUM', 'dog_friends_meeting.jpg', 'art1_medium_20240701143002.jpg', '/uploads/articles/2024/07/art1_medium_20240701143002.jpg', '2024-07-01 14:30:02', NULL, NULL),

                                                                                                                                          -- 게시글 2: 강아지가 밥을 잘 안 먹어요 (푸들 강아지 사진 2개)
                                                                                                                                          (4, 2, 'THUMBNAIL', 'poodle_sad.jpg', 'art2_thumb_20240702091500.jpg', '/uploads/articles/2024/07/art2_thumb_20240702091500.jpg', '2024-07-02 09:15:00', NULL, NULL),
                                                                                                                                          (5, 2, 'MEDIUM', 'dog_food_bowl.jpg', 'art2_medium_20240702091501.jpg', '/uploads/articles/2024/07/art2_medium_20240702091501.jpg', '2024-07-02 09:15:01', NULL, NULL),

                                                                                                                                          -- 게시글 3: 강아지 훈련 방법 공유해요 (비글 훈련사진 4개)
                                                                                                                                          (6, 3, 'THUMBNAIL', 'beagle_training_sit.jpg', 'art3_thumb_20240703164500.jpg', '/uploads/articles/2024/07/art3_thumb_20240703164500.jpg', '2024-07-03 16:45:00', NULL, NULL),
                                                                                                                                          (7, 3, 'LARGE', 'beagle_training_stay.jpg', 'art3_large_20240703164501.jpg', '/uploads/articles/2024/07/art3_large_20240703164501.jpg', '2024-07-03 16:45:01', NULL, NULL),
                                                                                                                                          (8, 3, 'MEDIUM', 'beagle_training_come.jpg', 'art3_medium_20240703164502.jpg', '/uploads/articles/2024/07/art3_medium_20240703164502.jpg', '2024-07-03 16:45:02', NULL, NULL),
                                                                                                                                          (9, 3, 'SMALL', 'training_treats.jpg', 'art3_small_20240703164503.jpg', '/uploads/articles/2024/07/art3_small_20240703164503.jpg', '2024-07-03 16:45:03', NULL, NULL),

                                                                                                                                          -- 게시글 4: 반려동물 보험 가입하셨나요? (보험서류 사진 1개)
                                                                                                                                          (10, 4, 'THUMBNAIL', 'pet_insurance_document.jpg', 'art4_thumb_20240704112000.jpg', '/uploads/articles/2024/07/art4_thumb_20240704112000.jpg', '2024-07-04 11:20:00', NULL, NULL),

                                                                                                                                          -- 게시글 5: 우리 강아지 사진 자랑 (강아지 낮잠 사진 5개)
                                                                                                                                          (11, 5, 'THUMBNAIL', 'dog_sleeping_sunlight.jpg', 'art5_thumb_20240705131000.jpg', '/uploads/articles/2024/07/art5_thumb_20240705131000.jpg', '2024-07-05 13:10:00', NULL, NULL),
                                                                                                                                          (12, 5, 'LARGE', 'dog_peaceful_nap.jpg', 'art5_large_20240705131001.jpg', '/uploads/articles/2024/07/art5_large_20240705131001.jpg', '2024-07-05 13:10:01', NULL, NULL),
                                                                                                                                          (13, 5, 'MEDIUM', 'dog_cute_pose.jpg', 'art5_medium_20240705131002.jpg', '/uploads/articles/2024/07/art5_medium_20240705131002.jpg', '2024-07-05 13:10:02', NULL, NULL),
                                                                                                                                          (14, 5, 'SMALL', 'dog_stretching.jpg', 'art5_small_20240705131003.jpg', '/uploads/articles/2024/07/art5_small_20240705131003.jpg', '2024-07-05 13:10:03', NULL, NULL),
                                                                                                                                          (15, 5, 'DESC', 'dog_window_view.jpg', 'art5_desc_20240705131004.jpg', '/uploads/articles/2024/07/art5_desc_20240705131004.jpg', '2024-07-05 13:10:04', NULL, NULL),

                                                                                                                                          -- 게시글 6: 강아지 목욕 주기 궁금해요 (푸들 목욕사진 3개)
                                                                                                                                          (16, 6, 'THUMBNAIL', 'poodle_bath_before.jpg', 'art6_thumb_20240706103000.jpg', '/uploads/articles/2024/07/art6_thumb_20240706103000.jpg', '2024-07-06 10:30:00', NULL, NULL),
                                                                                                                                          (17, 6, 'MEDIUM', 'poodle_bathing.jpg', 'art6_medium_20240706103001.jpg', '/uploads/articles/2024/07/art6_medium_20240706103001.jpg', '2024-07-06 10:30:01', NULL, NULL),
                                                                                                                                          (18, 6, 'LARGE', 'poodle_after_bath.jpg', 'art6_large_20240706103002.jpg', '/uploads/articles/2024/07/art6_large_20240706103002.jpg', '2024-07-06 10:30:02', NULL, NULL),

                                                                                                                                          -- 게시글 7: 강아지 간식 추천 (간식 제품사진 2개)
                                                                                                                                          (19, 7, 'THUMBNAIL', 'dog_treat_brands.jpg', 'art7_thumb_20240707152000.jpg', '/uploads/articles/2024/07/art7_thumb_20240707152000.jpg', '2024-07-07 15:20:00', NULL, NULL),
                                                                                                                                          (20, 7, 'MEDIUM', 'dog_chew_toy.jpg', 'art7_medium_20240707152001.jpg', '/uploads/articles/2024/07/art7_medium_20240707152001.jpg', '2024-07-07 15:20:01', NULL, NULL),

                                                                                                                                          -- 게시글 8: 반려동물과 함께 여행 가본 분? (여행준비물 사진 4개)
                                                                                                                                          (21, 8, 'THUMBNAIL', 'dog_travel_bag.jpg', 'art8_thumb_20240708124500.jpg', '/uploads/articles/2024/07/art8_thumb_20240708124500.jpg', '2024-07-08 12:45:00', NULL, NULL),
                                                                                                                                          (22, 8, 'LARGE', 'pet_friendly_pension.jpg', 'art8_large_20240708124501.jpg', '/uploads/articles/2024/07/art8_large_20240708124501.jpg', '2024-07-08 12:45:01', NULL, NULL),
                                                                                                                                          (23, 8, 'MEDIUM', 'travel_supplies.jpg', 'art8_medium_20240708124502.jpg', '/uploads/articles/2024/07/art8_medium_20240708124502.jpg', '2024-07-08 12:45:02', NULL, NULL),
                                                                                                                                          (24, 8, 'SMALL', 'dog_car_seat.jpg', 'art8_small_20240708124503.jpg', '/uploads/articles/2024/07/art8_small_20240708124503.jpg', '2024-07-08 12:45:03', NULL, NULL),

                                                                                                                                          -- 게시글 9: 강아지 사회화 교육 언제부터? (어린 강아지 사진 2개)
                                                                                                                                          (25, 9, 'THUMBNAIL', 'puppy_3months.jpg', 'art9_thumb_20240709081500.jpg', '/uploads/articles/2024/07/art9_thumb_20240709081500.jpg', '2024-07-09 08:15:00', NULL, NULL),
                                                                                                                                          (26, 9, 'MEDIUM', 'puppy_vaccination_record.jpg', 'art9_medium_20240709081501.jpg', '/uploads/articles/2024/07/art9_medium_20240709081501.jpg', '2024-07-09 08:15:01', NULL, NULL),

                                                                                                                                          -- 게시글 10: 우리 강아지 특이한 습관 (현관문 앞 강아지 사진 3개)
                                                                                                                                          (27, 10, 'THUMBNAIL', 'dog_waiting_door.jpg', 'art10_thumb_20240709173000.jpg', '/uploads/articles/2024/07/art10_thumb_20240709173000.jpg', '2024-07-09 17:30:00', NULL, NULL),
                                                                                                                                          (28, 10, 'LARGE', 'dog_time_sense.jpg', 'art10_large_20240709173001.jpg', '/uploads/articles/2024/07/art10_large_20240709173001.jpg', '2024-07-09 17:30:01', NULL, NULL),
                                                                                                                                          (29, 10, 'MEDIUM', 'dog_daily_routine.jpg', 'art10_medium_20240709173002.jpg', '/uploads/articles/2024/07/art10_medium_20240709173002.jpg', '2024-07-09 17:30:02', NULL, NULL);

-- 댓글 더미데이터 (각 게시물마다 10개씩)
INSERT INTO replies (reply_id, article_id, user_id, content, reported_at, created_at, updated_at, deleted_at) VALUES
-- 게시물 1번 댓글
(1, 1, 2, '한강공원 추천해요! 넓고 다른 강아지들도 많이 와요', NULL, '2024-07-01 15:00:00', NULL, NULL),
(2, 1, 3, '반포한강공원 좋아요. 주차도 편하고 산책로도 잘 되어 있어요', NULL, '2024-07-01 15:15:00', NULL, NULL),
(3, 1, 4, '올림픽공원도 추천합니다! 넓어서 뛰어다니기 좋아요', NULL, '2024-07-01 15:30:00', NULL, NULL),
(4, 1, 5, '서울숲 어때요? 자연스럽고 산책하기 좋을 것 같은데', NULL, '2024-07-01 16:00:00', NULL, NULL),
(5, 1, 6, '골든리트리버면 체력이 좋으니까 좀 더 먼 곳도 괜찮을 것 같아요', NULL, '2024-07-01 16:30:00', NULL, NULL),
(6, 1, 7, '뚝섬한강공원도 좋아요. 강아지 전용 구역이 있어요', NULL, '2024-07-01 17:00:00', NULL, NULL),
(7, 1, 8, '탄천 산책로는 어떠세요? 길게 이어져 있어서 좋을 것 같아요', NULL, '2024-07-01 17:30:00', NULL, NULL),
(8, 1, 9, '중앙공원도 괜찮아요. 다른 강아지들과 사교할 수 있어요', NULL, '2024-07-01 18:00:00', NULL, NULL),
(9, 1, 10, '양재천도 추천해요! 물도 있고 그늘도 많아서 좋아요', NULL, '2024-07-01 18:30:00', NULL, NULL),
(10, 1, 11, '주말에는 사람이 많으니까 평일 오전이 좋을 것 같아요', NULL, '2024-07-01 19:00:00', NULL, NULL),

-- 게시물 2번 댓글
(11, 2, 1, '병원 가보시는 게 좋을 것 같아요. 갑자기 안 먹으면 아플 수도 있어요', NULL, '2024-07-02 09:30:00', NULL, NULL),
(12, 2, 3, '사료를 바꿔보셨나요? 같은 사료라도 제조일자가 다르면 맛이 달라질 수 있어요', NULL, '2024-07-02 10:00:00', NULL, NULL),
(13, 2, 4, '스트레스 받을 일이 있었나요? 환경 변화에 민감해서 그럴 수도 있어요', NULL, '2024-07-02 10:30:00', NULL, NULL),
(14, 2, 5, '간식은 먹나요? 간식만 먹고 사료는 안 먹을 수도 있어요', NULL, '2024-07-02 11:00:00', NULL, NULL),
(15, 2, 6, '사료 그릇을 바꿔보세요. 플라스틱 그릇은 냄새가 날 수 있어요', NULL, '2024-07-02 11:30:00', NULL, NULL),
(16, 2, 7, '우리 강아지도 그런 적 있었는데 며칠 지나니까 괜찮아졌어요', NULL, '2024-07-02 12:00:00', NULL, NULL),
(17, 2, 8, '습식 사료 섞어주면 어떨까요? 냄새가 더 좋아서 먹을 수도 있어요', NULL, '2024-07-02 12:30:00', NULL, NULL),
(18, 2, 9, '치아 검진도 받아보세요. 입 안이 아파서 그럴 수도 있어요', NULL, '2024-07-02 13:00:00', NULL, NULL),
(19, 2, 10, '푸들은 털이 엉키기 쉬우니 그루밍도 신경 써주세요', NULL, '2024-07-02 13:30:00', NULL, NULL),
(20, 2, 11, '하루 이틀 더 지켜보시고 계속 안 먹으면 병원 가세요', NULL, '2024-07-02 14:00:00', NULL, NULL),

-- 게시물 3번 댓글
(21, 3, 1, '좋은 정보 감사해요! 비글은 특히 훈련이 중요하죠', NULL, '2024-07-03 17:00:00', NULL, NULL),
(22, 3, 2, '일관성 정말 중요해요. 가족 모두가 같은 방식으로 해야 해요', NULL, '2024-07-03 17:15:00', NULL, NULL),
(23, 3, 4, '보상은 어떤 걸 사용하셨나요? 간식? 칭찬?', NULL, '2024-07-03 17:30:00', NULL, NULL),
(24, 3, 5, '6개월에 벌써 기본 훈련이 되다니 대단하네요!', NULL, '2024-07-03 18:00:00', NULL, NULL),
(25, 3, 6, '더 자세한 훈련 방법 공유해주실 수 있나요?', NULL, '2024-07-03 18:30:00', NULL, NULL),
(26, 3, 7, '비글은 똑똑해서 훈련이 잘 되죠. 부러워요', NULL, '2024-07-03 19:00:00', NULL, NULL),
(27, 3, 8, '인내심이 가장 중요한 것 같아요. 포기하지 않고 계속 해야죠', NULL, '2024-07-03 19:30:00', NULL, NULL),
(28, 3, 9, '우리 강아지는 아직 안 돼서 포기하고 싶었는데 힘이 나네요', NULL, '2024-07-03 20:00:00', NULL, NULL),
(29, 3, 10, '전문 훈련사 도움 받으셨나요? 아니면 혼자 하신 건가요?', NULL, '2024-07-03 20:30:00', NULL, NULL),
(30, 3, 11, '다음에는 고급 훈련 방법도 공유해주세요!', NULL, '2024-07-03 21:00:00', NULL, NULL),

-- 게시물 4번 댓글
(31, 4, 1, '저는 A보험 가입했는데 만족하고 있어요', NULL, '2024-07-04 11:45:00', NULL, NULL),
(32, 4, 2, '보험료가 생각보다 비싸더라구요. 잘 알아보고 가입하세요', NULL, '2024-07-04 12:00:00', NULL, NULL),
(33, 4, 3, '수술비 80%까지 보장해주는 상품이 좋은 것 같아요', NULL, '2024-07-04 12:15:00', NULL, NULL),
(34, 4, 5, '나이가 들수록 보험료가 올라가니까 어릴 때 가입하는 게 좋아요', NULL, '2024-07-04 12:30:00', NULL, NULL),
(35, 4, 6, '기존 질병은 보장 안 되니까 건강할 때 가입하세요', NULL, '2024-07-04 12:45:00', NULL, NULL),
(36, 4, 7, '여러 보험사 비교해보시고 본인에게 맞는 걸 선택하세요', NULL, '2024-07-04 13:00:00', NULL, NULL),
(37, 4, 8, '보험 가입 전에 약관 꼼꼼히 읽어보시는 게 중요해요', NULL, '2024-07-04 13:15:00', NULL, NULL),
(38, 4, 9, '월 보험료와 자기부담금 비율 잘 따져보세요', NULL, '2024-07-04 13:30:00', NULL, NULL),
(39, 4, 10, '저는 가입 안 했는데 병원비 때문에 후회하고 있어요', NULL, '2024-07-04 13:45:00', NULL, NULL),
(40, 4, 11, '온라인으로 견적 받아보시는 것도 좋을 것 같아요', NULL, '2024-07-04 14:00:00', NULL, NULL),

-- 게시물 5번 댓글
(41, 5, 1, '정말 귀여워요! 햇살 받은 모습이 천사 같네요', NULL, '2024-07-05 13:30:00', NULL, NULL),
(42, 5, 2, '우리 강아지도 저렇게 자요. 너무 평화로워 보여요', NULL, '2024-07-05 13:45:00', NULL, NULL),
(43, 5, 3, '사진 너무 잘 찍으셨어요! 프로 사진 같아요', NULL, '2024-07-05 14:00:00', NULL, NULL),
(44, 5, 4, '강아지는 정말 어떤 자세로 자도 예쁜 것 같아요', NULL, '2024-07-05 14:15:00', NULL, NULL),
(45, 5, 6, '저도 우리 아이 사진 올려도 될까요?', NULL, '2024-07-05 14:30:00', NULL, NULL),
(46, 5, 7, '낮잠 자는 강아지만큼 평화로운 게 또 있을까요?', NULL, '2024-07-05 14:45:00', NULL, NULL),
(47, 5, 8, '털 색깔이 정말 예쁘네요. 무슨 견종인가요?', NULL, '2024-07-05 15:00:00', NULL, NULL),
(48, 5, 9, '강아지는 정말 어디서 자든 편해 보여요', NULL, '2024-07-05 15:15:00', NULL, NULL),
(49, 5, 10, '저희 집 강아지는 왜 이렇게 안 예쁘게 자는지 ㅠㅠ', NULL, '2024-07-05 15:30:00', NULL, NULL),
(50, 5, 11, '힐링되는 사진이네요. 감사합니다!', NULL, '2024-07-05 15:45:00', NULL, NULL),

-- 게시물 6번 댓글
(51, 6, 1, '푸들은 2주에 한 번이 적당한 것 같아요', NULL, '2024-07-06 10:45:00', NULL, NULL),
(52, 6, 2, '털이 기름기가 생기면 목욕시키는 게 좋아요', NULL, '2024-07-06 11:00:00', NULL, NULL),
(53, 6, 3, '너무 자주 하면 피부가 건조해질 수 있어요', NULL, '2024-07-06 11:15:00', NULL, NULL),
(54, 6, 4, '브러싱을 자주 해주시면 목욕 주기를 늘릴 수 있어요', NULL, '2024-07-06 11:30:00', NULL, NULL),
(55, 6, 5, '계절에 따라 주기를 조절하는 것도 좋아요', NULL, '2024-07-06 11:45:00', NULL, NULL),
(56, 6, 7, '푸들 전용 샴푸 사용하시는 게 좋을 것 같아요', NULL, '2024-07-06 12:00:00', NULL, NULL),
(57, 6, 8, '목욕 후 완전히 말려주는 것도 중요해요', NULL, '2024-07-06 12:15:00', NULL, NULL),
(58, 6, 9, '미용실에서 목욕과 미용을 함께 하는 것도 방법이에요', NULL, '2024-07-06 12:30:00', NULL, NULL),
(59, 6, 10, '우리 푸들은 한 달에 한 번 정도 해주는데 괜찮은 것 같아요', NULL, '2024-07-06 12:45:00', NULL, NULL),
(60, 6, 11, '활동량이 많으면 더 자주 해주셔야 할 것 같아요', NULL, '2024-07-06 13:00:00', NULL, NULL),

-- 게시물 7번 댓글
(61, 7, 1, '오래 씹을 수 있는 개껌류 간식 추천해요!', NULL, '2024-07-07 15:45:00', NULL, NULL),
(62, 7, 2, '소프트 트릿 종류도 잘 먹어요. 훈련용으로도 좋아요', NULL, '2024-07-07 16:00:00', NULL, NULL),
(63, 7, 3, '천연 재료로 만든 수제 간식이 최고인 것 같아요', NULL, '2024-07-07 16:15:00', NULL, NULL),
(64, 7, 4, '저는 A브랜드 동결건조 간식 주는데 환장해요', NULL, '2024-07-07 16:30:00', NULL, NULL),
(65, 7, 5, '강아지 알레르기 유무 확인하고 주셔야 해요', NULL, '2024-07-07 16:45:00', NULL, NULL),
(66, 7, 6, '치아 건강에 좋은 덴탈껌도 좋아요', NULL, '2024-07-07 17:00:00', NULL, NULL),
(67, 7, 8, '간식 줄 때는 칼로리 생각해서 적당히 주세요', NULL, '2024-07-07 17:15:00', NULL, NULL),
(68, 7, 9, '새로운 간식은 소량씩 먼저 먹여보고 반응 보세요', NULL, '2024-07-07 17:30:00', NULL, NULL),
(69, 7, 10, '온라인에 샘플팩 파는 곳 많으니 여러 종류 시도해보세요', NULL, '2024-07-07 17:45:00', NULL, NULL),
(70, 7, 11, '과일이나 채소도 강아지에게 좋은 간식이 될 수 있어요', NULL, '2024-07-07 18:00:00', NULL, NULL),

-- 게시물 8번 댓글
(71, 8, 1, '강아지 여행 가이드북 미리 읽어보세요', NULL, '2024-07-08 13:00:00', NULL, NULL),
(72, 8, 2, '응급처치 키트 꼭 챙겨가세요', NULL, '2024-07-08 13:15:00', NULL, NULL),
(73, 8, 3, '평소 먹던 사료와 물 충분히 준비하세요', NULL, '2024-07-08 13:30:00', NULL, NULL),
(74, 8, 4, '차멀미 대비해서 멀미약 준비하시는 것도 좋아요', NULL, '2024-07-08 13:45:00', NULL, NULL),
(75, 8, 5, '목줄과 인식표 꼭 착용시키세요', NULL, '2024-07-08 14:00:00', NULL, NULL),
(76, 8, 6, '새로운 환경에서 스트레스받을 수 있으니 좋아하는 장난감 챙기세요', NULL, '2024-07-08 14:15:00', NULL, NULL),
(77, 8, 7, '펜션 주변에 동물병원 위치 미리 확인해두세요', NULL, '2024-07-08 14:30:00', NULL, NULL),
(78, 8, 9, '저희도 작년에 다녀왔는데 정말 즐거웠어요', NULL, '2024-07-08 14:45:00', NULL, NULL),
(79, 8, 10, '강아지용 카시트나 케이지 준비하시면 안전해요', NULL, '2024-07-08 15:00:00', NULL, NULL),
(80, 8, 11, '날씨 변화 대비해서 옷도 몇 벌 챙겨가세요', NULL, '2024-07-08 15:15:00', NULL, NULL),

-- 게시물 9번 댓글
(81, 9, 1, '예방접종 끝나고 2주 후부터 시작하시는 게 좋아요', NULL, '2024-07-09 08:30:00', NULL, NULL),
(82, 9, 2, '퍼피 클래스 같은 프로그램 알아보세요', NULL, '2024-07-09 08:45:00', NULL, NULL),
(83, 9, 3, '집에서 먼저 가족들과 사회화 연습하세요', NULL, '2024-07-09 09:00:00', NULL, NULL),
(84, 9, 4, '3개월이면 사회화 적기예요. 서둘러 준비하세요', NULL, '2024-07-09 09:15:00', NULL, NULL),
(85, 9, 5, '다양한 소리에 노출시켜주는 것도 중요해요', NULL, '2024-07-09 09:30:00', NULL, NULL),
(86, 9, 6, '사람들 많은 곳에 데리고 가서 구경시켜 주세요', NULL, '2024-07-09 09:45:00', NULL, NULL),
(87, 9, 7, '긍정적인 경험을 많이 만들어주는 게 중요해요', NULL, '2024-07-09 10:00:00', NULL, NULL),
(88, 9, 8, '무서워하는 상황에서는 강요하지 마세요', NULL, '2024-07-09 10:15:00', NULL, NULL),
(89, 9, 10, '견주 모임에 참여하시는 것도 좋은 방법이에요', NULL, '2024-07-09 10:30:00', NULL, NULL),
(90, 9, 11, '전문가 상담 받아보시는 것도 추천해요', NULL, '2024-07-09 10:45:00', NULL, NULL),

-- 게시물 10번 댓글
(91, 10, 1, '강아지는 정말 시간 개념이 정확한 것 같아요', NULL, '2024-07-09 17:45:00', NULL, NULL),
(92, 10, 2, '우리 강아지는 매일 아침 6시에 저를 깨워요', NULL, '2024-07-09 18:00:00', NULL, NULL),
(93, 10, 3, '냄새로 시간을 구분한다는 설이 있어요', NULL, '2024-07-09 18:15:00', NULL, NULL),
(94, 10, 4, '루틴을 좋아하는 동물이라서 그런 것 같아요', NULL, '2024-07-09 18:30:00', NULL, NULL),
(95, 10, 5, '우리 강아지는 산책 시간만 되면 목줄을 가져와요', NULL, '2024-07-09 18:45:00', NULL, NULL),
(96, 10, 6, '정말 신기해요. 사람보다 정확한 것 같아요', NULL, '2024-07-09 19:00:00', NULL, NULL),
(97, 10, 7, '가족들 출퇴근 시간을 다 외우고 있어요', NULL, '2024-07-09 19:15:00', NULL, NULL),
(98, 10, 8, '강아지의 생체시계는 정말 정확한 것 같아요', NULL, '2024-07-09 19:30:00', NULL, NULL),
(99, 10, 9, '우리 강아지는 밥 시간만 되면 밥그릇 앞에 앉아 있어요', NULL, '2024-07-09 19:45:00', NULL, NULL),
(100, 10, 11, '이런 모습들 보면 정말 사랑스러워요', NULL, '2024-07-09 20:00:00', NULL, NULL);

-- 게시글 좋아요 더미데이터 (선택사항)
INSERT INTO article_likes (like_id, article_id, user_id, created_at) VALUES
                                                                         (1, 1, 2, '2024-07-01 15:30:00'),
                                                                         (2, 1, 3, '2024-07-01 16:00:00'),
                                                                         (3, 1, 4, '2024-07-01 16:30:00'),
                                                                         (4, 2, 1, '2024-07-02 10:00:00'),
                                                                         (5, 2, 3, '2024-07-02 10:30:00'),
                                                                         (6, 3, 1, '2024-07-03 17:00:00'),
                                                                         (7, 3, 2, '2024-07-03 17:30:00'),
                                                                         (8, 3, 4, '2024-07-03 18:00:00'),
                                                                         (9, 3, 5, '2024-07-03 18:30:00'),
                                                                         (10, 4, 1, '2024-07-04 12:00:00'),
                                                                         (11, 4, 2, '2024-07-04 12:30:00'),
                                                                         (12, 5, 1, '2024-07-05 13:30:00'),
                                                                         (13, 5, 2, '2024-07-05 14:00:00'),
                                                                         (14, 5, 3, '2024-07-05 14:30:00'),
                                                                         (15, 5, 4, '2024-07-05 15:00:00'),
                                                                         (16, 5, 6, '2024-07-05 15:30:00'),
                                                                         (17, 6, 1, '2024-07-06 11:00:00'),
                                                                         (18, 6, 2, '2024-07-06 11:30:00'),
                                                                         (19, 7, 1, '2024-07-07 16:00:00'),
                                                                         (20, 7, 2, '2024-07-07 16:30:00'),
                                                                         (21, 7, 3, '2024-07-07 17:00:00'),
                                                                         (22, 8, 1, '2024-07-08 13:30:00'),
                                                                         (23, 8, 2, '2024-07-08 14:00:00'),
                                                                         (24, 8, 3, '2024-07-08 14:30:00'),
                                                                         (25, 9, 1, '2024-07-09 09:00:00'),
                                                                         (26, 9, 2, '2024-07-09 09:30:00'),
                                                                         (27, 10, 1, '2024-07-09 18:00:00'),
                                                                         (28, 10, 2, '2024-07-09 18:30:00'),
                                                                         (29, 10, 3, '2024-07-09 19:00:00'),
                                                                         (30, 10, 4, '2024-07-09 19:30:00');


-- 신고용 user
INSERT INTO users (user_id, created_at, deleted_at, updated_at, email, name, nickname, password, provider, role, state, suspension_end_at) VALUES (10508, '2025-07-22 19:25:48.177831', null, null, 'admin1@email.com', '관리자1', 'admin1', '{bcrypt}$2a$10$F8yTcSx5O429ONSzQiwI3eIYJyMdQZYIfFuw0uMsR9vqQG5AfPLnK', 'local', 'ROLE_ADMIN', true, null);
INSERT INTO users (user_id, created_at, deleted_at, updated_at, email, name, nickname, password, provider, role, state, suspension_end_at) VALUES (10509, '2025-07-23 08:41:49.675012', null, null, 'string', 'string', 'string', '{bcrypt}$2a$10$F8yTcSx5O429ONSzQiwI3eIYJyMdQZYIfFuw0uMsR9vqQG5AfPLnK', 'local', 'ROLE_USER', true, null);
INSERT INTO users (user_id, created_at, deleted_at, updated_at, email, name, nickname, password, provider, role, state, suspension_end_at) VALUES (10510, '2025-07-23 08:42:16.508313', null, null, 'aef', 'striefng', 'stafring', '{bcrypt}$2a$10$F8yTcSx5O429ONSzQiwI3eIYJyMdQZYIfFuw0uMsR9vqQG5AfPLnK', 'local', 'ROLE_ADMIN', true, null);
INSERT INTO users (user_id, created_at, deleted_at, updated_at, email, name, nickname, password, provider, role, state, suspension_end_at) VALUES (16161, '2025-07-23 04:16:43.000000', null, null, 'test1@email.com', '테스트1', 'test1', '{bcrypt}$2a$10$7MakkJpVxbSjLXXvvcaaKOEAh99I402Bd/OSSvvPICrMuG15pIluW', 'local', 'ROLE_USER', true, '2025-07-23 19:28:44.016940');
INSERT INTO users (user_id, created_at, deleted_at, updated_at, email, name, nickname, password, provider, role, state, suspension_end_at) VALUES (45544, '2025-07-23 04:17:50.000000', null, null, 'test2@email.com', '테스트2', 'test2', '{bcrypt}$2a$10$7MakkJpVxbSjLXXvvcaaKOEAh99I402Bd/OSSvvPICrMuG15pIluW', 'local', 'ROLE_USER', true, null);
INSERT INTO users (user_id, created_at, deleted_at, updated_at, email, name, nickname, password, provider, role, state, suspension_end_at) VALUES (54466, '2025-07-23 04:18:34.000000', null, null, 'test3@email.com', '테스트3', 'test3', '{bcrypt}$2a$10$7MakkJpVxbSjLXXvvcaaKOEAh99I402Bd/OSSvvPICrMuG15pIluW', 'local', 'ROLE_USER', true, null);

-- 신고용 articles
INSERT INTO articles (article_id, created_at, deleted_at, updated_at, content, reported_at, title, views, board_id, user_id) VALUES (10500, '2025-07-22 19:21:37.571245', null, null, 'striㅇㅇㅇㅇng', null, '신고테', 3, 1, 16161);
INSERT INTO articles (article_id, created_at, deleted_at, updated_at, content, reported_at, title, views, board_id, user_id) VALUES (10501, '2025-07-22 19:21:49.433716', null, null, 'striㅇㅇㅇㅇng', null, '신고테2222', 0, 1, 16161);

-- 신고용 replies
INSERT INTO replies (reply_id, created_at, deleted_at, updated_at, content, reported_at, article_id, user_id) VALUES (10502, '2025-07-22 19:22:16.043305', null, null, 'strㅁㄷㄹㄷing', null, 10500, 16161);
INSERT INTO replies (reply_id, created_at, deleted_at, updated_at, content, reported_at, article_id, user_id) VALUES (10503, '2025-07-22 19:22:26.134833', null, '2025-07-22 19:28:43.995925', '222222222222', '2025-07-22 19:28:43.995925', 10500, 16161);

-- 신고용 reports
INSERT INTO reports (report_id, created_at, deleted_at, updated_at, admin_reason, category, content_id, reason, reported_at, state, type, reported_id, reporter_id) VALUES (10504, '2025-07-22 19:24:07.854823', null, '2025-07-22 19:28:43.995925', '아오오오', 'ABUSE', 10503, 'string', null, 'ACCEPT', 'REPLY', 16161, 45544);
INSERT INTO reports (report_id, created_at, deleted_at, updated_at, admin_reason, category, content_id, reason, reported_at, state, type, reported_id, reporter_id) VALUES (10505, '2025-07-22 19:24:25.942220', null, '2025-07-22 19:27:40.549537', '불합리한 신고', 'ABUSE', 10501, 'string', null, 'REJECT', 'BOARD', 16161, 45544);
INSERT INTO reports (report_id, created_at, deleted_at, updated_at, admin_reason, category, content_id, reason, reported_at, state, type, reported_id, reporter_id) VALUES (10506, '2025-07-22 19:25:09.757530', null, '2025-07-22 19:28:44.011926', '아오오오', 'ABUSE', 10503, 'string', null, 'ACCEPT', 'REPLY', 16161, 54466);
INSERT INTO reports (report_id, created_at, deleted_at, updated_at, admin_reason, category, content_id, reason, reported_at, state, type, reported_id, reporter_id) VALUES (10507, '2025-07-22 19:25:28.395099', null, '2025-07-22 19:27:40.566370', '불합리한 신고', 'ABUSE', 10501, 'string', null, 'REJECT', 'BOARD', 16161, 54466);


INSERT INTO Standard (standard_id, created_at, breed, age, size, start_age, min_weight, max_weight, min_walk, max_walk, min_sleep, max_sleep) VALUES
                                                                                                                                                  (10000, '2025-07-22 18:27:36', 'BEAGLE', 'INFANT', 'MEDIUM', 0, 3.0, 8.0, 30, 60, 18, 20),
                                                                                                                                                  (10001, '2025-07-22 18:27:36', 'BEAGLE', 'ADULT', 'MEDIUM', 12, 9.0, 11.0, 60, 90, 12, 14),
                                                                                                                                                  (10002, '2025-07-22 18:27:36', 'BEAGLE', 'SENIOR', 'MEDIUM', 84, 9.0, 12.0, 30, 60, 14, 18),
                                                                                                                                                  (10003, '2025-07-22 18:27:36', 'BICHON_FRISE', 'INFANT', 'SMALL', 0, 2.0, 4.0, 20, 40, 18, 20),
                                                                                                                                                  (10004, '2025-07-22 18:27:36', 'BICHON_FRISE', 'ADULT', 'SMALL', 10, 5.0, 8.0, 30, 60, 12, 15),
                                                                                                                                                  (10005, '2025-07-22 18:27:36', 'BICHON_FRISE', 'SENIOR', 'SMALL', 96, 5.0, 9.0, 20, 40, 14, 18),
                                                                                                                                                  (10006, '2025-07-22 18:27:36', 'BORDER_COLLIE', 'INFANT', 'MEDIUM', 0, 5.0, 12.0, 40, 70, 18, 20),
                                                                                                                                                  (10007, '2025-07-22 18:27:36', 'BORDER_COLLIE', 'ADULT', 'MEDIUM', 12, 14.0, 20.0, 90, 120, 12, 14),
                                                                                                                                                  (10008, '2025-07-22 18:27:36', 'BORDER_COLLIE', 'SENIOR', 'MEDIUM', 84, 14.0, 21.0, 45, 60, 14, 18),
                                                                                                                                                  (10009, '2025-07-22 18:27:36', 'BOXER', 'INFANT', 'LARGE', 0, 10.0, 20.0, 30, 60, 18, 20),
                                                                                                                                                  (10010, '2025-07-22 18:27:36', 'BOXER', 'ADULT', 'LARGE', 15, 25.0, 32.0, 60, 120, 12, 14),
                                                                                                                                                  (10011, '2025-07-22 18:27:36', 'BOXER', 'SENIOR', 'LARGE', 72, 25.0, 33.0, 30, 60, 14, 18),
                                                                                                                                                  (10012, '2025-07-22 18:27:36', 'BULLDOG', 'INFANT', 'MEDIUM', 0, 8.0, 15.0, 20, 40, 18, 20),
                                                                                                                                                  (10013, '2025-07-22 18:27:36', 'BULLDOG', 'ADULT', 'MEDIUM', 12, 18.0, 23.0, 30, 60, 12, 14),
                                                                                                                                                  (10014, '2025-07-22 18:27:36', 'BULLDOG', 'SENIOR', 'MEDIUM', 84, 18.0, 24.0, 20, 40, 14, 18),
                                                                                                                                                  (10015, '2025-07-22 18:27:36', 'CHIHUAHUA', 'INFANT', 'SMALL', 0, 0.5, 1.5, 15, 30, 18, 22),
                                                                                                                                                  (10016, '2025-07-22 18:27:36', 'CHIHUAHUA', 'ADULT', 'SMALL', 10, 1.5, 3.0, 20, 30, 12, 15),
                                                                                                                                                  (10017, '2025-07-22 18:27:36', 'CHIHUAHUA', 'SENIOR', 'SMALL', 96, 1.5, 3.5, 15, 25, 14, 20),
                                                                                                                                                  (10018, '2025-07-22 18:27:36', 'COCKER_SPANIEL', 'INFANT', 'MEDIUM', 0, 4.0, 9.0, 30, 50, 18, 20),
                                                                                                                                                  (10019, '2025-07-22 18:27:36', 'COCKER_SPANIEL', 'ADULT', 'MEDIUM', 12, 11.0, 14.0, 45, 70, 12, 14),
                                                                                                                                                  (10020, '2025-07-22 18:27:36', 'COCKER_SPANIEL', 'SENIOR', 'MEDIUM', 84, 11.0, 15.0, 30, 50, 14, 18),
                                                                                                                                                  (10021, '2025-07-22 18:27:36', 'DACHSHUND', 'INFANT', 'SMALL', 0, 3.0, 6.0, 20, 40, 18, 20),
                                                                                                                                                  (10022, '2025-07-22 18:27:36', 'DACHSHUND', 'ADULT', 'SMALL', 10, 7.0, 15.0, 30, 60, 12, 14),
                                                                                                                                                  (10023, '2025-07-22 18:27:36', 'DACHSHUND', 'SENIOR', 'SMALL', 96, 7.0, 16.0, 20, 40, 14, 18),
                                                                                                                                                  (10024, '2025-07-22 18:27:36', 'DOBERMAN', 'INFANT', 'LARGE', 0, 15.0, 25.0, 40, 70, 18, 20),
                                                                                                                                                  (10025, '2025-07-22 18:27:36', 'DOBERMAN', 'ADULT', 'LARGE', 15, 32.0, 45.0, 90, 120, 12, 14),
                                                                                                                                                  (10026, '2025-07-22 18:27:36', 'DOBERMAN', 'SENIOR', 'LARGE', 72, 32.0, 46.0, 40, 60, 14, 18),
                                                                                                                                                  (10027, '2025-07-22 18:27:36', 'FRENCH_BULLDOG', 'INFANT', 'SMALL', 0, 4.0, 8.0, 20, 40, 18, 20),
                                                                                                                                                  (10028, '2025-07-22 18:27:36', 'FRENCH_BULLDOG', 'ADULT', 'SMALL', 10, 8.0, 13.0, 30, 60, 12, 14),
                                                                                                                                                  (10029, '2025-07-22 18:27:36', 'FRENCH_BULLDOG', 'SENIOR', 'SMALL', 96, 8.0, 14.0, 20, 40, 14, 18),
                                                                                                                                                  (10030, '2025-07-22 18:27:36', 'GERMAN_SHEPHERD', 'INFANT', 'LARGE', 0, 10.0, 25.0, 40, 70, 18, 20),
                                                                                                                                                  (10031, '2025-07-22 18:27:36', 'GERMAN_SHEPHERD', 'ADULT', 'LARGE', 15, 22.0, 40.0, 90, 120, 12, 14),
                                                                                                                                                  (10032, '2025-07-22 18:27:36', 'GERMAN_SHEPHERD', 'SENIOR', 'LARGE', 72, 22.0, 41.0, 45, 60, 14, 18),
                                                                                                                                                  (10033, '2025-07-22 18:27:36', 'GOLDEN_RETRIEVER', 'INFANT', 'LARGE', 0, 10.0, 20.0, 30, 60, 18, 20),
                                                                                                                                                  (10034, '2025-07-22 18:27:36', 'GOLDEN_RETRIEVER', 'ADULT', 'LARGE', 15, 25.0, 34.0, 60, 90, 12, 14),
                                                                                                                                                  (10035, '2025-07-22 18:27:36', 'GOLDEN_RETRIEVER', 'SENIOR', 'LARGE', 72, 25.0, 35.0, 30, 60, 14, 18),
                                                                                                                                                  (10036, '2025-07-22 18:27:36', 'GREAT_DANE', 'INFANT', 'LARGE', 0, 20.0, 45.0, 30, 60, 18, 20),
                                                                                                                                                  (10037, '2025-07-22 18:27:36', 'GREAT_DANE', 'ADULT', 'LARGE', 15, 50.0, 90.0, 60, 90, 12, 16),
                                                                                                                                                  (10038, '2025-07-22 18:27:36', 'GREAT_DANE', 'SENIOR', 'LARGE', 72, 50.0, 91.0, 30, 50, 16, 18),
                                                                                                                                                  (10039, '2025-07-22 18:27:36', 'HUSKY', 'INFANT', 'MEDIUM', 0, 8.0, 16.0, 40, 70, 18, 20),
                                                                                                                                                  (10040, '2025-07-22 18:27:36', 'HUSKY', 'ADULT', 'MEDIUM', 12, 16.0, 27.0, 90, 120, 12, 14),
                                                                                                                                                  (10041, '2025-07-22 18:27:36', 'HUSKY', 'SENIOR', 'MEDIUM', 84, 16.0, 28.0, 45, 60, 14, 18),
                                                                                                                                                  (10042, '2025-07-22 18:27:36', 'JACK_RUSSELL', 'INFANT', 'SMALL', 0, 2.0, 5.0, 30, 60, 18, 20),
                                                                                                                                                  (10043, '2025-07-22 18:27:36', 'JACK_RUSSELL', 'ADULT', 'SMALL', 10, 6.0, 8.0, 60, 90, 12, 14),
                                                                                                                                                  (10044, '2025-07-22 18:27:36', 'JACK_RUSSELL', 'SENIOR', 'SMALL', 96, 6.0, 9.0, 30, 50, 14, 18),
                                                                                                                                                  (10045, '2025-07-22 18:27:36', 'LABRADOR', 'INFANT', 'LARGE', 0, 10.0, 22.0, 30, 60, 18, 20),
                                                                                                                                                  (10046, '2025-07-22 18:27:36', 'LABRADOR', 'ADULT', 'LARGE', 15, 25.0, 36.0, 60, 90, 12, 14),
                                                                                                                                                  (10047, '2025-07-22 18:27:36', 'LABRADOR', 'SENIOR', 'LARGE', 72, 25.0, 37.0, 30, 60, 14, 18),
                                                                                                                                                  (10048, '2025-07-22 18:27:36', 'MALTESE', 'INFANT', 'SMALL', 0, 1.0, 2.5, 20, 30, 18, 22),
                                                                                                                                                  (10049, '2025-07-22 18:27:36', 'MALTESE', 'ADULT', 'SMALL', 10, 2.0, 4.0, 20, 40, 12, 15),
                                                                                                                                                  (10050, '2025-07-22 18:27:36', 'MALTESE', 'SENIOR', 'SMALL', 96, 2.0, 4.5, 15, 30, 14, 18),
                                                                                                                                                  (10051, '2025-07-22 18:27:36', 'PAPILLON', 'INFANT', 'SMALL', 0, 1.0, 3.0, 20, 40, 18, 20),
                                                                                                                                                  (10052, '2025-07-22 18:27:36', 'PAPILLON', 'ADULT', 'SMALL', 10, 3.0, 5.0, 30, 45, 12, 15),
                                                                                                                                                  (10053, '2025-07-22 18:27:36', 'PAPILLON', 'SENIOR', 'SMALL', 96, 3.0, 5.5, 20, 30, 14, 18),
                                                                                                                                                  (10054, '2025-07-22 18:27:36', 'POMERANIAN', 'INFANT', 'SMALL', 0, 0.8, 2.0, 20, 30, 18, 22),
                                                                                                                                                  (10055, '2025-07-22 18:27:36', 'POMERANIAN', 'ADULT', 'SMALL', 10, 1.5, 3.5, 20, 40, 12, 16),
                                                                                                                                                  (10056, '2025-07-22 18:27:36', 'POMERANIAN', 'SENIOR', 'SMALL', 96, 1.5, 4.0, 15, 30, 14, 18),
                                                                                                                                                  (10057, '2025-07-22 18:27:36', 'POODLE', 'INFANT', 'SMALL', 0, 1.5, 3.5, 20, 40, 18, 20),
                                                                                                                                                  (10058, '2025-07-22 18:27:36', 'POODLE', 'ADULT', 'SMALL', 10, 4.0, 6.0, 45, 60, 12, 15),
                                                                                                                                                  (10059, '2025-07-22 18:27:36', 'POODLE', 'SENIOR', 'SMALL', 96, 4.0, 7.0, 30, 45, 14, 18),
                                                                                                                                                  (10060, '2025-07-22 18:27:36', 'PUG', 'INFANT', 'SMALL', 0, 2.0, 5.0, 20, 30, 18, 20),
                                                                                                                                                  (10061, '2025-07-22 18:27:36', 'PUG', 'ADULT', 'SMALL', 10, 6.0, 8.0, 20, 40, 12, 14),
                                                                                                                                                  (10062, '2025-07-22 18:27:36', 'PUG', 'SENIOR', 'SMALL', 96, 6.0, 9.0, 15, 30, 14, 18),
                                                                                                                                                  (10063, '2025-07-22 18:27:36', 'SAMOYED', 'INFANT', 'MEDIUM', 0, 8.0, 18.0, 30, 60, 18, 20),
                                                                                                                                                  (10064, '2025-07-22 18:27:36', 'SAMOYED', 'ADULT', 'MEDIUM', 12, 16.0, 30.0, 60, 90, 12, 14),
                                                                                                                                                  (10065, '2025-07-22 18:27:36', 'SAMOYED', 'SENIOR', 'MEDIUM', 84, 16.0, 31.0, 30, 60, 14, 18),
                                                                                                                                                  (10066, '2025-07-22 18:27:36', 'SHIBA_INU', 'INFANT', 'MEDIUM', 0, 3.0, 7.0, 30, 50, 18, 20),
                                                                                                                                                  (10067, '2025-07-22 18:27:36', 'SHIBA_INU', 'ADULT', 'MEDIUM', 12, 8.0, 11.0, 45, 60, 12, 14),
                                                                                                                                                  (10068, '2025-07-22 18:27:36', 'SHIBA_INU', 'SENIOR', 'MEDIUM', 84, 8.0, 12.0, 30, 45, 14, 18),
                                                                                                                                                  (10069, '2025-07-22 18:27:36', 'SHIH_TZU', 'INFANT', 'SMALL', 0, 2.0, 4.0, 20, 30, 18, 20),
                                                                                                                                                  (10070, '2025-07-22 18:27:36', 'SHIH_TZU', 'ADULT', 'SMALL', 10, 4.0, 7.5, 20, 40, 12, 16),
                                                                                                                                                  (10071, '2025-07-22 18:27:36', 'SHIH_TZU', 'SENIOR', 'SMALL', 96, 4.0, 8.0, 15, 30, 14, 18),
                                                                                                                                                  (10072, '2025-07-22 18:27:36', 'WELSH_CORGI', 'INFANT', 'MEDIUM', 0, 4.0, 9.0, 25, 50, 18, 20),
                                                                                                                                                  (10073, '2025-07-22 18:27:36', 'WELSH_CORGI', 'ADULT', 'MEDIUM', 12, 10.0, 14.0, 45, 60, 12, 14),
                                                                                                                                                  (10074, '2025-07-22 18:27:36', 'WELSH_CORGI', 'SENIOR', 'MEDIUM', 84, 10.0, 15.0, 30, 45, 14, 18),
                                                                                                                                                  (10075, '2025-07-22 18:27:36', 'YORKSHIRE_TERRIER', 'INFANT', 'SMALL', 0, 1.0, 2.0, 20, 30, 18, 22),
                                                                                                                                                  (10076, '2025-07-22 18:27:36', 'YORKSHIRE_TERRIER', 'ADULT', 'SMALL', 10, 2.0, 3.2, 20, 40, 13, 16),
                                                                                                                                                  (10077, '2025-07-22 18:27:36', 'YORKSHIRE_TERRIER', 'SENIOR', 'SMALL', 96, 2.0, 3.5, 15, 30, 14, 18),
                                                                                                                                                  (10078, '2025-07-22 18:27:36', 'MIX', 'INFANT', 'SMALL', 0, 2.0, 5.0, 20, 40, 18, 20),
                                                                                                                                                  (10079, '2025-07-22 18:27:36', 'MIX', 'ADULT', 'SMALL', 10, 3.0, 10.0, 30, 60, 12, 15),
                                                                                                                                                  (10080, '2025-07-22 18:27:36', 'MIX', 'SENIOR', 'SMALL', 96, 3.0, 11.0, 20, 40, 14, 18),
                                                                                                                                                  (10081, '2025-07-22 18:27:36', 'MIX', 'INFANT', 'MEDIUM', 0, 5.0, 12.0, 30, 60, 18, 20),
                                                                                                                                                  (10082, '2025-07-22 18:27:36', 'MIX', 'ADULT', 'MEDIUM', 12, 11.0, 25.0, 45, 90, 12, 14),
                                                                                                                                                  (10083, '2025-07-22 18:27:36', 'MIX', 'SENIOR', 'MEDIUM', 84, 11.0, 26.0, 30, 60, 14, 18),
                                                                                                                                                  (10084, '2025-07-22 18:27:36', 'MIX', 'INFANT', 'LARGE', 0, 10.0, 25.0, 30, 60, 18, 20),
                                                                                                                                                  (10085, '2025-07-22 18:27:36', 'MIX', 'ADULT', 'LARGE', 15, 25.0, 45.0, 60, 120, 12, 14),
                                                                                                                                                  (10086, '2025-07-22 18:27:36', 'MIX', 'SENIOR', 'LARGE', 72, 25.0, 48.0, 30, 60, 14, 18);

-- articles 테이블에 인덱스 설정
CREATE INDEX idx_articles_board_id ON articles (board_id);