# kat-cloud
Infrastructure management scripts.

## Building an AMI
AMIs are defined for each node type, and are built using [packer](https://packer.io).


    packer build -only=amazon-ebs aws/ami/machines/orchestrator.json

## TODO

- components are installed but have not yet been configured to work together
- create a cloudformation template
