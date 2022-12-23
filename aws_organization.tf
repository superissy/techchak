# Configure the AWS Provider
provider "aws" {
  region = var.aws_regions[0]
}

# Create the AWS Organization
resource "aws_organizations_organization" "oluwaseun-org" {
  enabled_policy_types = ["SERVICE_CONTROL_POLICY"]
  feature_set          = "ALL"
}


# Create the production OU
resource "aws_organizations_organizational_unit" "prod_ou" {
  name      = "Production"
  parent_id = aws_organizations_organization.oluwaseun-org.roots.0.id
}

# Create the development OU
resource "aws_organizations_organizational_unit" "dev_ou" {
  name      = "Development"
  parent_id = aws_organizations_organization.oluwaseun-org.roots.0.id
}

# Create the test OU
resource "aws_organizations_organizational_unit" "test_ou" {
  name      = "Sand-box"
  parent_id = aws_organizations_organization.oluwaseun-org.roots.0.id
}

# Create the security OU
resource "aws_organizations_organizational_unit" "security_ou" {
  name      = "Security"
  parent_id = aws_organizations_organization.oluwaseun-org.roots.0.id
}


# Create the production account
resource "aws_organizations_account" "prod_account" {
  name      = var.aws_organizations_account_name[0]
  email     = var.aws_org_account_email[0]
  role_name = var.aws_organizations_account_role_name[0]
  parent_id = aws_organizations_organizational_unit.prod_ou.id
}

# Create the development account
resource "aws_organizations_account" "dev_account" {
  name      = var.aws_organizations_account_name[1]
  email     = var.aws_org_account_email[1]
  role_name = var.aws_organizations_account_role_name[1]
  parent_id = aws_organizations_organizational_unit.dev_ou.id
}


# Create the Test account
resource "aws_organizations_account" "test_account" {
  name      = var.aws_organizations_account_name[2]
  email     = var.aws_org_account_email[2]
  role_name = var.aws_organizations_account_role_name[2]
  parent_id = aws_organizations_organizational_unit.test_ou.id
}

# Create the security account
resource "aws_organizations_account" "security_account" {
  name      = var.aws_organizations_account_name[3]
  email     = var.aws_org_account_email[3]
  role_name = var.aws_organizations_account_role_name[3]
  parent_id = aws_organizations_organizational_unit.security_ou.id
}



