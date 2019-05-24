FROM postgres:alpine

# Base env variables used by https://github.com/prodrigestivill/docker-postgres-backup-local script
ENV POSTGRES_DB **None**
ENV POSTGRES_DB_FILE **None**
ENV POSTGRES_HOST **None**
ENV POSTGRES_PORT 5432
ENV POSTGRES_USER **None**
ENV POSTGRES_USER_FILE **None**
ENV POSTGRES_PASSWORD **None**
ENV POSTGRES_PASSWORD_FILE **None**
ENV POSTGRES_EXTRA_OPTS '-Z9'
ENV SCHEDULE '@daily'
ENV BACKUP_DIR '/backups'
ENV BACKUP_KEEP_DAYS 7
ENV BACKUP_KEEP_WEEKS 4
ENV BACKUP_KEEP_MONTHS 6
ENV HEALTHCHECK_PORT 8080

# Copy crontab and backup files into image
ADD crontab /crontab
ADD backup.sh /backup.sh
COPY entry.sh /entry.sh

# Make backup and entry script executable
RUN chmod 755 /backup.sh /entry.sh

# Add backup cronjob 
RUN /usr/bin/crontab /crontab

# Entrypoint that starts the cronjobs
CMD ["/entry.sh"]
