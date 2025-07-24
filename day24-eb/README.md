 HelloWorld Flask App for AWS Elastic Beanstalk

This is a minimal Flask application configured for deployment on **AWS Elastic Beanstalk** using Python.

What's Inside

- `application.py` – Main Flask app (entry point is `application`)
- `requirements.txt` – Python dependencies
- `.ebextensions/python.config` – Configuration file to set the correct WSGI path for Beanstalk

 How to Deploy

### 1. Zip the Application
Make sure your folder contains:
application.py
requirements.txt
.ebextensions/python.config



Visit the environment's URL after deployment:
http://<your-environment>.elasticbeanstalk.com
You should see:
Hello, World from Elastic Beanstalk!


## usage

```bash
terraform init
terraform apply

```
and remember to clean up

terraform destroy