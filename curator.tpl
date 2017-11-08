---
# Remember, leave a key empty if there is no value.  None will be a string,
# not a Python "NoneType"
client:
  hosts:
    - $ELASTICSEARCH_CLEANUP_HOST
  port: $ELASTICSEARCH_CLEANUP_PORT
  url_prefix:
  use_ssl: $ELASTICSEARCH_CLEANUP_USE_SSL
  certificate:
  client_cert:
  client_key:
  aws_key:
  aws_secret_key:
  aws_region:
  ssl_no_validate: $ELASTICSEARCH_CLEANUP_SSL_NO_VALIDATE
  http_auth: $ELASTICSEARCH_CLEANUP_HTTP_AUTH
  timeout: 30
  master_only: False

logging:
  loglevel: INFO
  logfile:
  logformat: default
  blacklist: ['elasticsearch', 'urllib3']
