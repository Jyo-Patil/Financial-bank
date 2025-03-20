resource "aws_dynamodb_table" "withdrawals" {
  name         = "Withdrawals"
  billing_mode = "PAY_PER_REQUEST" # Default settings with on-demand billing

  # Partition Key
  attribute {
    name = ["username"]
    type = "S" # String
  }

  # Additional Attributes
  attribute {
    name = ["accountnumber"]
    type = "N" # Number
  }

  attribute {
    name = ["date"]
    type = "S" # String
  }

  attribute {
    name = ["withdrawlamount"]
    type = "N" # Number
  }

  attribute {
    name = ["withdrawltype"]
    type = "S" # String
  }

  hash_key = ["username"]

  tags = {
    Name        = "Withdrawals"
    Environment = "Production"
  }
}

# Table: Deposits
resource "aws_dynamodb_table" "deposits" {
  name         = "Deposits"
  billing_mode = "PAY_PER_REQUEST"

  # Partition Key
  attribute {
    name = ["username"]
    type = "S" # String
  }

  # Additional Attributes
  attribute {
    name = ["accountnumber"]
    type = "N" # Number
  }

  attribute {
    name = ["date"]
    type = "S" # String
  }

  attribute {
    name = ["depositamount"]
    type = "N" # Number
  }

  attribute {
    name = ["deposittype"]
    type = "S" # String
  }

  hash_key = "username"

  tags = {
    Name        = "Deposits"
    Environment = "Production"
  }
}

# Table: Customers
resource "aws_dynamodb_table" "customers" {
  name         = "Customers"
  billing_mode = "PAY_PER_REQUEST"

  # Partition Key
  attribute {
    name = ["username"]
    type = "S" # String
  }

  # Additional Attributes
  attribute {
    name = ["accountnumber"]
    type = "N" # Number
  }

  attribute {
    name = ["balance"]
    type = "N" # Number
  }

  attribute {
    name = ["branch"]
    type = "S" # String
  }

  attribute {
    name = ["password"]
    type = "S" # String
  }

  attribute {
    name = ["phonenumber"]
    type = "N" # Number
  }

  hash_key = ["username"]

  tags = {
    Name        = "Customers"
    Environment = "Production"
  }
}