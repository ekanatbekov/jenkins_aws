resource "aws_instance" "jenkins" {
  ami           = "ami-026b57f3c383c2eec" 
  instance_type = "t2.micro"
  user_data = file("jenkins.sh")
  key_name = "jenkins"
  tags = {
    Name = "test"
  }
}



resource "aws_key_pair" "jenkins" {
  key_name   = "jenkins"
  public_key = "${file("keypair.txt")}"
}
output "jenkins" {
  value = aws_instance.jenkins.public_ip
}


# resource "aws_iam_policy" "policy_one" {
#   name = "jenkins"

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action   = "*"
#         Effect   = "Allow"
#         Resource = "*"
#       },
#     ]
#   })
# }
# resource "aws_iam_role" "jenkins" {
#   name                = "jenkins"
#   assume_role_policy  = aws_iam_policy.policy_one.policy
# #   managed_policy_arns = []
# }
# resource "aws_iam_role_policy_attachment" "test-attach" {
#   role       = aws_iam_role.role.name
#   policy_arn = aws_iam_policy.policy.arn
# }