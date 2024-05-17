# TODO 

- Add logging option to raw cloudfront dist
- Allowing changes (disabling logging/adding a custom domain)


```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*",
                "s3:CreateBucket",
                "s3:PutBucketTagging",
                "s3:DeleteBucket",
                "s3:DeleteBucketPolicy",
                "s3:DeleteObject",
                "s3:PutBucketVersioning",
                "s3:PutBucketPublicAccessBlock",
                "s3:PutBucketCORS",
                "s3:PutBucketWebsite",
                "s3:PutBucketRequestPayment",
                "s3:PutBucketLogging",
                "s3:PutBucketPolicy",
                "s3:PutObject",
                "s3:DeleteBucketWebsite",
                "s3:GetBucketAcl",
                "s3:PutBucketAcl",
                "s3:PutBucketOwnershipControls"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "route53:DeleteTrafficPolicy",
                "route53:CreateTrafficPolicy",
                "route53:GetHostedZone",
                "route53:DeleteCidrCollection",
                "route53:DeleteHostedZone",
                "route53:CreateCidrCollection",
                "route53:UpdateHostedZoneComment",
                "route53:DeleteTrafficPolicyInstance",
                "route53:CreateHostedZone",
                "route53:CreateReusableDelegationSet",
                "route53:CreateTrafficPolicyInstance",
                "route53:DeleteReusableDelegationSet",
                "route53:GetChange",
                "route53:ListTagsForResource",
                "route53domains:ListTagsForDomain",
                "route53domains:GetDomainDetail",
                "route53:ChangeResourceRecordSets",
                "route53domains:EnableDomainAutoRenew",
                "route53:ListResourceRecordSets",
                "route53domains:UpdateDomainNameservers",
                "route53domains:GetOperationDetail",
                "route53domains:DisableDomainAutoRenew"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "acm:DeleteCertificate",
                "acm:RequestCertificate",
                "acm:AddTagsToCertificate",
                "acm:DescribeCertificate",
                "acm:RemoveTagsFromCertificate",
                "acm:ListTagsForCertificate"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "cloudfront:GetDistribution",
                "cloudfront:ListTagsForResource",
                "cloudfront:TagResource",
                "cloudfront:DeleteCloudFrontOriginAccessIdentity",
                "cloudfront:GetCloudFrontOriginAccessIdentity",
                "cloudfront:UpdateCloudFrontOriginAccessIdentity",
                "cloudfront:UpdateDistribution",
                "cloudfront:CreateDistribution",
                "cloudfront:DeleteDistribution",
                "cloudfront:CreateCloudFrontOriginAccessIdentity"
            ],
            "Resource": [
                "arn:aws:cloudfront::*:distribution/*",
                "arn:aws:cloudfront::*:origin-access-identity/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "iam:GenerateCredentialReport",
                "iam:GenerateServiceLastAccessedDetails",
                "iam:Get*",
                "iam:List*",
                "iam:SimulateCustomPolicy",
                "iam:SimulatePrincipalPolicy"
            ],
            "Resource": "*"
        }
    ]
}
```