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
