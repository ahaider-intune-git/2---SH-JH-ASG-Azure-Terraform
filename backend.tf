#############################################################################
# Terraform Azure backend for statefile on blob storage 
############################################################################# 
# 
# File      :   backend to store the terraform state file 
# Version   :   v1.0
#
#############################################################################

# container for Terraform State file as backend in storage account 
# *****************************************************************

terraform {

  backend "azurerm" {    
   
    subscription_id = "97a0f7b9-3bf7-4c59-99a8-064c85ed7df7"
    storage_account_name= "cs1100300008792a77d"
  container_name       = "ahaiderjhazshriacsan001-nsg001"                                # name of the storage account container where the backend file is stored
  key                  = "ASGterraform.tfstate" # name of the state file to be saved
  resource_group_name  = "cloud-shell-storage-southeastasia"
   
    
  }

}

 