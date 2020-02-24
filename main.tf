provider "aws" {
	region= "${var.aws_region}"
	profile="${var.aws_profile}"
}


resource "aws_key_pair" "wp_auth" {
	key_name="jenkins2"
	public_key="${file(var.pub_key_path)}"
}



resource "aws_instance" "wp_dev" {
	instance_type="t2.micro"
	ami="ami-0c322300a1dd5dc79"
	key_name="${aws_key_pair.wp_auth.id}"
#	vpc_security_group_ids=["${aws_security_group.default.id}"]
        vpc_security_group_ids=["sg-0440c3e6cfe8b8031"]
	subnet_id="subnet-0c39cf41"
}
