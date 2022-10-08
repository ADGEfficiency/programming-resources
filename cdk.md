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
