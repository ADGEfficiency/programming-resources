python -m pip install aws-cdk-lib

requires node as well - this gives you the CLI 

import aws_cdk as cdk

Then add bucket

$ cdk bootstrap

https://github.com/aws/aws-cdk/issues/17942 will stop synth before deploy

$ cdk deploy
$ cdk synth
$ cdk diff

---


 * `cdk ls`          list all stacks in the app
 * `cdk synth`       emits the synthesized CloudFormation template
 * `cdk deploy`      deploy this stack to your default AWS account/region
 * `cdk diff`        compare deployed stack with current state
 * `cdk docs`        open CDK documentation

---

https://bobbyhadz.com/blog/aws-cdk-tutorial-typescript

may need to bootstrap account first
```shell-session
$ cdk bootstrap aws://706872668527/ap-southeast-2 --profile dev-adg
```

```
$ npx aws-cdk init app --language=typescript
```

cdk.json
- shouldn't need to edit cdk-app.ts

lib
- add your stack here and refer back to it in cdk-app.ts

```typescript
import {CdkAppStack} from '../lib/cdk-app-stack';
```

Then diff & deploy
```shell-session
$ npx aws-cdk diff --profile=dev-adg
$ npx aws-cdk deploy --profile dev-adg
```


npx aws-cdk destroy --profile dev-adg
