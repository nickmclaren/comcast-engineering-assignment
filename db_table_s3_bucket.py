import boto3
import sys
import logging




def create_dynamodb_table(table_name, region):
    dynamodb = boto3.client('dynamodb', region_name=region)
    try:
        print(f"Looking for DynamDB table...")
        table = dynamodb.describe_table(TableName=table_name)
        print(f"DynamoDB table '{table_name}' already exists.")
    except dynamodb.exceptions.ResourceNotFoundException:
        print(f"DynamoDB table '{table_name}' does not exist. Creating table...")
        dynamodb.create_table(
            TableName=table_name,
            AttributeDefinitions=[{'AttributeName': 'LockID', 'AttributeType': 'S'}],
            KeySchema=[{'AttributeName': 'LockID', 'KeyType': 'HASH'}],
            BillingMode='PAY_PER_REQUEST'
        )
        dynamodb.get_waiter('table_exists').wait(TableName=table_name)
        print(f"DynamoDB table '{table_name}' created.")

def create_s3_bucket(bucket_name, region):
    s3 = boto3.client('s3', region_name=region)
    try:
        print(f"Looking for s3 bucket...")
        s3.head_bucket(Bucket=bucket_name)
        print(f"S3 bucket '{bucket_name}' already exists.")
    except s3.exceptions.ClientError:
        print(f"S3 bucket '{bucket_name}' does not exist. Creating bucket...")
        s3.create_bucket(
            Bucket=bucket_name,
            CreateBucketConfiguration={'LocationConstraint': region}
        )
        print(f"S3 bucket '{bucket_name}' created.")

def main():
    region = 'us-west-2'
    dynamodb_table_name = 'terraform-state-locking-table'
    s3_bucket_name = 'terraform-state-file-bucket-nm'

    create_dynamodb_table(dynamodb_table_name, region)
    create_s3_bucket(s3_bucket_name, region)

if __name__ == '__main__':
    main()