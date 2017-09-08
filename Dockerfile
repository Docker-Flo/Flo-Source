# ----------------------------------
# Environment: Source Engine
# ----------------------------------
FROM        ubuntu:16.04

MAINTAINER  Fonix Hardcastle, <me@fonix.online>
ENV         DEBIAN_FRONTEND noninteractive
# Install Dependencies
RUN         dpkg --add-architecture i386 \
            && apt-get update \
            && apt-get upgrade -y \
            && apt-get install -y tar curl gcc g++ libglew-dev libclutter-gst-2.0-0 libclutter-gtk-1.0-0 libclutter-1.0-0 libgl1-mesa-dri libglu1 lib32gcc1 lib32tinfo5 lib32z1 lib32stdc++6 libtinfo5:i386 libncurses5:i386 libcurl3-gnutls:i386 \
            && useradd -m -d /home/container container

USER        container
ENV         HOME /home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
