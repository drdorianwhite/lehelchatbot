create database lehelchatbot;
grant all privileges on database lehelchatbot to postgres;
\c lehelchatbot;

CREATE SEQUENCE public.users_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 4
  CACHE 1;
ALTER TABLE public.users_id_seq
  OWNER TO postgres;

CREATE TABLE public.users
(
  id bigint NOT NULL DEFAULT nextval('users_id_seq'::regclass),
  username character varying(255) NOT NULL,
  password_hash character varying(255) NOT NULL,
  inserted_at timestamp without time zone NOT NULL,
  updated_at timestamp without time zone NOT NULL,
  CONSTRAINT users_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.users
  OWNER TO postgres;

  create extension pgcrypto;
insert into public.users (username, password_hash, inserted_at, updated_at) values ('chatbot', crypt('insecure123', gen_salt('bf')), current_timestamp, current_timestamp);



