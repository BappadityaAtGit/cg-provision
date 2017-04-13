resource "aws_db_parameter_group" "parameter_group" {
  name   = "${var.rds_parameter_group_name != "" ?
    var.rds_parameter_group_name :
    "${replace("${var.stack_description}-${var.rds_db_name}", "/[^a-zA-Z-]+/", "-")}"}"
  family = "${var.rds_parameter_group_family}"

  parameter {
    name  = "log_connections"
    value = "1"
  }

  parameter {
    name  = "log_disconnections"
    value = "1"
  }

  parameter {
    name  = "log_hostname"
    value = "0"
  }

  parameter {
    name  = "log_statement"
    value = "ddl"
  }
}
