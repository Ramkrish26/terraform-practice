resource "random_integer" "rand" {
  min = 10000
  max = 99999
}

locals {
  s3_bucket_name = "terraform-${random_integer.rand.result}"
}