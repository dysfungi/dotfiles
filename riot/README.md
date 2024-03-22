## How to setup AWS profiles

Add the following and replace secrets from Keeper (i.e., `LOT SCD`):

```
[profile product-services]
region = us-west-2

[profile lot-scd]
source_profile = product-services
region = us-west-2
role_arn = SECRET
role_session_name = LOT
external_id = SECRET
```

Inspired by https://stackoverflow.com/a/63243326.
