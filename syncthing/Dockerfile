FROM debian:buster-slim
#FROM debian:sid-slim
#FROM ubuntu:focal

RUN apt-get update && apt-get install -y curl
RUN curl -s -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | tee /etc/apt/sources.list.d/syncthing.list
RUN printf "Package: *\nPin: origin apt.syncthing.net\nPin-Priority: 990\n" | tee /etc/apt/preferences.d/syncthing
RUN apt-get update && apt-get install -y syncthing
