# AWS Networking: Missing Security Group Rule Description.
Ensure that all the rules defined for your Amazon EC2 security groups have a description to help simplify your operations and remove any opportunities for operator errors. Adding descriptive text for security group rules will allow you to store locally useful information without the need to keep any documentation external and separated from the EC2 service. The information provided as description can be used for multiple purposes such as EC2/application firewall auditing, security group rules management, third-party auditing, etc. A rule description can be up to 255 characters long and can be defined and viewed from the AWS Management Console, AWS Command Line Interface (CLI) and using the AWS API

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

policy.sentinel:52:1 - Rule "main"
  Value:
    {"resource_violations": ["aws_security_group_rule.bad_example"]}

policy.sentinel:48:1 - Rule "denied"
  Description:
    --------------------------------------------------------
    ID:          TFS-AWS-0002
    Category:    Networking
    Provider:    hashicorp/aws
    Resource:    aws_security_group_rule
    Violation:   Security Group Rule has missing description
    Severity:    Low
    --------------------------------------------------------
    Solution:

    Ensure that all "aws_security_group_rule" resources
    have a "description" argument that describes the
    function of the rule.
    --------------------------------------------------------
    Example:

      resource "aws_security_group_rule" "https" {
       + description = "HTTPS from VPC"
         security_group_id = aws_security_group.main.id
         ...
      }
    --------------------------------------------------------

  Value:
    {"resource_violations": ["aws_security_group_rule.bad_example"]}

```

## Remediation / Resolution
In order to receive a `pass` policy check result, you will need to ensure that a `description` argument is present in all `aws_security_group_rule` Terraform configuration blocks.

## Resources

- [Policy Logic: Sentinel Playground](https://play.sentinelproject.io/p/pURbx0XYoXZ)
- [Resource: aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)
- [Resource: aws_security_group_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule)
- [Trend Micro: Descriptions for Security Group Rules](https://www.cloudconformity.com/knowledge-base/aws/EC2/security-group-rules-description.html)
