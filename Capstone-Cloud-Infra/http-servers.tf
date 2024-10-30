
resource "alicloud_instance" "web-instance-test" {
  availability_zone = data.alicloud_zones.default.zones.0.id
  security_groups   = [alicloud_security_group.http-sec.id]
  count = 2
  instance_type              = "ecs.g6.large"
  system_disk_category       = "cloud_essd"
  system_disk_size           = 40
  image_id                   = "ubuntu_24_04_x64_20G_alibase_20240812.vhd"
  instance_name              = "http-server${count.index}"
  vswitch_id                 = alicloud_vswitch.private-subnet.id
  internet_max_bandwidth_out = 0
  instance_charge_type       = "PostPaid"
  key_name                   = alicloud_key_pair.sec-key.key_pair_name
  user_data = base64encode(templatefile("setup-http-server.tpl", {redis_host = alicloud_instance.redis-server.private_ip,
   db_host= alicloud_instance.mysql-server.private_ip
   }))
}

output "http-servers-IP" {
  value = alicloud_instance.web-instance-test.*.private_ip
}
