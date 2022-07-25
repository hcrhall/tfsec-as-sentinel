# AWS Networking: Default Virtual Private Cloud is in use.
Ensure that your AWS application is not deployed within the default Virtual Private Cloud in order to follow security best practices. A default Virtual Private Cloud is a logically isolated virtual network created automatically for your AWS account the first time you provision Amazon EC2 resources. A default VPC is suitable for getting started quickly, however, when you deploy complex applications and use multi-tier architectures you may need to keep parts of your network private or customize the network model, therefore it is recommended to create a non-default VPC that suits your specific requirements.

## Policy Result
```
Sentinel Result: false

This result means that one or more Sentinel policies failed. More than likely,
this was due to the discovery of violations by the main rule and other
sub-rules. Please see the details of the policies executed below to find the
violation(s), which is usually indicated by a rule with a false boolean value,
or non-zero collection data.

1 policies evaluated.

## Policy 1: policy.sentinel (hard-mandatory)

Result: false

policy.sentinel:47:1 - Rule "main"
  Value:
    {"resource_violations": ["aws_default_vpc.default"]}

policy.sentinel:43:1 - Rule "denied"
  Description:
    --------------------------------------------------------
    ID:          TFS-AWS-0003
    Category:    Networking
    Provider:    hashicorp/aws
    Resource:    aws_default_vpc
    Violation:   Default VPC resource defined
    Severity:    High
    --------------------------------------------------------
    Solution:

    New resources should not be created in the default VPC
    and the "aws_default_vpc" resource it should not be
    present in Terraform configuration.
    --------------------------------------------------------
    Example:

     - resource "aws_default_vpc" "default" {...}
    --------------------------------------------------------

  Value:
    {"resource_violations": ["aws_default_vpc.default"]}
```

## Remediation / Resolution
In order to receive a `pass` policy check result, you will need to remove all `aws_default_vpc` resources from the Terraform configuration.

## Resources

- [Policy Logic: Sentinel Playground](https://play.sentinelproject.io/p/qufsauqJLoN)
- [Resource: aws_default_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_vpc)
- [Trend Micro: Default VPC In Use](https://www.trendmicro.com/cloudoneconformity/knowledge-base/aws/VPC/default-vpc-in-use.html)
