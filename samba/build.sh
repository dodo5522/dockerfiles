#!/usr/bin/env bash

git submodule update --init

source .env.sample
docker build -t "${IMAGE}" -f samba/Dockerfile samba

