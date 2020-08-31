terraform {
  backend "s3" {
    bucket = "krishnathoughts"
    key    = "mediawiki/infra.tfstate"
    region = "us-east-1"
  }
}
