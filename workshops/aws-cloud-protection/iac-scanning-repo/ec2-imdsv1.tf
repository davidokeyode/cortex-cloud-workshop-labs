# Intentionally misconfigured — EC2 instance using IMDSv1
resource "aws_instance" "imdsv1" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional"  # Should be "required" for IMDSv2
  }

  tags = {
    Name = "cortex-lab-imdsv1"
  }
}
