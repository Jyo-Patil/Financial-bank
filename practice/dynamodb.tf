resource "aws_dynamodb_table_item" "Customers" {
  table_name = aws_dynamodb_table.Customers.name
  hash_key   = aws_dynamodb_table.Customers.hash_key

  item = <<ITEM
{
  "exampleHashKey": {"S": "username"},
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