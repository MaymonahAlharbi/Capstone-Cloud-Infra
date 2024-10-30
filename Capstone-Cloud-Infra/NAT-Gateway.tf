resource "alicloud_nat_gateway" "nat-gw" {
  vpc_id           = alicloud_vpc.vpc.id
  nat_gateway_name = "nat-gw"
  payment_type     = "PayAsYouGo"
  vswitch_id       = alicloud_vswitch.public-subnet.id
  nat_type         = "Enhanced"
}


resource "alicloud_eip_address" "nat-addr" {
  address_name = "nat"
  netmode = "public"
  bandwidth = "100"
  internet_charge_type = "PayByTraffic"
  payment_type = "PayAsYouGo"

}


resource "alicloud_eip_association" "nat-association" {
  allocation_id = alicloud_eip_address.nat-addr.id
  instance_id   = alicloud_nat_gateway.nat-gw.id
  instance_type = "Nat"
}


resource "alicloud_snat_entry" "snat-private" {
  snat_table_id     = alicloud_nat_gateway.nat-gw.snat_table_ids
  source_vswitch_id = alicloud_vswitch.private-subnet.id
  snat_ip           = alicloud_eip_address.nat-addr.ip_address
}

resource "alicloud_route_table" "private" {
  vpc_id           = alicloud_vpc.vpc.id
  route_table_name = "private route table"
  associate_type   = "VSwitch"
}


resource "alicloud_route_entry" "entry" {
  route_table_id        = alicloud_route_table.private.id
  destination_cidrblock = "0.0.0.0/0"
  nexthop_type          = "NatGateway"
  nexthop_id            = alicloud_nat_gateway.nat-gw.id
}


resource "alicloud_route_table_attachment" "route_table_attachment" {
  vswitch_id     = alicloud_vswitch.private-subnet.id
  route_table_id = alicloud_route_table.private.id
}
