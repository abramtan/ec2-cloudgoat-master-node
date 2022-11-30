# Custom CloudGoat Scenario Creation Guide

# How CloudGoat Create Scenario Works

1. Creates scenario-instance folder in project root directory
2. Copy TF files from scenario to scenario-instance folder
3. Runs the start.sh script, if that scenario has one
4. Runs TF init
5. Specifically checks if scenario is 'detection_evasion', and prompts for user input if it is, as that scenario requires user input during deployment
6. Runs TF plan
7. Runs TF apply
8. Saves output_stdout outputs tagged with 'cloudgoat_output' into the 'start.txt' file in the scenario-instance folder (aka the TF outputs)



# Files / Folders needed for Custom Scenario

### Required
1. cloudgoat/scenarios/scenario-name/terraform
2. cloudgoat/scenarios/scenario-name/terraform/outputs.tf
3. cloudgoat/scenarios/scenario-name/terraform/provider.tf

Needs to be setup to use named profiles to work, just copy this code:

```
provider "aws" {
  profile = "${var.profile}"
  region = "${var.region}"
}
```

### Optional
1. cloudgoat/scenarios/scenario-name/start.sh
2. cloudgoat/scenarios/scenario-name/assets
3. cloudgoat/scenarios/scenario-name/README.md
4. cloudgoat/scenarios/scenario-name/cheat_sheet.md
5. cloudgoat/scenarios/scenario-name/exploitation_route.png
6. cloudgoat/scenarios/scenario-name/manifest.yml ????