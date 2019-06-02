FROM phusion/baseimage:0.9.22

# maintained by Nathan
MAINTAINER nmcaullay <nmcaullay@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables.
ENV HOME /root

#Create the HTS user (9981), and add to user group (9981)
#RUN groupadd -g 1000 hts
RUN useradd -u 1009 -g 100 users
