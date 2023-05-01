FROM ubuntu:latest


### https://github.com/steamcmd/docker/blob/master/dockerfiles/ubuntu-22/Dockerfile

# Set environment variables
ENV USER root
ENV HOME /root

# Set working directory
WORKDIR $HOME

# Insert Steam prompt answers
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo steam steam/question select "I AGREE" | debconf-set-selections \
    && echo steam steam/license note '' | debconf-set-selections

# Update the repository and install SteamCMD
ARG DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386 \
    && apt-get update -y \
    && apt-get install -y --no-install-recommends ca-certificates locales steamcmd sqlite3 \
    && rm -rf /var/lib/apt/lists/*

# Add unicode support
RUN locale-gen en_US.UTF-8
ENV LANG 'en_US.UTF-8'
ENV LANGUAGE 'en_US:en'

# Create symlink for executable
RUN ln -s /usr/games/steamcmd /usr/bin/steamcmd

# Update SteamCMD and install Rust
RUN steamcmd \
    +force_install_dir /steamcmd/rust \
    +login anonymous \
    +quit

###

COPY ./steamcmd /steamcmd
COPY ./check-update.sh ./check-update.sh
COPY ./start.sh ./start.sh

EXPOSE 28015
EXPOSE 28016
EXPOSE 28083

RUN ./check-update.sh
CMD ./start.sh
