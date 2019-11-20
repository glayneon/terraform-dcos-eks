#
# Workstation External IP for EKS API Security Group
# Added the below lines by Chase

data "http" "workstation-external-ip" {
  url = "http://ifconfig.co"
}

# Override with variable or hardcoded value if necessary
locals {
  workstation-external-cidr = "${chomp(data.http.workstation-external-ip.body)}/24"
}
