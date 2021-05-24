#!/bin/bash

if [ -f .env ]; then
    source .env
else
    echo "Prepare .env file before deploying"
    exit 1
fi


aws cloudformation \
deploy \
--template-file cloudformation.yml \
--stack-name devpi-test \
--capabilities CAPABILITY_NAMED_IAM \
--parameter-overrides \
"DevpiPassword=$DEVPI_PASSWORD" \
"LdapUrl=$LDAP_URL" \
"LdapUserTemplate=$LDAP_USER_TEMPLATE" \
"LdapGroupBase=$LDAP_GROUP_BASE"
