
# AWS Static Website Deployment ☁️

A static website hosted on Amazon S3 and delivered globally through Amazon CloudFront with HTTPS and automated deployment using AWS CLI.

## 🚀 Live Demo

https://d3ib1uqtdrpf8r.cloudfront.net/

## 🛠️ Technologies Used

- Amazon S3 — static file storage
- Amazon CloudFront — CDN and HTTPS
- AWS IAM / STS — authenticated AWS access
- AWS CLI — cloud resource management
- Bash — deployment automation
- HTML / CSS — frontend
- Git & GitHub — version control

## 🏗️ Architecture

```text
          User / Browser
                |
              HTTPS
                |
                v
       Amazon CloudFront
          (CDN + Cache)
                |
      Origin Access Control
                |
                v
           Amazon S3
         (Private Bucket)
                ^
                |
           AWS CLI Sync
                |
          deploy.sh
                |
          Local Machine
```

## 🔐 Security

- S3 Block Public Access enabled
- S3 ACLs disabled
- CloudFront private S3 origin access
- HTTPS enabled through CloudFront
- AWS CLI authentication using temporary credentials
- No AWS credentials stored in the repository

## ⚙️ Deployment

The `deploy.sh` script automates deployment:

1. Synchronizes local website files to S3.
2. Creates a CloudFront cache invalidation.
3. Allows the updated website to become available without manual AWS Console interaction.

Run:

```bash
chmod +x deploy.sh
./deploy.sh
```

Prerequisites:
- AWS CLI v2
- An authenticated AWS CLI profile named `aws-devops`
- An existing S3 bucket and CloudFront distribution
- Appropriate AWS permissions

## 📁 Project Structure

```text
aws-static-website/
├── index.html
├── style.css
├── deploy.sh
├── .gitignore
└── README.md
```

## 📚 What I Learned

- Creating and configuring Amazon S3 buckets
- Hosting static files securely in AWS
- Configuring CloudFront distributions
- Connecting private S3 origins to CloudFront
- Understanding CDN caching and invalidations
- Authenticating AWS CLI with temporary credentials
- Automating website deployments using Bash
- Managing cloud resources through AWS CLI

## 🔮 Future Improvements

- Implement CI/CD using GitHub Actions
- Configure a custom domain with Route 53
- Add monitoring with Amazon CloudWatch
- Manage AWS infrastructure using Terraform
