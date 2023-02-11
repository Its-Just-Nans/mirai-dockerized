FROM debian

RUN apt update && apt install -y golang git

WORKDIR /app

COPY ./Mirai-Source-Code/mirai/tools/scanListen.go /app/tools/scanListen.go

RUN go build -o debug/scanListen tools/scanListen.go

CMD ["./debug/scanListen"]