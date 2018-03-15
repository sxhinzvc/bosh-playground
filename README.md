# deploy zookeeper cluster with bosh-lite

[tutorial](http://bosh.io/docs/bosh-lite.html#deploy)

export BOSH_LOG_LEVEL=debug

`$ bosh create-env bosh.yml --state generated/state.json -o cpi.yml -o outbound-network.yml -o bosh-lite.yml -o bosh-lite-runc.yml -o jumpbox-user.yml --vars-store generated/creds.yml -l variables.yml`
- idempotently converge VM to desired state in bosh.yml
- `-o`: include manifest
-

```
$ bosh alias-env vbox -e 192.168.50.6 --ca-cert <(bosh int ./creds.yml --path /director_ssl/ca)

export BOSH_CLIENT=admin
export BOSH_CLIENT_SECRET=`bosh int ./creds.yml --path /admin_password`

```
- set alias
- log into bosh director


