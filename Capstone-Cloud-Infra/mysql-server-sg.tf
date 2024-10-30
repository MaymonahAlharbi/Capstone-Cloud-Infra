# resource "alicloud_security_group" "mysql-security-group" {
#   name        = "mysql-security-group"
#   vpc_id = alicloud_vpc.vpc.id
# }

# resource "alicloud_security_group_rule" "allow-ssh-from-jumb-server" {
#   type              = "ingress"
#   ip_protocol       = "tcp"
#   policy            = "accept"
#   port_range        = "22/22"
#   priority          = 1
#   security_group_id = alicloud_security_group.mysql-security-group.id
#   source_security_group_id = alicloud_security_group.jump-server-sec.id
# }

# resource "alicloud_security_group_rule" "allow-http-to-mysql" {
#   type              = "ingress"
#   ip_protocol       = "tcp"
#   policy            = "accept"
#   port_range        = "3306/3306"
#   priority          = 1
#   security_group_id = alicloud_security_group.mysql-security-group.id
#   source_security_group_id = alicloud_security_group.http-sec.id
# }
