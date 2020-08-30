resource "aws_db_instance" "mediawiki_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = var.user
  password             = var.password 
  parameter_group_name = "default.mysql5.7"
  final_snapshot_identifier = false
  publicly_accessible = true
}
