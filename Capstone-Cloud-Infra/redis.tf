
resource "alicloud_instance" "redis-server" {
  availability_zone = data.alicloud_zones.default.zones.0.id
  security_groups   = [alicloud_security_group.redis-security-group.id]

  instance_type              = "ecs.g6.large"
  system_disk_category       = "cloud_essd"
  system_disk_size           = 20
  image_id                   = "ubuntu_24_04_x64_20G_alibase_20240812.vhd"
  instance_name              = "redis-server"
  vswitch_id                 = alicloud_vswitch.private-subnet.id
  internet_max_bandwidth_out = 0
  instance_charge_type       = "PostPaid"
  key_name                   = alicloud_key_pair.sec-key.key_pair_name
  user_data = base64encode(file("redis.sh"))
}
output "redis-server-ip" {
  value = alicloud_instance.redis-server.private_ip
}
