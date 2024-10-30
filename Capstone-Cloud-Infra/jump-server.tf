
resource "alicloud_instance" "bastion" {
  availability_zone = data.alicloud_zones.default.zones.0.id
  security_groups   = [alicloud_security_group.jump-server-sec.id]

  instance_type              = "ecs.g6.large"
  system_disk_category       = "cloud_essd"
  system_disk_size           = 20
  image_id                   = "ubuntu_24_04_x64_20G_alibase_20240812.vhd"
  instance_name              = "jump-box"
  vswitch_id                 = alicloud_vswitch.public-subnet.id
  internet_max_bandwidth_out = 100
  internet_charge_type       = "PayByTraffic"
  instance_charge_type       = "PostPaid"
  key_name                   = alicloud_key_pair.sec-key.key_pair_name
}

output "jump-server-ip" {
  value = alicloud_instance.bastion.public_ip
}