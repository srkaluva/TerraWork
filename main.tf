provider "aws" {
	region= "${var.aws_region}"
	profile="${var.aws_profile}"
}


resource "aws_key_pair" "wp_auth" {
	key_name="terraform"
	public_key="${file(var.pub_key_path)}"
}



resource "aws_instance" "wp_dev" {
	instance_type="t2.micro"
	ami="ami-48e71a35"
	key_name="${aws_key_pair.wp_auth.id}"
#	vpc_security_group_ids=["${aws_security_group.default.id}"]
        vpc_security_group_ids=["sg-0236bfbe469200da8"]
	subnet_id="subnet-0c72d23d2866b7ad5"
}
