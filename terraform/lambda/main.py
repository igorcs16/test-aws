import json

import boto3
import requests

def main(event, context):
    url = "https://api.punkapi.com/v2/beers/random"
    data = requests.get(url)

    payload = data.json()
    kinesis = boto3.client("kinesis")

    response = kinesis.put_record(
        StreamName="collect_data_lambda",
        Data=json.dumps(payload),
        PartitionKey="AdjustAsNeeded"
    )

if __name__ == "__main__":
    main("0", "0")