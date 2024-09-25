resource "aws_nat_gateway" "main" {
    allocation_id = aws_eip.nat.id
    subnet_id = aws_subnet.public[0].id

    tags = merge(
        var.common_tags,
        var.nat_gateway_tags,
        {
            Name = local.resource_name
        }
    )

    # To ensure proper ordering, it is recommended to add an explicit dependency
    # on the Internet Gateway for the VPC.

    depends_on = [ aws_internet_gateway.main ]
  
}