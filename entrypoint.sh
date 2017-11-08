#!/bin/bash

mkdir -p /root/.curator/actions
envsubst < curator.tpl > /root/.curator/curator.yml && rm -f curator.tpl
envsubst < delete_indices.tpl > /root/.curator/actions/delete_indices.yml && rm -f delete_indices.tpl

/usr/local/bin/curator "$@"
