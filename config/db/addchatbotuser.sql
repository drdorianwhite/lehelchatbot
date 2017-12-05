create extension pgcrypto;
insert into public.users (username, password_hash, inserted_at, updated_at) values ('chatbot', crypt('insecure123', gen_salt('bf')), current_timestamp, current_timestamp);