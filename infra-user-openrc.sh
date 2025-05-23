# Clear any old environment that may conflict.
for key in $( set | awk '{FS="="}  /^OS_/ {print $1}' ); do unset $key ; done
export OS_PROJECT_DOMAIN_NAME=Default
export OS_USER_DOMAIN_NAME=Default
export OS_PROJECT_NAME=infrastructure
export OS_USERNAME=infra_user
export OS_PASSWORD=INFRA_PASSWORD
export OS_AUTH_URL=http://192.168.0.5:5000
export OS_INTERFACE=internal
export OS_ENDPOINT_TYPE=internalURL
