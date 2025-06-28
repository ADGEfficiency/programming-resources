[AWS Security Maturity Model :: AWS Security Maturity Model](https://maturitymodel.security.aws.dev/en/model/)

[Your AWS security checklist : r/aws](https://www.reddit.com/r/aws/comments/w4iq79/your_aws_security_checklist/)

[open-guides/og-aws](https://github.com/open-guides/og-aws) - Amazon Web Services — a practical guide.

[AndrewGuenther/fck-nat](https://github.com/AndrewGuenther/fck-nat) - Feasible cost konfigurable NAT: An AWS NAT Instance AMI.

[AWS IAM Roles, a tale of unnecessary complexity | infosec.rodeo](https://infosec.rodeo/posts/thoughts-on-aws-iam/)

IAM principles:

- Users, representing human actors
- Groups, a container for users allowing for “role based access control”
- Roles, an “identity” that an instance, workload or application impersonates to gain API permissionsRoles, an “identity” that an instance, workload or application impersonates to gain API permissions

[AWS IAM Roles, a tale of unnecessary complexity | Hacker News](https://news.ycombinator.com/item?id=33566419)

Also, early on in my AWS journey, even two accounts (one non-prod and one prod) was only done half the time and viewed as a best practice to think about - people generally just opened one AWS account. But when IAM wasn't enough (i.e. there wasn't enough granularity on the resources or the conditions exposed etc.) the answer became separate AWS accounts as the only, or at least the easiest, way enforce these authorization boundaries/separations with a blunt instrument you could trust.

Then you often needed cross-account role assumptions to deal with the inevitable cases where things or people needed access between these accounts.

Then the explosion in AWS Accounts led to AWS Organizations to provision and manage them all. And it built in Service Control Policies and OUs as a tool/layer to help further manage/constrain IAM policies/permissions (IAM policies, Permission Boundaries and SCPs now being in a venn diagram with each other these days).

But AWS Organizations managing heaps of accounts was also too painful to use and get right and so they brought in AWS Control Tower to help make setting up Organizations easier.

[Diving Deep on S3 Consistency](https://www.allthingsdistributed.com/2021/04/s3-strong-consistency.html)

[Continuous reinvention: A brief history of block storage at AWS | All Things Distributed](https://www.allthingsdistributed.com/2024/08/continuous-reinvention-a-brief-history-of-block-storage-at-aws.html)

[AWS Cloud Control API, a Uniform API to Access AWS and Third-Party Services | Hacker News](https://news.ycombinator.com/item?id=28710179)

[CloudCasts - AWS for Humans](https://cloudcasts.io/)

[Amazon ECS Workshop :: Amazon ECS Workshop](https://ecsworkshop.com/)
