FROM debian

RUN apt update && apt install -y golang git tcpdump

WORKDIR /app

COPY ./Mirai-Source-Code/mirai/cnc /app/cnc

RUN go get github.com/mattn/go-shellwords
RUN go get github.com/go-sql-driver/mysql
RUN go build -o debug/cnc cnc/*.go

CMD ["./debug/cnc"]