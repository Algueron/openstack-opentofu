# OpenTofu on Openstack
This project intends to deploy a virtual machine running OpenTofu on an Openstack cloud deployed using Kolla (see [this repository](https://github.com/Algueron/openstack-home)).
The instructions must be executed on the deployment node.

## Login

- Switch to Virtual env
````bash
source ~/kolla/venv/bin/activate
````

- Log as Openstack admin user
````bash
. /etc/kolla/admin-openrc.sh
````

## Project and user creation

- Create the infrastructure project
````bash
openstack project create --description 'Infrastructure-related Hosts' infrastructure --domain default
````

- Generate a random password
````bash
export INFRA_PASSWORD=$(openssl rand -base64 18)
````

- Create a Infrastructure user
````bash
openstack user create --project infrastructure --password $INFRA_PASSWORD infra_user
````

- Assign the role member to terraform
````bash
openstack role add --user infra_user --project infrastructure member
````

- Download the user's [credentials file](infra-user-openrc.sh)
````bash
wget https://raw.githubusercontent.com/Algueron/openstack-opentofu/main/infra-user-openrc.sh
````

- Fill the password
````bash
sed -i -e "s~INFRA_PASSWORD~$INFRA_PASSWORD~g" infra-user-openrc.sh
````
