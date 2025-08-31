CREATE TABLE users (
    user_id bigint NOT NULL,
    name character varying NOT NULL,
    role character varying NOT NULL CHECK (role::text = ANY (ARRAY['ROLE_USER'::character varying, 'ROLE_ADMIN'::character varying]::text[])),
    provider character varying,
    email character varying NOT NULL UNIQUE,
    nickname character varying NOT NULL,
    password character varying,
    state boolean NOT NULL,
    last_login_at timestamp with time zone,
    suspension_end_at timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    updated_at timestamp with time zone,

    CONSTRAINT users_pkey PRIMARY KEY (user_id)
);

CREATE TABLE user_imgs (
    user_id bigint NOT NULL,
    user_img_id bigint NOT NULL,
    type character varying CHECK (type::text = ANY (ARRAY['THUMBNAIL'::character varying, 'DESC'::character varying, 'LARGE'::character varying, 'SMALL'::character varying, 'MEDIUM'::character varying]::text[])),
    save_path character varying,
    origin_name character varying,
    renamed_name character varying,
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    updated_at timestamp with time zone,

    CONSTRAINT user_imgs_pkey PRIMARY KEY (user_img_id),
    CONSTRAINT fk_user_imgs_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE pets (
    pet_id bigint NOT NULL,
    birthday date NOT NULL,
    is_neutered boolean NOT NULL,
    metday date NOT NULL,
    sex boolean NOT NULL,
    weight double precision,
    user_id bigint,
    name character varying,
    size character varying NOT NULL CHECK (size::text = ANY (ARRAY['SMALL'::character varying, 'MEDIUM'::character varying, 'LARGE'::character varying]::text[])),
    breed character varying NOT NULL CHECK (breed::text = ANY (ARRAY['BEAGLE'::character varying, 'BICHON_FRISE'::character varying, 'BORDER_COLLIE'::character varying, 'BOXER'::character varying, 'BULLDOG'::character varying, 'CHIHUAHUA'::character varying, 'COCKER_SPANIEL'::character varying, 'DACHSHUND'::character varying, 'DOBERMAN'::character varying, 'FRENCH_BULLDOG'::character varying, 'GERMAN_SHEPHERD'::character varying, 'GOLDEN_RETRIEVER'::character varying, 'GREAT_DANE'::character varying, 'HUSKY'::character varying, 'JACK_RUSSELL'::character varying, 'LABRADOR'::character varying, 'MALTESE'::character varying, 'PAPILLON'::character varying, 'POMERANIAN'::character varying, 'POODLE'::character varying, 'PUG'::character varying, 'SAMOYED'::character varying, 'SHIBA_INU'::character varying, 'SHIH_TZU'::character varying, 'WELSH_CORGI'::character varying, 'YORKSHIRE_TERRIER'::character varying, 'MIX'::character varying]::text[])),
    regist_number character varying,
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    updated_at timestamp with time zone,
    
    CONSTRAINT pets_pkey PRIMARY KEY (pet_id),
    CONSTRAINT fk_pets_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE pet_imgs (
    pet_id bigint NOT NULL,
    pet_img_id bigint NOT NULL,
    type character varying NOT NULL CHECK (type::text = ANY (ARRAY['THUMBNAIL'::character varying, 'DESC'::character varying, 'LARGE'::character varying, 'SMALL'::character varying, 'MEDIUM'::character varying]::text[])),
    origin_name character varying NOT NULL,
    renamed_name character varying NOT NULL,
    save_path character varying NOT NULL,
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    updated_at timestamp with time zone,

    CONSTRAINT pet_imgs_pkey PRIMARY KEY (pet_img_id),
    CONSTRAINT fk_pet_imgs_pet_id FOREIGN KEY (pet_id) REFERENCES pets(pet_id)
);

CREATE TABLE boards (
    board_id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    updated_at timestamp with time zone,

    CONSTRAINT boards_pkey PRIMARY KEY (board_id)
);

CREATE TABLE articles (
    article_id bigint NOT NULL,
    views integer NOT NULL,
    board_id bigint NOT NULL,
    reported_at timestamp with time zone,
    user_id bigint NOT NULL,
    title character varying NOT NULL,
    content text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    updated_at timestamp with time zone,

    CONSTRAINT articles_pkey PRIMARY KEY (article_id),
    CONSTRAINT fk_articles_board_id FOREIGN KEY (board_id) REFERENCES boards(board_id),
    CONSTRAINT fk_articles_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE article_imgs (
    article_img_id bigint NOT NULL,
    article_id bigint NOT NULL,
    type character varying NOT NULL CHECK (type::text = ANY (ARRAY['THUMBNAIL'::character varying, 'DESC'::character varying, 'LARGE'::character varying, 'SMALL'::character varying, 'MEDIUM'::character varying]::text[])),
    origin_name character varying NOT NULL,
    renamed_name character varying NOT NULL,
    save_path character varying NOT NULL,
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    updated_at timestamp with time zone,

    CONSTRAINT article_imgs_pkey PRIMARY KEY (article_img_id),
    CONSTRAINT fk_article_imgs_article_id FOREIGN KEY (article_id) REFERENCES articles(article_id)
);

CREATE TABLE article_likes (
    like_id bigint NOT NULL,
    article_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp with time zone,

    CONSTRAINT article_likes_pkey PRIMARY KEY (like_id),
    CONSTRAINT fk_article_likes_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_article_likes_article_id FOREIGN KEY (article_id) REFERENCES articles(article_id)
);

CREATE TABLE replies (
    reply_id bigint NOT NULL,
    reported_at timestamp with time zone,
    article_id bigint NOT NULL,
    user_id bigint NOT NULL,
    content character varying NOT NULL,
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    updated_at timestamp with time zone,

    CONSTRAINT replies_pkey PRIMARY KEY (reply_id),
    CONSTRAINT fk_replies_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_replies_article_id FOREIGN KEY (article_id) REFERENCES articles(article_id)
);

CREATE TABLE recommends (
    rec_id bigint NOT NULL,
    age character varying NOT NULL CHECK (age::text = ANY (ARRAY['INFANT'::character varying, 'ADULT'::character varying, 'SENIOR'::character varying]::text[])),
    breed character varying NOT NULL CHECK (breed::text = ANY (ARRAY['BEAGLE'::character varying, 'BICHON_FRISE'::character varying, 'BORDER_COLLIE'::character varying, 'BOXER'::character varying, 'BULLDOG'::character varying, 'CHIHUAHUA'::character varying, 'COCKER_SPANIEL'::character varying, 'DACHSHUND'::character varying, 'DOBERMAN'::character varying, 'FRENCH_BULLDOG'::character varying, 'GERMAN_SHEPHERD'::character varying, 'GOLDEN_RETRIEVER'::character varying, 'GREAT_DANE'::character varying, 'HUSKY'::character varying, 'JACK_RUSSELL'::character varying, 'LABRADOR'::character varying, 'MALTESE'::character varying, 'PAPILLON'::character varying, 'POMERANIAN'::character varying, 'POODLE'::character varying, 'PUG'::character varying, 'SAMOYED'::character varying, 'SHIBA_INU'::character varying, 'SHIH_TZU'::character varying, 'WELSH_CORGI'::character varying, 'YORKSHIRE_TERRIER'::character varying, 'MIX'::character varying]::text[])),
    size character varying NOT NULL CHECK (size::text = ANY (ARRAY['SMALL'::character varying, 'MEDIUM'::character varying, 'LARGE'::character varying]::text[])),
    sleeping_state character varying NOT NULL CHECK (sleeping_state::text = ANY (ARRAY['VERY_LOW'::character varying, 'LOW'::character varying, 'NORMAL'::character varying, 'HIGH'::character varying, 'VERY_HIGH'::character varying]::text[])),
    walking_state character varying NOT NULL CHECK (walking_state::text = ANY (ARRAY['VERY_LOW'::character varying, 'LOW'::character varying, 'NORMAL'::character varying, 'HIGH'::character varying, 'VERY_HIGH'::character varying]::text[])),
    weight_state character varying NOT NULL CHECK (weight_state::text = ANY (ARRAY['VERY_LOW'::character varying, 'LOW'::character varying, 'NORMAL'::character varying, 'HIGH'::character varying, 'VERY_HIGH'::character varying]::text[])),
    content text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    updated_at timestamp with time zone,

    CONSTRAINT recommends_pkey PRIMARY KEY (rec_id)
);

CREATE TABLE daily_recommends (
    daily_id bigint NOT NULL,
    date date NOT NULL,
    pet_id bigint NOT NULL,
    rec_id bigint,
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    updated_at timestamp with time zone,

    CONSTRAINT daily_recommends_pkey PRIMARY KEY (daily_id),
    CONSTRAINT fk_daily_recommends_rec_id FOREIGN KEY (rec_id) REFERENCES recommends(rec_id),
    CONSTRAINT fk_daily_recommends_pet_id FOREIGN KEY (pet_id) REFERENCES pets(pet_id)
);

CREATE TABLE life_records (
    life_record_id bigint NOT NULL,
    recorded_at date NOT NULL,
    sleeping_time integer,
    weight double precision,
    pet_id bigint NOT NULL,
    content text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    updated_at timestamp with time zone,

    CONSTRAINT life_records_pkey PRIMARY KEY (life_record_id),
    CONSTRAINT fk_life_records_pet_id FOREIGN KEY (pet_id) REFERENCES pets(pet_id)
);

CREATE TABLE feedings (
    feeding_id bigint NOT NULL,
    amount double precision NOT NULL,
    life_record_id bigint NOT NULL,
    meal_time timestamp with time zone NOT NULL,
    unit character varying NOT NULL CHECK (unit::text = ANY (ARRAY['GRAM'::character varying, 'SPOON'::character varying, 'SCOOP'::character varying, 'CUP'::character varying]::text[])),
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    updated_at timestamp with time zone,

    CONSTRAINT feedings_pkey PRIMARY KEY (feeding_id),
    CONSTRAINT fk_feeding_life_record_id FOREIGN KEY (life_record_id) REFERENCES life_records(life_record_id)
);

CREATE TABLE walkings (
    walking_id bigint NOT NULL,
    pace integer NOT NULL,
    end_time timestamp with time zone NOT NULL,
    life_record_id bigint NOT NULL,
    start_time timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    updated_at timestamp with time zone,

    CONSTRAINT walkings_pkey PRIMARY KEY (walking_id),
    CONSTRAINT fk_walkings_life_record_id FOREIGN KEY (life_record_id) REFERENCES life_records(life_record_id)
);

CREATE TABLE schedules (
    schedule_id bigint NOT NULL,
    pet_id bigint NOT NULL,
    user_id bigint NOT NULL,
    cycle_end date,
    cycle character varying CHECK (cycle::text = ANY (ARRAY['NONE'::character varying, 'WEEK'::character varying, 'TWO_WEEK'::character varying, 'ONE_MONTH'::character varying, 'THREE_MONTH'::character varying, 'SIX_MONTH'::character varying, 'YEAR'::character varying]::text[])),
    name character varying NOT NULL,
    is_done boolean NOT NULL,
    schedule_date date NOT NULL,
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    updated_at timestamp with time zone,

    CONSTRAINT schedules_pkey PRIMARY KEY (schedule_id),
    CONSTRAINT fk_schedules_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_schedules_pet_id FOREIGN KEY (pet_id) REFERENCES pets(pet_id)
);

CREATE TABLE noti_managements (
    noti_manage_id bigint NOT NULL,
    is_noti_all boolean NOT NULL,
    is_noti_schedule boolean NOT NULL,
    is_noti_service boolean NOT NULL,
    user_id bigint NOT NULL UNIQUE,
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    updated_at timestamp with time zone,

    CONSTRAINT noti_managements_pkey PRIMARY KEY (noti_manage_id),
    CONSTRAINT fk_noti_managements_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE service_notis (
    service_noti_id bigint NOT NULL,
    is_read boolean,
    target_id bigint,
    user_id bigint NOT NULL,
    content character varying NOT NULL,
    notification_type character varying NOT NULL CHECK (notification_type::text = ANY (ARRAY['LIKE'::character varying, 'COMMENT'::character varying, 'RECOMMEND'::character varying, 'REPORT_SUCCESS'::character varying, 'REPORT_FAIL'::character varying, 'REPORTED'::character varying, 'SCHEDULE'::character varying]::text[])),
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    updated_at timestamp with time zone,

    CONSTRAINT service_notis_pkey PRIMARY KEY (service_noti_id),
    CONSTRAINT fk_service_notis_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE schedule_notis (
    schedule_noti_id bigint NOT NULL,
    user_id bigint NOT NULL,
    content character varying NOT NULL,
    schedule_id bigint NOT NULL UNIQUE,
    is_read boolean,
    noti_date date NOT NULL,
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    updated_at timestamp with time zone,

    CONSTRAINT schedule_notis_pkey PRIMARY KEY (schedule_noti_id),
    CONSTRAINT fk_schedule_notis_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_schedule_notis_schedule_id FOREIGN KEY (schedule_id) REFERENCES schedules(schedule_id)
);

CREATE TABLE reports (
    report_id bigint NOT NULL,
    reported_at timestamp with time zone,
    reported_id bigint NOT NULL,
    reporter_id bigint NOT NULL,
    content_id bigint NOT NULL,
    category character varying NOT NULL CHECK (category::text = ANY (ARRAY['ABUSE', 'SPAM', 'FRAUD', 'ADULT_CONTENT'])),
    type character varying NOT NULL CHECK (type::text = ANY (ARRAY['BOARD', 'REPLY'])),
    admin_reason text,
    reason text NOT NULL,
    state character varying NOT NULL CHECK (state::text = ANY (ARRAY['PENDING', 'REJECT', 'ACCEPT'])),
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    updated_at timestamp with time zone,

    CONSTRAINT reports_pkey PRIMARY KEY (report_id),
    CONSTRAINT fk_reports_reported_id FOREIGN KEY (reported_id) REFERENCES users(user_id),
    CONSTRAINT fk_reports_reporter_id FOREIGN KEY (reporter_id) REFERENCES users(user_id)
);

CREATE TABLE ai_analysis (
    analysis_id bigint NOT NULL,
    pet_id bigint NOT NULL,
    content text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    updated_at timestamp with time zone,

    CONSTRAINT ai_analysis_pkey PRIMARY KEY (analysis_id),
    CONSTRAINT fk_ai_analysis_pet_id FOREIGN KEY (pet_id) REFERENCES pets(pet_id)
);

CREATE TABLE standard (
    standard_id bigint NOT NULL,
    max_sleep integer NOT NULL,
    max_walk integer NOT NULL,
    max_weight real NOT NULL,
    min_sleep integer NOT NULL,
    min_walk integer NOT NULL,
    min_weight real NOT NULL,
    start_age integer NOT NULL,
    age character varying NOT NULL CHECK (age::text = ANY (ARRAY['INFANT'::character varying, 'ADULT'::character varying, 'SENIOR'::character varying]::text[])),
    size character varying NOT NULL CHECK (size::text = ANY (ARRAY['SMALL'::character varying, 'MEDIUM'::character varying, 'LARGE'::character varying]::text[])),
    breed character varying NOT NULL CHECK (breed::text = ANY (ARRAY['BEAGLE'::character varying, 'BICHON_FRISE'::character varying, 'BORDER_COLLIE'::character varying, 'BOXER'::character varying, 'BULLDOG'::character varying, 'CHIHUAHUA'::character varying, 'COCKER_SPANIEL'::character varying, 'DACHSHUND'::character varying, 'DOBERMAN'::character varying, 'FRENCH_BULLDOG'::character varying, 'GERMAN_SHEPHERD'::character varying, 'GOLDEN_RETRIEVER'::character varying, 'GREAT_DANE'::character varying, 'HUSKY'::character varying, 'JACK_RUSSELL'::character varying, 'LABRADOR'::character varying, 'MALTESE'::character varying, 'PAPILLON'::character varying, 'POMERANIAN'::character varying, 'POODLE'::character varying, 'PUG'::character varying, 'SAMOYED'::character varying, 'SHIBA_INU'::character varying, 'SHIH_TZU'::character varying, 'WELSH_CORGI'::character varying, 'YORKSHIRE_TERRIER'::character varying, 'MIX'::character varying]::text[])),
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    updated_at timestamp with time zone,

    CONSTRAINT standard_pkey PRIMARY KEY (standard_id)
);

CREATE TABLE vaccines (
    vaccine_id bigint NOT NULL,
    name character varying NOT NULL CHECK (name::text = ANY (ARRAY['DHPPL'::character varying, 'CORONAVIRUS'::character varying, 'KENNEL_COUGH'::character varying, 'RABIES'::character varying, 'INFLUENZA'::character varying]::text[])),
    additional_cycle integer NOT NULL,
    booster_count integer NOT NULL,
    booster_cycle integer NOT NULL,
    period integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    updated_at timestamp with time zone,

    CONSTRAINT vaccines_pkey PRIMARY KEY (vaccine_id)
);

CREATE TABLE vaccinations (
    vaccination_id bigint NOT NULL,
    vaccine_id bigint NOT NULL,
    vaccine_type character varying NOT NULL CHECK (vaccine_type::text = ANY (ARRAY['FIRST'::character varying, 'BOOSTER'::character varying, 'ADDITIONAL'::character varying]::text[])),
    count integer,
    vaccine_at date NOT NULL,
    pet_id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    updated_at timestamp with time zone,

    CONSTRAINT vaccinations_pkey PRIMARY KEY (vaccination_id),
    CONSTRAINT fk_vaccinations_vaccine_id FOREIGN KEY (vaccine_id) REFERENCES vaccines(vaccine_id),
    CONSTRAINT fk_vaccinations_pet_id FOREIGN KEY (pet_id) REFERENCES pets(pet_id)
);

CREATE SEQUENCE primary_sequence START WITH 10000;

DO $$
BEGIN
   IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'localmaster') THEN
       EXECUTE 'GRANT USAGE, SELECT, UPDATE ON SEQUENCE public.primary_sequence TO localmaster';
END IF;
   IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'anon') THEN
       EXECUTE 'GRANT USAGE, SELECT, UPDATE ON SEQUENCE public.primary_sequence TO anon';
END IF;
   IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'authenticated') THEN
       EXECUTE 'GRANT USAGE, SELECT, UPDATE ON SEQUENCE public.primary_sequence TO authenticated';
END IF;
   IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'service_role') THEN
       EXECUTE 'GRANT USAGE, SELECT, UPDATE ON SEQUENCE public.primary_sequence TO service_role';
END IF;
END$$;