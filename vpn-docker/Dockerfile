FROM x11docker/xfce

RUN apt-get update -y && apt-get install -y gpg wget

RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
RUN wget -O- https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor > /etc/apt/trusted.gpg.d/google.gpg

RUN apt-get update -y
RUN apt-get install -y openvpn procps google-chrome-stable

RUN echo 'user:*:1000:100::/home/user:/bin/sh' >>/etc/passwd
RUN sed -i 's|root:.*|root:\*:0:0::/root:/bin/sh|' /etc/passwd

COPY start.sh /bin/start.sh

RUN chmod +x /bin/start.sh
USER user
WORKDIR /home/user
ENTRYPOINT [ "/bin/start.sh" ]
