FROM ubuntu:latest


### https://github.com/steamcmd/docker/blob/master/dockerfiles/ubuntu-22/Dockerfile

# Insert Steam prompt answers
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo steam steam/question select "I AGREE" | debconf-set-selections \
    && echo steam steam/license note '' | debconf-set-selections

# Update the repository and install SteamCMD
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
    && apt install -y software-properties-common \
    && add-apt-repository multiverse \
    && dpkg --add-architecture i386 \
    && apt-get update -y \
    && apt-get install -y lib32gcc-s1 steamcmd \
    && rm -rf /var/lib/apt/lists/*

# Add unicode support
ENV LANG 'en_US.UTF-8'
ENV LANGUAGE 'en_US:en'

# Update SteamCMD and install Rust
# RUN /usr/games/steamcmd \
#     +force_install_dir /steamcmd/rust \
#     +login anonymous \
#     +app_update 258550 \
#     +quit

###

ARG RUST_SERVER_IP
ARG RUST_SERVER_PORT
ARG RUST_RCON_WEB
ARG RUST_RCON_IP
ARG RUST_RCON_PORT
ARG RUST_RCON_PASSWORD
ARG RUST_SERVER_MAXPLAYERS
ARG RUST_SERVER_HOSTNAME
ARG RUST_SERVER_IDENTITY
ARG RUST_SERVER_LEVEL
ARG RUST_SERVER_SEED
ARG RUST_SERVER_WORLDSIZE
ARG RUST_SERVER_SAVEINTERVAL
ARG RUST_SERVER_DESCRIPTION
ARG RUST_SERVER_HEADERIMAGE
ARG RUST_SERVER_URL

COPY ./check-update.sh ./check-update.sh
COPY ./start.sh ./start.sh

EXPOSE 28015
EXPOSE 28016
EXPOSE 28082
EXPOSE 28083

RUN ./check-update.sh
CMD ./start.sh
