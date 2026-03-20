# AWS Management Console - Resume website 
The resume project provides hands-on experience with AWS Core Services using AWS Console. The value lies in the implementation of infrastructure as code and CI / CD pipeline with AWS core services IAM, S3, CloudFront Route 53 and Certificate Manager.
#
    Ø Login to AWS Management Console
        ○ Search for "S3" at the search bar
    Ø Create bucket
        ○ General configuration
            § AWS Region
            § Bucket type: General purpose
            § Bucket namespace:  Global namespace  (default)
            § Bucket name:   my-resume-site-XXX  (must be unique)
        ○ Object Ownership
            § Object ownership:  ACLs disabled (recommended)
        ○ Block Public Access setting for this bucket
            § Remove "check" Block all public access  (IMPORTANT for website visibility)
            § Acknowledge that the current settings might result in this bucket and the….
        ○ Bucket Versioning
            § Bucket Versioning:  Disable
        ○ Tags
            § Environment:  Dev
            § Application:  MyResumeSite
            § Function:  555555555  (Department Code)
        ○ Default encryption
            § Encryption type:   Server-side encryption with Amazon S3 managed keys (SSE-S3)
            § Bucket Key:  Enable
        ○ Advanced settings
            § Object Lock:  Disable
    Ø Open created bucket  "my-resume-site-XXX"
        ○ Properties
            § Static website hosting:  Edit
                □ Static website hosting: Enable
                □ Hosting type: Host a static website
                □ Index document:   index.html
                □ Error document: error.html
        ○ Permissions
            § Bucket policy:  add new statement  (Take note of Bucket ARN)
                □ Choose service:  S3
                    ® Search and select:  GetObject
                □ Add a resource
                    ® Service:  S3
                    ® Resource type:  object
                    ® Resource ARN:  arn:aws:s3:::my-resume-site-XXX/*
                    ® Add resource
            § Alternately Bucket policy generator can be used to create policy
                □ AWS Policy Generator
                □ https://awspolicygen.s3.amazonaws.com/policygen.html

                {
                  "Version": "2012-10-17",
                  "Statement": [
                    {
                      "Sid": "Statement1",
                      "Effect": "Allow",
                      "Principal": "*",
                      "Action": [
                        "s3:GetObject"
                      ],
                      "Resource": "arn:aws:s3:::my-resume-site-XXX/*"
                    }
                  ]
                }