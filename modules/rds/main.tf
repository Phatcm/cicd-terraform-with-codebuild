resource "aws_db_instance" "rds" {
  identifier             = var.identifier
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  username               = var.username
  password               = var.password
  vpc_security_group_ids = [var.database_sg_id]
  db_subnet_group_name   = var.db_subnet_group_name
  backup_retention_period = 7


  # Enable backups
  backup_window = "03:00-04:00"
  maintenance_window = "Mon:04:00-Mon:04:30"
  skip_final_snapshot = true
  delete_automated_backups = true

  tags = merge(
    {
      "Name" = "${var.project}-${var.identifier}"
    }
  )
}
