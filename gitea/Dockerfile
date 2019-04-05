FROM alpine:3.9

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
#    sudo \
    tzdata

WORKDIR /app/gitea/
RUN wget -O /app/gitea/gitea https://github.com/go-gitea/gitea/releases/download/v1.8.0-rc1/gitea-1.8.0-rc1-linux-arm-6
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
#  echo "git:jaycee" | chpasswd
#RUN adduser git sudo
#RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ENV USER git
ENV GITEA_CUSTOM /data/gitea

COPY gitea/docker /
RUN ln -s /app/gitea/gitea /usr/local/bin/gitea

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["/bin/s6-svscan", "/etc/s6"]
