output "jumpbox_ip" {
  value = "${aws_instance.jumpbox.public_ip}"
}

output "bosh_ip" {
  value = "${var.bosh_ip}"
}
