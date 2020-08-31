data "aws_vpc" "default" {
  id = module.vpc.vpc_id
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 2.0"

  identifier = var.identifier

  engine            = "mysql"
  engine_version    = "5.7.19"
  instance_class    = var.instance_class
  allocated_storage = 5

  # DB subnet group
  subnet_ids = data.aws_subnet_ids.all.ids


  name     = var.name
  username = var.db_user
  password = var.db_password
  port     = "3306"
  vpc_security_group_ids = [aws_security_group.mediawiki_db.id]
  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"
  tags = {
    Environment = "dev"
  }

  # DB parameter group
  family = "mysql5.7"

  # DB option group
  major_engine_version = "5.7"

  # Snapshot name upon DB deletion
  final_snapshot_identifier = "demodb"

}
