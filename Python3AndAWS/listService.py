import boto3 

def AWS_Access_Key(accesskey=input('Please enter access key: ')): 
    if accesskey is not None: 
        print('Access key accepted') 
    
    return accesskey 

def AWS_Secret_Key(secretkey=input('Please enter access key: ')):
    if secretkey is not None: 
        print('Access key accepted') 
    
    return secretkey 
    
def listService(awsService, region):
    service = boto3.client(service_name = awsService, 
                           region_name = region, 
                           aws_access_key_id = AWS_Access_Key(),
                           aws_secret_access_key = AWS_Secret_Key())
    
    instances = service.describe_instances( Filters=[ {'Name': 'instance-state-name', 'Values': ['running']} ])
    print(instances) 

if __name__ == '__main__':
    listService('ec2', 'us-east-1')