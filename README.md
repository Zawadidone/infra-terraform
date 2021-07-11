
[![pipeline status](https://gitlab.com/Zawadidone/infra-terraform/badges/master/pipeline.svg)](https://gitlab.com/Zawadidone/infra-terraform/-/commits/master) [![Cyberveiligheid](https://img.shields.io/badge/Cyberveiligheid-97%25-yellow.svg)](https://eurocyber.nl)
# infra-terraform

[Transip Terraform documentation](https://registry.terraform.io/providers/aequitas/transip/latest)

## Issue's

**Caching**

The provider create's a temporary folder used for [caching](https://github.com/aequitas/terraform-provider-transip/issues/40) which results in the error "failed to create token cache dir" using a shared Gitlab Runner. To avoid error, the variable `XDG_CACHE_HOME` must be set to a directory that the user does have access to, for example `/tmp/`.

**Timezone**
The standard [Terraform](https://hub.docker.com/r/hashicorp/terraform) Docker image doensn't include the package tzdata which results in errors dealing with [time zones](https://gitlab.com/Zawadidone/infra-terraform/-/jobs/1287063929): `Error: failed to lookup domain "zawadidone.nl": unknown time zone Europe/Amsterdam`

Installing the package `tzdata` before executing `terraform plan` fixes this issue.
