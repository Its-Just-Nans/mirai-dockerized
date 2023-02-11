# SR2I-project-mirai-docker

## Source code

We do not own the source code of the MIRAI botnet, the source code, as mentionned in the commit comes from [https://github.com/jgamblin/Mirai-Source-Code](https://github.com/jgamblin/Mirai-Source-Code)

Note that we modifed some parts.

## Modified parts

Modified parts are mentionned in the 3rd commit of the repo, here is little explations :

- `Mirai-Source-Code/loader/src/main.c` we changed the IP to the correct host (where the mirai malware is, downladable by http (`wget`) or ftp (`tftp`))
- `Mirai-Source-Code/loader/src/server.c` we assume that there is a little error in the function `connection_consume_iacs()` (it ends too soon) so we patched it by running it twice
- `Mirai-Source-Code/loader/src/telnet_info.c` we force using a fake `dbg` arch (see below for explanations)
- `Mirai-Source-Code/mirai/bot/main.c` as we are not using domain name (we don't need the DNS resolv_lookup), we create our own `entries` variable containing the correct IP
- `Mirai-Source-Code/mirai/bot/table.c` we updated the IP of the CNC and the scanner using `./enc string <ip>`
- `Mirai-Source-Code/mirai/cnc/main.go` we changed creads of the SQL database because we are running the database out of the CNC (see the docker-compose.yml)

## Used docker

- `loader` attacks bots by forcing them to load and execute mirai code
- `reporter` runs the `scanListen` program, not really used here because the Mirai code is in DEBUG mode
- `host` hosts mirai code as a http server (or tftp - see explanations)
- `cnc` runs the CNC go programs
- `db` SQL database for CNC
- `bot1` simulates a bot, runs a telnet server, has `busybox` and `wget` installed
- `bot2` simulates a bot, runs a telnet server, has `busybox` and `wget` installed

## Explanations

## Loader

We give some ips and creds to the loader. The loader connect to these and tries to run some commands. To determine the arch of the target, there are multiple option that we are not using in this repo. The arch is used to determine which mirai code to send.

- How the loader determine the arch ? It can determine the arch by analyzing the binary of the `/bin/echo` programs (it contains a specific architecture signature)
- Why are we using a forced architecture ? Because we want to upload a debug version of mirai, so the extension is `dbg` (cleary we could just change the extension in the host but it's less fun - also sometimes the loader has a hard time to determine the arch so it's easier to fix the arch)

After determining the arch, the loader tries to download the binary by using `wget` or `tftp` (depending which is installed).

Note that are tftpd configuration on the host server is acting weird so we only use a apache2 server (you can try and tell us by making a PR/issue !)

After downlading it, the loader run the mirai code.

## Mirai code

In our example, the mirai code only connects to the CNC (for now ?)

Normally the mirai code is also contacting the Scanner and attcking, but as we use a debug version of mirai, the scan and attack are not launched

A good idea would be that @3-dd-1 make some commits to run a non-debug version of mirai code :)

## Run

- You need to have docker (and docker compose installed)
- The project is using the `ip.txt` file to know who to attack, it's easier to only put one bot (one line) to see the attack

```sh
docker compose up --build
```

## Testing

During testing, we recommmend to use the `--force-recreate` option of docker compose

```sh
docker compose up --build --force-recreate
```
