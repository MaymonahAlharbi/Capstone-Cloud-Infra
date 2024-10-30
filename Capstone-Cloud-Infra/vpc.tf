# resource "alicloud_vpc" "vpc" {
#   cidr_block  = "10.0.0.0/8"
#   vpc_name    = "vpc"
# }

# data "alicloud_zones" "default" {
#   available_resource_creation = "VSwitch"
# }

# resource "alicloud_vswitch" "public-subnet" {
#   vpc_id     = alicloud_vpc.vpc.id
#   cidr_block = "10.0.1.0/24"
#   zone_id    = data.alicloud_zones.default.zones.0.id
#   vswitch_name = "public0"
# }

# resource "alicloud_vswitch" "public-subnet-2" {
#   vpc_id     = alicloud_vpc.vpc.id
#   cidr_block = "10.0.5.0/24"
#   zone_id    = data.alicloud_zones.default.zones.1.id
#   vswitch_name = "public"
# }

# resource "alicloud_vswitch" "private-subnet" {
#   vpc_id     = alicloud_vpc.vpc.id
#   cidr_block = "10.0.2.0/24"
#   zone_id    = data.alicloud_zones.default.zones.0.id
#   vswitch_name = "private"
# }
