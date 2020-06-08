FROM alpine:3.9
LABEL maintainer="maintainers@gitea.io"

RUN apk --no-cache add \
    bash \
    wget \
    ca-certificates \
    curl \
    gettext \
    git \
    linux-pam \
    openssh \
    s6 \
    sqlite \
    su-exec \
    tzdata

WORKDIR /app/gitea/
RUN wget -O /app/gitea/gitea https://github.com/go-gitea/gitea/releases/download/v1.11.6/gitea-1.11.6-linux-arm-6
RUN chmod +x /app/gitea/gitea

RUN addgroup \
    -S -g 1001 \
    git && \
  adduser \
    -S -H -D \
    -h /data/git \
    -s /bin/bash \
    -u 1001 \
    -G git \
    git && \
  echo "git:$(dd if=/dev/urandom bs=24 count=1 status=none | base64)" | chpasswd

ENV USER git
ENV GITEA_CUSTOM /data/gitea

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["/bin/s6-svscan", "/etc/s6"]

COPY gitea/docker /
RUN ln -s /app/gitea/gitea /usr/local/bin/gitea
