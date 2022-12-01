# IAM User Credentials
output "cloudgoat_output_phished_access_key_id" {
    value = aws_iam_access_key.phisherman.id
}

output "cloudgoat_output_phished_secret_key" {
    value = aws_iam_access_key.phisherman.secret
    sensitive = true
}

# AWS Account ID
output "cloudgoat_output_aws_account_id" {
    # Obtains data using TF data source from the AWS provider
    # Read more: https://developer.hashicorp.com/terraform/language/data-sources
    # Read even more: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity
    value = data.aws_caller_identity.aws-account-id.account_id
}

output "scenario_cg_id" {
    value = var.cgid
}

output "profile" {
    value = var.profile
}