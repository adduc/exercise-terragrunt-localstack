# Exercise: Running terragrunt against LocalStack

This exercise showcases how terragrunt can be conditionally configured to run against LocalStack for mocking bringing up AWS resources locally.


## Usage

```sh
# Start LocalStack
docker compose up -d

# Run terragrunt
terragrunt init
terragrunt apply

# Check that the bucket and object were created
curl http://localhost:4566/my-bucket/test-object

# Destroy the resources
terragrunt destroy
```