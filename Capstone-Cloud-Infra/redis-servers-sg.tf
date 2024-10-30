# resource "alicloud_security_group" "redis-security-group" {
#   name        = "redis-security-group"
#   vpc_id = alicloud_vpc.vpc.id
# }

# resource "alicloud_security_group_rule" "allow-ssh-from-jump-server" {
#   type              = "ingress"
#   ip_protocol       = "tcp"
#   policy            = "accept"
#   port_range        = "22/22"
#   priority          = 1
#   security_group_id = alicloud_security_group.redis-security-group.id
#   source_security_group_id = alicloud_security_group.jump-server-sec.id
# }

# resource "alicloud_security_group_rule" "allow-http-servers" {
#   type              = "ingress"
#   ip_protocol       = "tcp"
#   policy            = "accept"
#   port_range        = "6379/6379"
#   priority          = 1
#   security_group_id = alicloud_security_group.redis-security-group.id
#   source_security_group_id = alicloud_security_group.http-sec.id
# }
