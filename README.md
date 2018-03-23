# deploy zookeeper cluster with bosh-lite

## resource
[tutorial](http://bosh.io/docs/bosh-lite.html#deploy)

## troubleshoot
- more logs: `export BOSH_LOG_LEVEL=debug`

## create bosh director
- create bosh environment: `$ bosh create-env bosh.yml --state generated/state.json -o cpi.yml -o outbound-network.yml -o bosh-lite.yml -o bosh-lite-runc.yml -o jumpbox-user.yml --vars-store generated/creds.yml -l variables.yml`
   - idempotently converge VM to desired state in bosh.yml
   - `-o`: include manifest
- set alias: `$ bosh alias-env vbox -e 192.168.50.6 --ca-cert <(bosh int ./creds.yml --path /director_ssl/ca)`
- log in:
```
export BOSH_CLIENT=admin
export BOSH_CLIENT_SECRET=`bosh int ./creds.yml --path /admin_password`
```
- set alias
- log into bosh director

## create bosh release
- create a release: `$ bosh create-release`
- upload a release to bosh director: `$ bosh -e <envt> upload-release`
- upload a stemcell downloaded from bosh.io: `$ bosh -e <envt> upload-stemcell <stemcell package>`

## run a bosh deployment
- deploy: `$ bosh -e <envt> -d <deployment name> deploy manifest.yml`
- list deployed instances: `$ bosh -e <envt> instances`

## [local] add route to VirtualBox network
```
$ sudo route add -net 10.244.0.0/16 192.168.50.6
# for webapp running on :8080, can `$ curl 10.244.0.2:8080`
```

# AWS

## deploy jumpbox on AWS
1. create ssh key using `ssh-keygen`
1. use `aws_key_pair` resource. must include public key.
1. create ec2 instance using above key pair.
1. ssh into jumpbox: `ssh -i ~/.ssh/aws ubuntu@$(terraform output jumpbox_ip)`
