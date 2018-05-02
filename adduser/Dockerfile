FROM ubuntu:16.04

LABEL  linhos "linhos@126.com"

RUN apt-get update && apt-get install sudo -y \
	&& adduser --disabled-password --gecos '' linhos \
	&& adduser linhos sudo \
	&& echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
	&& apt-get clean \
    && rm -rf /var/lib/apt/lists/ /tmp/* /var/tmp/*

USER linhos
