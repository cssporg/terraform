##############################################  Computing modules #####################################
resource "aws_eip" "lbeip"{
instance = "${aws_instance.lbserver.id}"
vpc = "true"
}

resource "aws_instance" "lbserver" {
#availability_zone = "us-east-1c"
ami = "${var.myamiid}"
instance_type = "t2.medium"
subnet_id = "${element(var.lbsubnet, count.index)}"
#private_ip= "192.168.1.6"
vpc_security_group_ids = ["${var.websg}"]
key_name = "virginia'
user_data = "${element(var.user_data["lbserver"], count.index)}"
}

resource "aws_instance" "appserver" {
#availability_zone = "us-east-1c"
ami = "${var.myamiid}"
instance_type = "t2.medium"
subnet_id = "${element(var.appsubnet, count.index)}"
#private_ip= "192.168.3.6"
vpc_security_group_ids = ["${var.websg}"]
key_name = "virginia"
user_data = "${element(var.user_data["appserver"], count.index)}"
tags = "${merge(var.tags, map("Name", format("app-server-%d", count.index + 1)))}"
}
