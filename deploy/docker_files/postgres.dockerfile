FROM sameersbn/postgresql:9.6-2
ADD pgsetup.sql /docker-entrypoint-initdb.d/

