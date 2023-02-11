# SR2I-project-mirai-docker

## Source code

We do not own the source code of the MIRAI botnet, the source code, as mentionned in the commit comes from [https://github.com/jgamblin/Mirai-Source-Code](https://github.com/jgamblin/Mirai-Source-Code)

Note that we modifed some parts.

## Modified parts

Modified parts are mentionned in the 3rd commit of the repo, here is little explations :

- `Mirai-Source-Code/loader/src/main.c` we changed the IP to the correct host (where the mirai malware is, downladable by http (`wget`) or ftp (`tftp`))
- `Mirai-Source-Code/loader/src/server.c` we assume that there is a little error in the function `connection_consume_iacs` (it ends too soon) so we patched it by running it twice
- `Mirai-Source-Code/mirai/bot/main.c` as we are not using domain name (we don't need the DNS resolv_lookup), we create our own `entries` variable containing the correct IP
- `Mirai-Source-Code/mirai/bot/table.c` we updated the IP of the CNC and the scanner using `./enc string <ip>`
- `Mirai-Source-Code/mirai/cnc/main.go` we changed creads of the SQL database because we are running the database out of the CNC (see the docker-compose.yml)

## Run

- You need to have docker (and docker compose installed)

```sh
docker compose up --build
```

## Testing

During testing, we recommmend to use the `--force-recreate` option of docker compose

```sh
docker compose up --build --force-recreate
```
