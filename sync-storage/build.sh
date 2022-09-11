#!/usr/bin/env bash

set -eu

source env.sh
docker build -t "${IMAGE}" .

