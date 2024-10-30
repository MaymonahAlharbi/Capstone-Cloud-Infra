
# resource "alicloud_security_group" "jump-server-sec" {
#   name        = "jump-server-sec"
#   vpc_id = alicloud_vpc.vpc.id
# }

# resource "alicloud_security_group_rule" "ssh" {
#   type              = "ingress"
#   ip_protocol       = "tcp"
#   policy            = "accept"
#   port_range        = "22/22"
#   priority          = 1
#   security_group_id = alicloud_security_group.jump-server-sec.id
#   cidr_ip           = "0.0.0.0/0"
# }
