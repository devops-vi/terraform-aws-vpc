resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id

    tags = merge(
        var.common_tags,
        var.public_route_table_tags,
        {
            Name = "${local.resource_name}-public"
        }
    )
  
}

resource "aws_route_table" "private" {
    vpc_id = aws_vpc.main.id

    tags = merge(
        var.common_tags,
        var.private_route_table_tags,
        {
            Name = "${local.resource_name}-private"
        }
    )  
}

resource "aws_route_table" "database" {
    vpc_id = aws_vpc.main.id

    tags = merge(
        var.common_tags,
        var.database_route_table_tags,
        {
            Name = "${local.resource_name}-database"
        }
    )  
}