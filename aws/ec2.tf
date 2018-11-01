# Define webserver inside the public subnet. We can also use private subnets to isolate behind an ALB/Classic ELB. But for testing, I am using public subnet. 
resource "aws_instance" "web" {
   ami  = "${var.ec2_ami}"
   instance_type = "t2.micro"
   key_name = "${var.keypair_name}"
   subnet_id = "${aws_subnet.public_subnet_a.id}"
   vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
   associate_public_ip_address = true
   source_dest_check = false
   user_data = "${file("install.sh")}"

  tags {
    Name = "hid_ec2_web_server"
  }
  tags {
    environment = "development"
  }

}
