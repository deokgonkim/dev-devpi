#!/bin/bash

DEVPI_PASSWORD=$(./passhash.py)

echo "export DEVPI_PASSWORD=${DEVPI_PASSWORD}" > .env

echo "LDAP_URL (ex. ldaps://ldap.dgkim.net) : "; read LDAP_URL; echo "export LDAP_URL=$LDAP_URL" >> .env
echo "LDAP_USER_TEMPLATE (ex. uid={username},ou=Users,dc=dgkim,dc=net) : "; read LDAP_USER_TEMPLATE; echo "export LDAP_USER_TEMPLATE=$LDAP_USER_TEMPLATE" >> .env
echo "LDAP_GROUP_BASE (ex. ou=Groups,dc=dgkim,dc=net) : "; read LDAP_GROUP_BASE; echo "export LDAP_GROUP_BASE=$LDAP_GROUP_BASE" >> .env