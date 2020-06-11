output "public_ip" {
  value       = aws_eip.this.public_ip
  description = "The public IP of the instance created"
}

output "instance_id" {
  value       = aws_instance.this.id
  description = "The instance ID created"
}

output "key_name" {
  value       = join("", aws_key_pair.this.*.key_name)
  description = "The key pair name created"
}

output "ssh_command" {
  value = "ssh -i ${var.private_key_path} ubuntu@${aws_eip.this.public_ip}"
}