# Intentionally misconfigured — RDS instance without encryption
resource "aws_db_instance" "unencrypted" {
  identifier        = "cortex-lab-db"
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  username          = "admin"
  password          = "password123"

  storage_encrypted = false
  publicly_accessible = true
  skip_final_snapshot = true
}
