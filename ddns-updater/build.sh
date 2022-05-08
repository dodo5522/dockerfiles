#!/usr/bin/env bash

source .env.sample
docker build -t "${IMAGE}" .

