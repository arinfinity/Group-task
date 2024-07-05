module "vpc" {
    source = "../modules/vpc"
    vpc_cidr = "10.0.0.0/16"
    private_subnet = "10.0.0.0/24"
    public_subnets = "10.0.1.0/24"
    availability_zones = "ap-south-1a"
    tags = {
      Name = "aksya"
    }
}

module "sg" {
    source = "../modules/security_group"
    vpc_id = module.vpc.vpc_id
    tags = {
      Name = "aksya"
    }
  
}

module "keypair" {
    source = "../modules/key_pair"
    key_name = "aki123"
    secret_name = "raj123"
    tags = {
      Name = "aksya"
    }
  
}

module "instance" {
    source = "../modules/ec2_instance"
    ami_id = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    vpc_security_group_ids = [ module.sg.security_group_id ]
    key_name = module.keypair.key_name
    subnet_id = module.vpc.subnet_ids
    common_tags = {
      Name = "aksya"
    }
  
}