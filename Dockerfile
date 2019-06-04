FROM phusion/baseimage:0.11

# maintained by Nathan
MAINTAINER nmcaullay <nmcaullay@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables.
ENV HOME /root

#Create the HTS user (9981), and add to user group (9981)
#RUN groupadd -g 1000 hts
RUN useradd -u 1009 -g 100 users

# Install dependencies, build and install tvheadend
RUN apt-get update -qq && \
    apt-get install -qy \
    build-essential pkg-config libssl-dev git bzip2 wget cmake \
    libavahi-client-dev zlib1g-dev libcurl4-gnutls-dev python \
    liburiparser1 liburiparser-dev gettext \
    autoconf automake libtool \
    libargtable2-dev libavformat-dev ffmpeg

RUN cd /tmp \
RUN git clone https://github.com/ZoneMinder/ZoneMinder /tmp/ZoneMinder \
RUN cd /tmp/ZoneMinder \
RUN git checkout 1.32.3
RUN ls /tmp/ZoneMinder
# RUN git checkout master
# RUN git pull origin master

ENV OS=ubuntu
ENV DIST=xenial
RUN /tmp/ZoneMinder/utils/packpack/startpackpack.sh
