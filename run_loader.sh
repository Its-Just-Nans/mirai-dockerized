#!/bin/sh

cd /app/loader_dir || exit

cat /app/ip.txt | /app/loader_app
