


https://docs.github.com/en/actions/automating-builds-and-tests/about-continuous-integration

https://docs.github.com/actions/automating-builds-and-tests/building-and-testing-nodejs-or-python?langId=py

Events - https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows


https://posthog.com/blog/automating-a-software-company-with-github-actions

Per repository workflows
- marketplace of actions - https://github.com/marketplace?type=actions
- python setup - https://github.com/marketplace/actions/setup-python

Run on event 
- push to `main`,
- pull requests,
- add issue labels,
- manual workflow dispatch.

Workflow composed of jobs
- running shell scripts or standalone action,
- standalone action = either Typescript or Docker container.

```yaml
on:
  - pull_request, schedule

jobs:
  tests:
    runs-on: ubuntu-latest
    strategy:
    steps:
      - name: pytest
      - run: pytest tests

```

Artifacts
- storage provided by GitHub that temporarily stores files resulting from job runs,
- allows downloading these files. 

CD
```yaml
on:
    push:
        branches:
            - master

jobs:
    build-and-deploy-production:
        runs-on: ubuntu-latest
        steps:
            - name: Configure AWS credentials
              uses: aws-actions/configure-aws-credentials@v1
              with:
                  aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
                  aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
                  aws-region: us-east-1

```

Package version incremeted:

```yaml
name: Autobump

on:
    pull_request:
        types: [closed]

jobs:
    label-version-bump:
        runs-on: ubuntu-latest
        if: |
            github.event.pull_request.merged
            && (
                contains(github.event.pull_request.labels.*.name, 'bump patch')
                || contains(github.event.pull_request.labels.*.name, 'bump minor')
                || contains(github.event.pull_request.labels.*.name, 'bump major')
            )
        steps:
            - name: Check out the repository
              uses: actions/checkout@v2
              with:
                  ref: ${{ github.event.pull_request.base.ref }}

            - name: Detect version bump type
              id: bump-type
              run: |
                  BUMP_TYPE=null
                  if [[ $BUMP_PATCH_PRESENT == 'true' ]]; then
                      BUMP_TYPE=patch
                  fi
                  if [[ $BUMP_MINOR_PRESENT == 'true' ]]; then
                      BUMP_TYPE=minor
                  fi
                  if [[ $BUMP_MAJOR_PRESENT == 'true' ]]; then
                      BUMP_TYPE=major
                  fi
                  echo "::set-output name=bump-type::$BUMP_TYPE"
              env:
                  BUMP_PATCH_PRESENT: ${{ contains(github.event.pull_request.labels.*.name, 'bump patch') }}
                  BUMP_MINOR_PRESENT: ${{ contains(github.event.pull_request.labels.*.name, 'bump minor') }}
                  BUMP_MAJOR_PRESENT: ${{ contains(github.event.pull_request.labels.*.name, 'bump major') }}

            - name: Determine new version
              id: new-version
              if: steps.bump-type.outputs.bump-type != 'null'
              run: |
                  OLD_VERSION=$(jq ".version" package.json -r)
                  NEW_VERSION=$(npx semver $OLD_VERSION -i ${{ steps.bump-type.outputs.bump-type }})
                  echo "::set-output name=new-version::$NEW_VERSION"

            - name: Update version in package.json
              if: steps.bump-type.outputs.bump-type != 'null'
              run: |
                  mv package.json package.old.json
                  jq --indent 4 '.version = "${{ steps.new-version.outputs.new-version }}"' package.old.json > package.json
                  rm package.old.json

            - name: Commit bump
              if: steps.bump-type.outputs.bump-type != 'null'
              uses: EndBug/add-and-commit@v7
              with:
                  branch: ${{ github.event.pull_request.base.ref }}
                  message: 'Bump version to ${{ steps.new-version.outputs.new-version }}'
```

Keeping repositories in sync

```yaml
on:
    push:
        branches:
            - master

jobs:
    repo-sync:
        name: Sync posthog-foss with posthog
        runs-on: ubuntu-latest
        steps:
            - name: Sync repositories 1 to 1 - master branch
              if: github.repository == 'PostHog/posthog'
              uses: wei/git-sync@v3
              with:
                  source_repo: 'https://posthog-bot:${{ secrets.POSTHOG_BOT_GITHUB_TOKEN }}@github.com/posthog/posthog.git'
                  source_branch: 'master'
                  destination_repo: 'https://posthog-bot:${{ secrets.POSTHOG_BOT_GITHUB_TOKEN }}@github.com/posthog/posthog-foss.git'
                  destination_branch: 'master'
            - name: Check out posthog-foss
              if: github.repository == 'PostHog/posthog'
              uses: actions/checkout@v2
              with:
                  repository: 'posthog/posthog-foss'
                  ref: master
                  token: ${{ secrets.POSTHOG_BOT_GITHUB_TOKEN }}
            - name: Change LICENSE to pure MIT
              if: github.repository == 'PostHog/posthog'
              run: |
                  sed -i -e '/PostHog Inc\./,/Permission is hereby granted/c\Copyright (c) 2020-2021 PostHog Inc\.\n\nPermission is hereby granted, free of charge, to any person obtaining a copy' LICENSE
                  echo -e "MIT License\n\n$(cat LICENSE)" > LICENSE
            - name: Commit "Sync and remove all non-FOSS parts"
              if: github.repository == 'PostHog/posthog'
              uses: EndBug/add-and-commit@v7
              with:
                  message: 'Sync and remove all non-FOSS parts'
                  remove: '["-r ee/", "-r .github/"]'
                  github_token: ${{ secrets.POSTHOG_BOT_GITHUB_TOKEN }}
            - run: echo # Empty step so that GitHub doesn't complain about an empty job on forks
```

---

Continuous integration:
- running unit tests on commits / PRs

Continuous deployment
- deploying on commits / PRs

---

## Automating a software company with GitHub Actions

https://posthog.com/blog/automating-a-software-company-with-github-actions

https://news.ycombinator.com/item?id=28234057

It's gotten to the point where new any new workflows I write are thin wrappers around a single script and I don't import any actions besides actions/checkout (even that has been bug prone, historically).

CI is a script, and the YAML configs for those various services configure the machine type, OS and toolchain. Everything else is contained within the script. Sometimes even toolchain setup is handled by the script.

Not following this model has wasted so much time when migrating services or trying to tweak what CI does.

With a script you can run it locally to ensure it performs the steps desired, leaving the CI “setup” to minimal environment/toolchain debugging. 
