output "jenkins_public_ip" {
  description = "Public IP of Jenkins EC2 instance"
  value       = aws_instance.jenkins.public_ip
}

output "jenkins_public_dns" {
  description = "Public DNS of Jenkins EC2 instance"
  value       = aws_instance.jenkins.public_dns
}

output "jenkins_url" {
  description = "Jenkins UI URL"
  value       = "http://${aws_instance.jenkins.public_dns}:8080"
}

output "ssm_connection_hint" {
  description = "Command example to connect through AWS Systems Manager Session Manager"
  value       = "aws ssm start-session --target ${aws_instance.jenkins.id} --region ${var.aws_region}"
}

output "jenkins_initial_admin_password_command" {
  description = "Command to retrieve initial Jenkins admin password through SSM"
  value       = "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
}
