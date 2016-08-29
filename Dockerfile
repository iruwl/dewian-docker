FROM debian:latest
MAINTAINER Khairul Anwar <irul.sylva@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Update apt source list
RUN mv /etc/apt/sources.list /etc/apt/sources.list.orig
RUN echo "#KAMBING-UI\n\
deb http://kambing.ui.ac.id/debian/ jessie main contrib non-free\n\
deb http://kambing.ui.ac.id/debian/ jessie-updates main contrib non-free\n\
deb http://kambing.ui.ac.id/debian-security/ jessie/updates main contrib non-free" \
>> /etc/apt/sources.list

# Use apt proxy
# RUN echo 'Acquire::http { Proxy "http://172.17.0.1:3142"; };' >> /etc/apt/apt.conf.d/00proxy

RUN \
  apt-get update && \
  apt-get install -yq apt-utils && \
  apt-get install -yq sudo nano
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /root

ADD run.sh /root/run.sh
CMD ["./run.sh"]
