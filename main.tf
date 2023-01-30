##################################################################################
# Terraform SMC Automation LHD Foundation Resources creation based on the 
# Refrence Architecture and Requirements 
# ASG Module
##################################################################################
# 
# LHD         :     Justice Health (JH)
# File        :     Main File
# jh Admins   :     
# pgm         :     SwDCR
# Version     :     v.1.0
##################################################################################


provider "azurerm" {
    features {}
}

locals {
  application_security_group_rules = csvdecode(file("./asg_names.csv")) # CSV file path referring to the rules
  
}

# Create the ASG 
# **************************************************************

resource "azurerm_application_security_group" "asgrule" {

  for_each                                        = { for asg in local.application_security_group_rules  : asg.name => asg }
  name                                            = each.value.name
  resource_group_name                             = each.value.resource_group_name
  location                                        = each.value.location
}


/*locals {
  asg_rules = csvdecode(file("./asg_names.csv")) # CSV file path referring to the rules
  asg_rules_dist = distinct(local.asg_rules.*.name)
}

# Create the ASG 
# **************************************************************

resource "azurerm_application_security_group" "asgrule" {

  //for_each                                        = { for asg in local.application_security_group_rules  : asg.name => asg }
  for_each  = toset(local.asg_rules_dist)
  name                                            = each.key
  resource_group_name                             = each.value.resource_group_name
  location                                        = each.value.location

}*/

