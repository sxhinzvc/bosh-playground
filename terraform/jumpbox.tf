resource "aws_instance" "jumpbox" {
  ami                    = "${data.aws_ami.ubuntu.id}"
  availability_zone      = "${var.region}"
  instance_type          = "t2.micro"
  subnet_id              = "${aws_subnet.public.id}"
  vpc_security_group_ids = ["${aws_security_group.bosh.id}", "${aws_security_group.vpc_nat.id}", "${aws_security_group.ssh.id}"]
  key_name               = "${aws_key_pair.jumpbox.key_name}"

  connection {
    type = "ssh"
    user = "${var.jumpbox_ssh_user}"
    private_key = "${file(var.ssh_private_key)}"
  }

  provisioner "file" {
    source = "install-bosh-cli.sh"
    destination = "/tmp/install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install.sh",
      "./tmp/install.sh"
    ]
  }
}
