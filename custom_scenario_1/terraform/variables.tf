variable "profile" {
    # CloudGoat provides the profile info upon runtime?
    # Read more: https://upcloud.com/resources/tutorials/terraform-variables
    description = "The AWS profile to use."
}

variable "region" {
    # CloudGoat can update the region when it runs TF
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

variable "scenario-name" {
    description = "Name of the scenario."
    default = "custom_scenario_1"
}