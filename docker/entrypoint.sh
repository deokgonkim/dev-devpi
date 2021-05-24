#!/usr/bin/env bash
set -e

[[ -f $DEVPISERVER_SERVERDIR/.serverversion ]] || initialize=yes

# Properly shutdown devpi server
shutdown() {
    devpi-server --stop  # Kill server
    kill -SIGTERM $TAIL_PID  # Kill log tailing
}

trap shutdown SIGTERM SIGINT

if [ -f $DEVPISERVER_SERVERDIR/.serverversion ]; then
  echo "Using existing directory"
else
  echo "Initializing devpi for the first time"
  devpi-init
fi

# configuring environment variables
echo "# /devpi-ldap.yml"
VARS='$LDAP_URL:$LDAP_USER_TEMPLATE:$LDAP_GROUP_BASE'
envsubst "$VARS" < /devpi-ldap.yml > /tmp/devpi-ldap.yml && cat /tmp/devpi-ldap.yml > /devpi-ldap.yml && cat /devpi-ldap.yml


# Need $DEVPISERVER_SERVERDIR
# devpi-server --start \
# --host 0.0.0.0 \
# --port $DEVPI_PORT \
# --theme $DEVPI_THEME \
# --ldap-config /devpi-ldap.yml \
# --debug
devpi-server \
--host 0.0.0.0 \
--port $DEVPI_PORT \
--ldap-config /devpi-ldap.yml \
--debug &

DEVPI_PID=$!

# waiting devpi server to be ready
echo "Sleeping for 30 seconds"
sleep 30

# run nginx web server
nginx

# DEVPI_LOGS=$DEVPISERVER_SERVERDIR/.xproc/devpi-server/xprocess.log

devpi use http://localhost:$DEVPI_PORT
if [[ $initialize = yes ]]; then
  # Set root password
  devpi login root --password=''
  devpi user -m root password="${DEVPI_PASSWORD}"
  # create default repository dgkim/staging, dgkim/stable
  devpi user -c dgkim email=developer@deokgon.kim password=${DEVPI_PASSWORD}
  devpi index -c dgkim/staging bases=root/pypi volatile=False acl_upload=:dgkimnet
  devpi index -c dgkim/stable bases=root/pypi volatile=True acl_upload=:dgkimnet
  # devpi index -y -c public pypi_whitelist='*'
fi
# Authenticate for later commands
devpi login root --password="${DEVPI_PASSWORD}"

tail -f /var/log/nginx/access.log &
tail -f /var/log/nginx/error.log &
# tail -f $DEVPI_LOGS &
TAIL_PID=$!

# Wait until tail is killed
wait $TAIL_PID

# Set proper exit code
wait $DEVPI_PID
EXIT_STATUS=$?
