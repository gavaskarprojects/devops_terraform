provider "alicloud" {
  configuration_source = "terraform-provider-alicloud/examples/vpc"
}

resource "alicloud_vpc" "main" {
  # VPC name
  name       = "alicloud"
  # CIDR block of the VPC
  cidr_block = "10.1.0.0/21"
}

resource "alicloud_vswitch" "main" {
  # VPC ID
  vpc_id            = alicloud_vpc.main.id
  # CIDR block of the VSwitch
  cidr_block        = "10.1.0.0/24"
  # Zone
  availability_zone = "ap-southeast-1a"
  # Dependent resource (this dependent resource will be created first)
  depends_on = [alicloud_vpc.main]
}
