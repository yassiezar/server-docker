###################################
#Build stage
#FROM golang:1.12-alpine3.9 AS build-env

#Build deps
#RUN apk --no-cache add build-base git

#Setup repo
#RUN go get github.com/odise/go-cron
#WORKDIR ${GOPATH}/src/github.com/odise/go-cron
#RUN go get github.com/michaloo/go-cron
#WORKDIR ${GOPATH}/src/github.com/michaloo/go-cron

#RUN go build -o go-cron go-cron.go
#RUN go build -o go-cron bin/go-cron.go

#FROM postgres:alpine

#COPY --from=build-env /go/src/github.com/odise/go-cron/go-cron /usr/local/bin/go-cron 
#COPY --from=build-env /go/src/github.com/michaloo/go-cron/go-cron /usr/local/bin/go-cron 
#RUN chmod a+x /usr/local/bin/go-cron 

#RUN set -x \
#	&& apk update && apk add ca-certificates curl \
#	&& apk del ca-certificates 

#ENV POSTGRES_DB **None**
#ENV POSTGRES_DB_FILE **None**
#ENV POSTGRES_HOST **None**
#ENV POSTGRES_PORT 5432
#ENV POSTGRES_USER **None**
#ENV POSTGRES_USER_FILE **None**
#ENV POSTGRES_PASSWORD **None**
#ENV POSTGRES_PASSWORD_FILE **None**
#ENV POSTGRES_EXTRA_OPTS '-Z9'
#ENV SCHEDULE '@daily'
#ENV BACKUP_DIR '/backups'
#ENV BACKUP_KEEP_DAYS 7
#ENV BACKUP_KEEP_WEEKS 4
#ENV BACKUP_KEEP_MONTHS 6
#ENV HEALTHCHECK_PORT 8080

#COPY backup.sh /backup.sh

#ADD crontab /etc/cron.d/backup
#RUN chmod 0644 /etc/cron.d/backup
#RUN crontab /etc/cron.d/backup
#RUN touch /var/log/cron.log

#VOLUME /backups

#RUN cron && tail -f /var/log/cron.log

#CMD ["/usr/sbin/crond"]

#ENTRYPOINT ["/bin/sh", "-c"]
#CMD ["exec /usr/local/bin/go-cron -s \"$SCHEDULE\" -p \"$HEALTHCHECK_PORT\" -- /backup.sh"]
#CMD ["exec /usr/local/bin/go-cron \"$SCHEDULE\" -- /backup.sh"]

#HEALTHCHECK --interval=5m --timeout=3s \
#    CMD curl -f "http://localhost:$HEALTHCHECK_PORT/" || exit 1

FROM postgres:alpine

ADD crontab /crontab
ADD backup.sh /backup.sh
COPY entry.sh /entry.sh
RUN chmod 755 /backup.sh /entry.sh
RUN /usr/bin/crontab /crontab

CMD ["/entry.sh"]
