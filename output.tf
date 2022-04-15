output "vm-out" {
  value       = aws_instance.ganesh-2022.public_ip
  description = "vm public ip"
}