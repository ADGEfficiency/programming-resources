Python Anywhere, Netfly, Fly, Heroku

[hjacobs/kubernetes-failure-stories](https://github.com/hjacobs/kubernetes-failure-stories) - a compiled list of links to public failure stories related to Kubernetes

[Production Readiness Checklist](https://www.gruntwork.io/devops-checklist/)

[A case for declarative configurations for ML training](https://blog.maiot.io/declarative_configs_for_mlops/)

Infrastructure as code
- avoid environment drift, and to ensure idempotent operations
- read the infrastructure configuration and you’ll know exactly how the resulting environment looks like 
- you can rerun the provisioning without side effects, and your infrastructure has a predictable state

Immutable infrastructure
- updates, fixes and modifications are only possible through new deployments of your infrastructure
- interaction between a provisioned infrastructure and new code happens only through automation

Importance of interfaces
- make automation possible

> if you don’t understand where your code is run, you don’t understand your code


