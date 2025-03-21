resource "aws_dynamodb_table_item" "Customers" {
  table_name = aws_dynamodb_table.Customers.name
  hash_key   = aws_dynamodb_table.Customers.hash_key

  item = <<ITEM
{
  "username": {"S": "adi"},
  "accountnumber": {"N": "11111"},
  "balance": {"N": "22222"},
  "branch": {"S": "bgm"},
  "password": {"S": "four"},
  "phonenumber": {"N": "2222245685"}
}
ITEM
}

resource "aws_dynamodb_table" "Customers" {
  name           = "Customers"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "username"

  attribute {
    name = "username"
    type = "S"
  }
}

resource "aws_dynamodb_table_item" "Deposits" {
  table_name = aws_dynamodb_table.Deposits.name
  hash_key   = aws_dynamodb_table.Deposits.hash_key

  item = <<ITEM
{
  "username": {"S": "nmh"},
  "accountnumber": {"N": "11189"},
  "date": {"S": "23-09-2024"},
  "depositamount": {"N": "700"},
  "deposittype": {"S": "saving"}
}
ITEM
}

resource "aws_dynamodb_table" "Deposits" {
  name           = "Deposits"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "username"

  attribute {
    name = "username"
    type = "S"
  }
}

resource "aws_dynamodb_table_item" "Withdrawals" {
  table_name = aws_dynamodb_table.Withdrawals.name
  hash_key   = aws_dynamodb_table.Withdrawals.hash_key

  item = <<ITEM
{
  "username": {"S": "xyz"},
  "accountnumber": {"N": "111456"},
  "date": {"S": "28-09-2024"},
  "withdralamount": {"N": "800"},
  "Withdrawltype": {"S": "Online"}
}
ITEM
}

resource "aws_dynamodb_table" "Withdrawals" {
  name           = "Withdrawltype"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "username"

  attribute {
    name = "username"
    type = "S"
  }
}