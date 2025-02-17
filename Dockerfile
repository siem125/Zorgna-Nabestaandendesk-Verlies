# Use the official PostgreSQL image
FROM postgres:latest

# Set up environment variables (hardcoded values)
ENV POSTGRES_USER=Admin
ENV POSTGRES_PASSWORD=9W7d74zABBEG
ENV POSTGRES_DB=Nabestaandendesk-Verlies

# Set working directory for SQL initialization scripts
WORKDIR /docker-entrypoint-initdb.d/

# Copy the SQL file(s) from the Database folder
COPY Database/*.sql /docker-entrypoint-initdb.d/

# Expose PostgreSQL default port
EXPOSE 5432
