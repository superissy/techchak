variable "aws_regions" {
  type        = list(string)
  description = "value of aws_regions"
  default     = ["us-east-1", "us-east-2", "us-west-1", "us-west-2"]
}

# Create the AWS Organization Name
variable "aws_organizations_name" {
  type        = string
  description = "value of aws_organizations_account_name"
  default     = "techchak-org"
}

# Create the AWS Organization Email 
variable "aws_org_account_email" {
  type        = list(string)
  description = "value of aws_organizations_account_email"
  default     = ["aws.prod@techchak.com", "aws.dev@@techchak.com", "aws.test@techchak.com", "security@@techchak.com"]
}


# Create the AWS Organization Names 
variable "aws_organizations_account_name" {
  type        = list(string)
  description = "value of aws_organizations_account_name"
  default     = ["techchak-prod", "techchak-dev", "techchak-test", "techchak-security"]
}

# Create the AWS Organization role_name
variable "aws_organizations_account_role_name" {
  type        = list(string)
  description = "value of aws_organizations_account_role_name"
  default     = ["ProdOrganizationAccountAccessRole", "DevOrganizationAccountAccessRole", "TestOrganizationAccountAccessRole", "SecurityOrganizationAccountAccessRole"]
}
