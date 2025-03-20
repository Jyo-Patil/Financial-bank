# Table: Withdrawals
resource "aws_dynamodb_table" "withdrawals" {
  name         = "Withdrawals"
  billing_mode = "PAY_PER_REQUEST"

  # Partition Key
  hash_key = "username"

  # Attributes
  attribute {
    name = "username"
    type = "S"
  }

  attribute {
    name = "accountnumber"
    type = "N"
  }

  attribute {
    name = "date"
    type = "S"
  }

  attribute {
    name = "withdrawlamount"
    type = "N"
  }

  attribute {
    name = "withdrawltype"
    type = "S"
  }

  # Global Secondary Index (GSI)
  global_secondary_index {
    name               = "accountnumber-index"
    hash_key           = "accountnumber"
    projection_type    = "ALL"
  }

  global_secondary_index {
    name               = "withdrawltype-index"
    hash_key           = "withdrawltype"
    projection_type    = "ALL"
  }

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
  hash_key = "username"

  # Attributes
  attribute {
    name = "username"
    type = "S"
  }

  attribute {
    name = "accountnumber"
    type = "N"
  }

  attribute {
    name = "date"
    type = "S"
  }

  attribute {
    name = "depositamount"
    type = "N"
  }

  attribute {
    name = "deposittype"
    type = "S"
  }

  # Global Secondary Index (GSI)
  global_secondary_index {
    name               = "deposittype-index"
    hash_key           = "deposittype"
    projection_type    = "ALL"
  }

  global_secondary_index {
    name               = "accountnumber-index"
    hash_key           = "accountnumber"
    projection_type    = "ALL"
  }

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
  hash_key = "username"

  # Attributes
  attribute {
    name = "username"
    type = "S"
  }

  attribute {
    name = "accountnumber"
    type = "N"
  }

  attribute {
    name = "balance"
    type = "N"
  }

  attribute {
    name = "branch"
    type = "S"
  }

  attribute {
    name = "password"
    type = "S"
  }

  attribute {
    name = "phonenumber"
    type = "N"
  }

  # Global Secondary Index (GSI)
  global_secondary_index {
    name               = "accountnumber-index"
    hash_key           = "accountnumber"
    projection_type    = "ALL"
  }

  global_secondary_index {
    name               = "phonenumber-index"
    hash_key           = "phonenumber"
    projection_type    = "ALL"
  }

  tags = {
    Name        = "Customers"
    Environment = "Production"
  }
}
