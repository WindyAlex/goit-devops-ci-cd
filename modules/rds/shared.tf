locals {
  is_postgres = can(regex("postgres", var.engine))
  family = var.use_aurora ? (
    local.is_postgres ? "aurora-postgresql15" : "aurora-mysql8.0"
    ) : (
    local.is_postgres ? "postgres15" : "mysql8.0"
  )
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}

resource "aws_security_group" "this" {
  name        = "${var.project_name}-db-sg"
  description = "Allow database access inside VPC"
  vpc_id      = var.vpc_id

  ingress {
    description = "PostgreSQL/MySQL from VPC"
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-db-sg"
  }
}

resource "aws_db_parameter_group" "this" {
  count = var.use_aurora ? 0 : 1

  name   = "${var.project_name}-rds-parameter-group"
  family = local.family

  parameter {
    name         = "log_statement"
    value        = "none"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "max_connections"
    value        = "100"
    apply_method = "pending-reboot"
  }

  dynamic "parameter" {
    for_each = local.is_postgres ? [1] : []
    content {
      name         = "work_mem"
      value        = "4096"
      apply_method = "pending-reboot"
    }
  }

  tags = {
    Name = "${var.project_name}-rds-parameter-group"
  }
}

resource "aws_rds_cluster_parameter_group" "this" {
  count = var.use_aurora ? 1 : 0

  name   = "${var.project_name}-aurora-parameter-group"
  family = local.family

  parameter {
    name         = "log_statement"
    value        = "none"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "max_connections"
    value        = "100"
    apply_method = "pending-reboot"
  }

  dynamic "parameter" {
    for_each = local.is_postgres ? [1] : []
    content {
      name         = "work_mem"
      value        = "4096"
      apply_method = "pending-reboot"
    }
  }

  tags = {
    Name = "${var.project_name}-aurora-parameter-group"
  }
}

resource "aws_db_parameter_group" "aurora_instance" {
  count = var.use_aurora ? 1 : 0

  name   = "${var.project_name}-aurora-instance-parameter-group"
  family = local.family

  parameter {
    name         = "log_statement"
    value        = "none"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "max_connections"
    value        = "100"
    apply_method = "pending-reboot"
  }

  dynamic "parameter" {
    for_each = local.is_postgres ? [1] : []
    content {
      name         = "work_mem"
      value        = "4096"
      apply_method = "pending-reboot"
    }
  }

  tags = {
    Name = "${var.project_name}-aurora-instance-parameter-group"
  }
}