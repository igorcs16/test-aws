# Desafio Data Engineer 
O objetivo desse projeto é fazer a ingestão de dados consumidos de uma api com o lambda que é acionado com cloudwatch à cada 5 minutos, processá-los com kinesis data stream e firehose e armazenar-los no bucket S3
conforme arquitetura;

![Alt text](img/arquitetura.png?raw=true "Arquitetura")

## Pré-requisitos
- terraform version >= 0.12.28, < 0.13.0 
- export AWS_ACCESS_KEY_ID="access_key_id"
- export AWS_SECRET_ACCESS_KEY="secret_access_key"

## Etapas:
1. Comando para provisionar as infraestrutura:

```
cd terraform/
terraform apply -var-file="vars/cloudwatch.tfvars" -var-file="vars/lambda.tfvars" -var-file="vars/kinesis.tfvars" -var-file="vars/s3.tfvars"
```

2. Cloudwatch é desabilitado por padrão, portanto após o provisionamento do terraform é necessário habilita-lo para iniciar o processo de ingestão
