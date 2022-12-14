# CUSTOM CLOUDGOAT SCENARIO CREATION GUIDE

# How CloudGoat create scenario works

1. Creates scenario-instance folder in project root directory
2. Copy TF files from scenario to scenario-instance folder
3. Runs the start.sh script, if that scenario has one
4. Runs TF init
5. Specifically checks if scenario is 'detection_evasion', and prompts for user input if it is, as that scenario requires user input during deployment
6. Runs TF plan
7. Runs TF apply
8. Saves output_stdout outputs tagged with 'cloudgoat_output' into the 'start.txt' file in the scenario-instance folder (aka the TF outputs)



# Files / folders needed to create custom scenario

### Required
1. cloudgoat/scenarios/scenario-name/terraform
2. cloudgoat/scenarios/scenario-name/terraform/outputs.tf

Outputs get saved to the start.txt file in the scenario-instance folder, and are used as a starting point for the scenario.

When attempting to read sensitive root module output data, the value must be marked as sensitive, for example (https://support.hashicorp.com/hc/en-us/articles/5175257151891-How-to-output-sensitive-data-with-Terraform):

```
output "cloudgoat_output_phished_secret_key" {
    value = aws_iam_access_key.phisherman.secret
    sensitive = true
}
```

3. cloudgoat/scenarios/scenario-name/terraform/provider.tf

Needs to be setup to use named profiles to work, just copy this code:

```
provider "aws" {
  profile = "${var.profile}"
  region = "${var.region}"
}
```
4. cloudgoat/scenarios/scenario-name/manifest.yml

The manifest.yml file is where textual info about the scenario like the scenario name, author, version, help, last updated should be stored and is invoked upon the help command.

5. Must have the following TF variables:

```
variable "profile" {
    # CloudGoat provides the profile info upon runtime?
    description = "The AWS profile to use."
}

variable "region" {
    description = "The AWS region to deploy resources to."
    default = "us-east-1"
}

variable "cgid" {
    # CloudGoat provides the profile info upon runtime?
    description = "CGID variable for unique naming."
}

variable "cg_whitelist" {
    # CloudGoat provides the profile info upon runtime?
    description = "User's public IP address(es)."
    type = list(string)
}
```

### Optional
1. cloudgoat/scenarios/scenario-name/start.sh
2. cloudgoat/scenarios/scenario-name/assets
3. cloudgoat/scenarios/scenario-name/README.md
4. cloudgoat/scenarios/scenario-name/cheat_sheet.md
5. cloudgoat/scenarios/scenario-name/exploitation_route.png



# How CloudGoat destroy scenario works

Using two key functions, destroy_all_scenarios() and destroy_scenario(). Nothing too important to take note of when creating a custom scenario as CloudGoat basically does a TF destroy operation, followed by 'trashing' the scenario-instance files by moving them to a 'trash' folder.


# Files required for CloudGoat destroy
None.