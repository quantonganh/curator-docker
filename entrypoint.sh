#!/bin/bash

mkdir -p /root/.curator/actions
envsubst < curator.tpl > /root/.curator/curator.yml && rm -f curator.tpl
envsubst < delete_indices.tpl > /root/.curator/actions/delete_indices.yml && rm -f delete_indices.tpl

/usr/local/bin/wait-for-it.sh ${ELASTICSEARCH_CLEANUP_HOST}:${ELASTICSEARCH_CLEANUP_PORT} -t ${ELASTICSEARCH_CLEANUP_WAIT_TIMEOUT} -- /usr/local/bin/curator "$@"
