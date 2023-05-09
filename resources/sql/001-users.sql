-- CREATE SCHEMA tic;

-- Company
-- CREATE TABLE tic.company
-- (
--     id              integer NOT NULL,
--     company_name    text    NOT NULL,
--     company_address text    NOT NULL,
--     UNIQUE (id),
--     PRIMARY KEY (id)
-- );

-- CREATE SEQUENCE tic.company_id_seq
--     AS integer
--     START WITH 1
--     INCREMENT BY 1;
-- ALTER SEQUENCE tic.company_id_seq OWNED BY tic.company.id;

-- ALTER TABLE ONLY tic.company
--     ALTER COLUMN id SET DEFAULT nextval('tic.company_id_seq'::regclass);

-- CREATE TYPE tic.admin_user_type AS ENUM ('ADMIN','MERCHANT');

-- -- Either event manager or admin of the platform
-- CREATE TABLE tic.admin_panel_user
-- (
--     id            integer                                NOT NULL,
--     first_name    text                                   NOT NULL,
--     last_name     text                                   NOT NULL,
--     email         text                                   NOT NULL,
--     user_type     tic.admin_user_type                    NOT NULL,
--     password_hash text                                   NOT NULL,
--     firebase_uid  text                                   NOT NULL,
--     created_at    timestamp with time zone DEFAULT now() NOT NULL,
--     created_by    integer,
--     company_id    integer                                NOT NULL,
--     UNIQUE (email),
--     UNIQUE (firebase_uid),
--     PRIMARY KEY (id)
-- );

-- CREATE SEQUENCE tic.admin_panel_user_id_seq
--     AS integer
--     START WITH 1
--     INCREMENT BY 1;
-- ALTER SEQUENCE tic.admin_panel_user_id_seq OWNED BY tic.admin_panel_user.id;

-- ALTER TABLE ONLY tic.admin_panel_user
--     ALTER COLUMN id SET DEFAULT nextval('tic.admin_panel_user_id_seq'::regclass);

-- ALTER TABLE ONLY tic.admin_panel_user
--     ADD CONSTRAINT admin_panel_user_company_id_fkey FOREIGN KEY (company_id)
--     REFERENCES tic.company (id) ON UPDATE RESTRICT ON DELETE RESTRICT;

-- ALTER TABLE ONLY tic.admin_panel_user
--     ADD CONSTRAINT admin_panel_user_created_by_fkey FOREIGN KEY (created_by)
--     REFERENCES tic.admin_panel_user (id) ON UPDATE RESTRICT ON DELETE RESTRICT;

-- Customers
-- CREATE TABLE tic.user
-- (
--     id              integer                                NOT NULL,
--     first_name      text                                   NOT NULL,
--     last_name       text                                   NOT NULL,
--     phone_number    text                                   NOT NULL,
--     email           text                                   NOT NULL,
--     password_hash   text                                   NOT NULL,
--     firebase_uid    text                                   NOT NULL,
--     created_at      timestamp with time zone DEFAULT now() NOT NULL,
--     created_by      integer,
--     comment         text,
--     covid_negative  boolean,
--     UNIQUE (email),
--     UNIQUE (firebase_uid),
--     PRIMARY KEY (id)
-- );

-- CREATE SEQUENCE tic.user_id_seq
--     AS integer
--     START WITH 1
--     INCREMENT BY 1;
-- ALTER SEQUENCE tic.user_id_seq OWNED BY tic.user.id;

-- ALTER TABLE ONLY tic.user
--     ALTER COLUMN id SET DEFAULT nextval('tic.user_id_seq'::regclass);

-- ALTER TABLE ONLY tic.user
--     ADD CONSTRAINT user_created_by_fkey FOREIGN KEY (created_by)
--     REFERENCES tic.admin_panel_user (id) ON UPDATE RESTRICT ON DELETE RESTRICT;

--Password Token
-- CREATE TABLE tic.password_token
-- (
--     id               integer NOT NULL,
--     token            text NOT NULL,
--     customer         integer NOT NULL,
--     expiration_date  timestamp with time zone DEFAULT now() NOT NULL,
--     UNIQUE (token),
--     UNIQUE (customer),
--     PRIMARY KEY (id)
-- );

-- ALTER TABLE ONLY tic.password_token
--     ADD CONSTRAINT password_token_customer_fkey FOREIGN KEY (customer)
--     REFERENCES tic.user (id) ON UPDATE CASCADE ON DELETE CASCADE;

-- CREATE SEQUENCE tic.password_token_id_seq
--     AS integer
--     START WITH 1
--     INCREMENT BY 1;
-- ALTER SEQUENCE tic.password_token_id_seq OWNED BY tic.password_token.id;

-- ALTER TABLE ONLY tic.password_token
--     ALTER COLUMN id SET DEFAULT nextval('tic.password_token_id_seq'::regclass);