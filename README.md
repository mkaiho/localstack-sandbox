# localstack-sandbox

## Container services

- localstack  
  Test and Mocking AWS for local development

- terraform-cli  
  Build AWS components on Localstack with terraform

## Configure aws

```.sh
## AWS Access Key ID : test
## AWS Secret Access Key : test
## Default region name : ap-northeast-1
## Default output format : json
docker run --rm -it -v $(pwd)/.aws:/root/.aws amazon/aws-cli  configure
```

## Launch containers

```.sh
docker network create localstack-network
docker-compose up --build -d
```

## Shutdown containers

```.sh
docker-compose down
```

## Building localstack components from host

Building localstack components from host directly

`docker run --rm -it --network localstack-network -v $(pwd)/.aws:/root/.aws amazon/aws-cli --endpoint-url http://localstack:4566 <command>`

```.sh
## example
docker run --rm -it --network localstack-network -v $(pwd)/.aws:/root/.aws amazon/aws-cli --endpoint http://localstack:4566 s3 mb s3://testbucket
```

## Building localstack components from terraform-cli

### Login to terraform-cli

Login to terraform-cli with Either of the following ways

- On VSCode

  1. Add Extension `Remote - Containers` on VSCode.
  1. Open menu clicking lower left and select `Attach to Running Container` > `terraform-cli`.
  1. Open `/work/terraform` folder.

- Shell  

```.sh
docker exec -it terraform-cli bash
cd /work/terraform
```

### Initialize

```.sh
terraform init
```

### Create and Update components

```.sh
terraform apply
```

### Destroy components

```.sh
terraform destroy
```

### Confirm components with aws-cli

`aws --endpoint http://localstack:4566 <command>`

```.sh
## example
aws --endpoint http://localstack:4566 s3 ls
```
