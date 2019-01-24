provider "aws" {
  region  = "us-east-1"
  version = "1.33.0"
  profile = "demo-east"
}

provider "aws" {
  alias   = "west"
  region  = "us-west-2"
  version = "1.33.0"
  profile = "demo-west"
}