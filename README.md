# localstack-sandbox

## Configure aws

```.sh
## AWS Access Key ID : test
## AWS Secret Access Key : test
## Default region name : ap-northeast-1
## Default output format : json
docker run --rm -it -v $(pwd)/.aws:/root/.aws amazon/aws-cli  configure
```

## Launch localstack server

```.sh
docker network create localstack-network
docker-compose up --build -d
```

## How to use aws-cli command

`docker run --rm -it --network localstack-network -v $(pwd)/.aws:/root/.aws amazon/aws-cli --endpoint-url http://localstack:4566 <command>`

```.sh
## example
docker run --rm -it --network localstack-network -v $(pwd)/.aws:/root/.aws amazon/aws-cli --endpoint-url http://localstack:4566 s3 ls
```

## Shutdown localstack server

```.sh
docker-compose down
```
