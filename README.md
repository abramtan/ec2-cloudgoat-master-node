# EC2 CloudGoat Configuration

## Resources
- https://rhinosecuritylabs.com/aws/introducing-cloudgoat-2/

## Software Installed
- Python 3.7.10
- GNU bash, version 4.2.46(2)-release (x86_64-koji-linux-gnu)

- Terraform
```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
```

Verify Terraform installation
```
terraform -help
```

Install Terraform auto-complete
```
touch ~/.bashrc
terraform -install-autocomplete
source ~/.bashrc
```

Update AWS CLI to version 2
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
```

- AWS CLI (aws-cli/2.8.8 Python/3.9.11 Linux/5.10.130-118.517.amzn2.x86_64 exe/x86_64.amzn.2 prompt/off)

- Install jq (jq-1.5 tested)
```
sudo yum install jq
```

- Install git (git version 2.37.1 tested)
```
sudo yum update -y
sudo yum install git -y
```

- Install CloudGoat
```
git clone https://github.com/RhinoSecurityLabs/cloudgoat.git
cd cloudgoat
pip3 install -r ./requirements.txt
chmod +x cloudgoat.py
```

- Configure CloudGoat (default profile: cloudgoat-1)
```
./cloudgoat.py config profile
./cloudgoat.py config whitelist --auto
```

- Setup AWS CLI (Follow this guide: https://rhinosecuritylabs.com/aws/introducing-cloudgoat-2/)

## Useful Commands

```
aws iam list-users
aws configure list-profiles
aws iam list-roles #lists roles for current account
```

## Scenario 1: Vulnerable Lambda

- Create scenario
```
./cloudgoat.py create vulnerable_lambda
```

- Missing Steps in Vulnerable Lambda Cheatsheet

Before starting, create bilbo profile (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html):
```
aws configure --profile bilbo
```

Between steps 2 and 3, create assumed_role profile (https://aws.amazon.com/premiumsupport/knowledge-center/authenticate-mfa-cli/):
```
aws configure --profile assumed_role
nano ~/.aws/credentials
```
Add in "aws_session_token = [session token obtained from step 2 goes here]" to the assumed_role profile.

## Take Note
- When running CloudGoat as a test / interview test, might want to consider blocking access to the CloudGoat repo (https://github.com/RhinoSecurityLabs/cloudgoat) as cheatsheets are available there.

- There are some YouTube videos that show CloudGoat solutions as well, may want to block access to those as well (https://youtube.com/playlist?list=PLrkO8muGZWPAasPkb6IopqBguOaJ7W2za).