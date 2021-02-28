# AWS subnets Terraform module

Terraform module which creates subnets and routing tables in an existing VPC on AWS.

## Terraform versions

Terraform 0.12 and newer. 

## Usage

```hcl
module "subnets" {
  source                 = "/path/to/module/terraform-aws-subnets"
  name                   = var.name
  azs                    = var.azs
  vpc_id                 = var.vpc_id
  internet_gateway_id    = var.internet_gateway_id
  nat_gateway_ids        = var.nat_gateway_ids
  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az
  public_subnets         = var.public_subnets
  public_subnet_tags     = {
    Type = "public"
  }
  private_subnets        = var.private_subnets
  private_subnet_tags    = {
    Type = "private"
  }
  tags                   = {
    Environment = var.environment,
    Project     = var.project
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.6 |
| aws | >= 2.65 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.65 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| assign\_ipv6\_address\_on\_creation | Assign IPv6 address on subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map\_public\_ip\_on\_launch | `bool` | `false` | no |
| azs | A list of availability zones in the region | `list(string)` | `[]` | no |
| enable\_ipv6 | Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block. | `bool` | `false` | no |      
| enable\_nat\_gateway | Should be true if you want to provision NAT Gateways for each of your private networks | `bool` | `false` | no |
| internet\_gateway\_id | ID of internet gateway | `string` | `null` | no |
| map\_public\_ip\_on\_launch | Should be false if you do not want to auto-assign public IP on launch | `bool` | `true` | no |
| name | Name to be used on all resources as prefix | `string` | n/a | yes |
| nat\_gateway\_ids | List of nat gateway ids | `list(string)` | `[]` | no |
| one\_nat\_gateway\_per\_az | Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`. | `bool` | `false` | no |
| private\_route\_table\_tags | Additional tags for the private route tables | `map(string)` | `{}` | no |
| private\_subnet\_assign\_ipv6\_address\_on\_creation | Assign IPv6 address on private subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map\_public\_ip\_on\_launch | `bool` | `null` | no |
| private\_subnet\_ipv6\_prefixes | Assigns IPv6 private subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list | `list` | `[]` | no |
| private\_subnet\_suffix | Suffix to append to private subnets name | `string` | `"private"` | no |
| private\_subnet\_tags | Additional tags for the private subnets | `map(string)` | `{}` | no |
| private\_subnets | A list of private subnets inside the VPC | `list(string)` | `[]` | no |
| public\_route\_table\_tags | Additional tags for the public route tables | `map(string)` | `{}` | no |
| public\_subnet\_assign\_ipv6\_address\_on\_creation | Assign IPv6 address on public subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map\_public\_ip\_on\_launch | `bool` | `null` | no |
| public\_subnet\_ipv6\_prefixes | Assigns IPv6 public subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list | `list` | `[]` | no |
| public\_subnet\_suffix | Suffix to append to public subnets name | `string` | `"public"` | no |
| public\_subnet\_tags | Additional tags for the public subnets | `map(string)` | `{}` | no |
| public\_subnets | A list of public subnets inside the VPC | `list(string)` | `[]` | no |
| region | Name of region for VPC Endpoint | `string` | `"eu-central-1"` | no |
| single\_nat\_gateway | Should be true if you want to provision a single shared NAT Gateway across all of your private networks | `bool` | `false` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| vpc\_id | String of vpc id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| private\_subnets | List of private subnet ids |
| public\_subnets | List of public subnet ids |

## Authors

Module managed by [Marcel Emmert](https://github.com/echomike80).

## License

Apache 2 Licensed. See LICENSE for full details.
