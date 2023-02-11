FROM debian

RUN apt update && apt install -y wget telnet tcpdump net-tools telnetd xinetd busybox
RUN (echo 'root'; echo 'root') | passwd root


RUN echo "service telnet \n\
{\n \
disable = no \
flags = REUSE \n \
socket_type = stream \n \
wait = no \n \
user = root \n \
server = /usr/sbin/in.telnetd \n \
log_on_failure += USERID \n \
}" | tee -a /etc/xinetd.d/telnet && rm -f /etc/securetty



COPY ./bot.sh /app/

CMD ["bash", "/app/bot.sh"]