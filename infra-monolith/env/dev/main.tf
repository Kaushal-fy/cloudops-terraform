module "vpc" {
  source          = "../../modules/vpc"
  name            = "dev"
  cidr_block      = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
  azs             = ["us-east-1a", "us-east-1b"]
}

module "ec2" {
  source         = "../../modules/ec2"
  name           = "dev"
  vpc_id         = module.vpc.main.id
  subnet_ids     = module.vpc.public.*.id
  instance_count = 2
  instance_type  = "t3.micro"
  ami            = "ami-0c02fb55956c7d316" # Amazon Linux 2
}

module "rds" {
  source            = "../../modules/rds"
  name              = "dev"
  private_subnet_ids = module.vpc.private.*.id
  username          = "admin"
  password          = "Admin123!" # for sandbox only
  instance_class    = "db.t3.micro"
  allocated_storage = 20
}

module "alb" {
  source          = "../../modules/alb"
  name            = "dev"
  vpc_id          = module.vpc.main.id
  subnet_ids      = module.vpc.public.*.id
  security_groups = [module.ec2.web_sg_id]
}
