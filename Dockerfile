FROM lsiobase/alpine:3.9

# maintained by Nathan
MAINTAINER nmcaullay <nmcaullay@gmail.com>

ENV HOME="/config"

#Create the HTS user (9981), and add to user group (9981)
#RUN groupadd -g 1000 hts
RUN useradd -u 1009 -g 100 users

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache \
	zoneminder mysql mysql-client lighttpd php5-fpm php5-pdo php5-pdo_mysql

#RUN cd /tmp \
#RUN git clone https://github.com/ZoneMinder/ZoneMinder /tmp/ZoneMinder
#RUN cd /tmp/ZoneMinder
#RUN git checkout 1.32.3
#RUN ls /tmp/ZoneMinder
# RUN git checkout master
# RUN git pull origin master
#ENV OS=ubuntu
#ENV DIST=xenial
#RUN /tmp/ZoneMinder/utils/packpack/startpackpack.sh
