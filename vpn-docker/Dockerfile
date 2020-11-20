FROM x11docker/xfce

ARG EXTRA_DEPS

RUN apt-get update -y
RUN apt-get install -y openvpn dialog python3-pip python3-setuptools sudo procps
RUN pip3 install protonvpn-cli

RUN apt-get install -y $EXTRA_DEPS

RUN echo "%users  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/users

COPY start.sh /bin/start.sh

RUN chmod +x /bin/start.sh

ENTRYPOINT ["/bin/start.sh"]
