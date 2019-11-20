resource "aws_key_pair" "chase-key" {
  key_name   = "chase.kim-key"
  public_key = file("sshkey4wowang.pub")
}
