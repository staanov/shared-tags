FROM postgres:latest
ENV POSTGRES_DB=shared_tags_db
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=yourpassword
COPY scripts/init.sql /docker-entrypoint-initdb.d/
