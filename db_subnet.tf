resource "aws_db_subnet_group" "default" {
    name = local.resource_name
    subnet_ids = aws_subnet.database[*].id

    tags = merge(
        var.common_tags,
        var.db_subnet_group_tags,
        {
            Name = local.resource_name
        }
    )
  
}