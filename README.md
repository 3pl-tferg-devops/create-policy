# User Documentation for Bash Script: `create-policy.sh`

## Overview

The `create-policy.sh` script is a Bash script designed to help you convert an AWS Identity and Access Management (IAM) policy to a Terraform configuration file. The script uses the AWS Command Line Interface (CLI) and the `iam-policy-json-to-terraform` tool to perform the conversion.

## Prerequisites

Before using the `create-policy.sh` script, ensure you have the following prerequisites:

1. AWS CLI: The AWS CLI must be installed and configured with the necessary credentials. You can install the AWS CLI by following the instructions on the [AWS CLI User Guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

2. `iam-policy-json-to-terraform` tool: The script relies on the `iam-policy-json-to-terraform` tool to perform the actual conversion. Ensure that this tool is installed and available in your system's PATH. You can find the tool's documentation on the GitHub repository: [iam-policy-json-to-terraform](https://github.com/flosell/iam-policy-json-to-terraform). You can install it with the below command:

```bash
brew install iam-policy-json-to-terraform
```

## Usage

To use the script, follow the steps below:

Make the script executable (if not already) by running the following command:

```bash
chmod +x create-policy.sh
```

Run the script with the required parameters:

```bash
./create-policy.sh <AWS_PROFILE> <POLICY_NAME>
```

Replace <AWS_PROFILE> with the name of the AWS CLI profile you want to use. This profile must have the necessary IAM permissions to list and retrieve policies.

Replace <POLICY_NAME> with the name of the IAM policy you want to convert to Terraform configuration. The script will search for the policy with the given name, and if found, it will generate a Terraform configuration file named <POLICY_NAME>.tf.

Note: The Terraform configuration file will be generated in the same directory where the script is located.

## Script Functions

The script contains several functions to handle different tasks:

1. `get_policy_arn()`: This function takes the name of an IAM policy as input and retrieves the ARN (Amazon Resource Name) of the policy using the AWS CLI.

2. `get_policy_metadata()`: This function takes an IAM policy ARN as input and retrieves the default version ID of the policy using the AWS CLI.

3. `get_policy_json()`: This function takes an IAM policy ARN and a version ID as input and retrieves the JSON representation of the policy using the AWS CLI.

4. `main()`: The main function is the entry point of the script. It takes two arguments: the AWS profile name and the IAM policy name. The function sets the AWS profile, gets the ARN and version ID of the policy, and then converts the JSON policy to a Terraform configuration file using `iam-policy-json-to-terraform`.

## Error Handling

The script utilizes the `set -e` option to enable immediate exit on any error that occurs during execution. If any of the AWS CLI commands fail to execute successfully, the script will terminate, and the error message will be displayed on the terminal.

## Example

Here's an example of how to use the `create-policy.sh` script:

Suppose you have an AWS CLI profile named `my_aws_profile`, and you want to convert an IAM policy named `MyEC2Policy` to a Terraform configuration.

Run the following command:

```bash
./create-policy.sh my_aws_profile MyEC2Policy
```

The script will use the `my_aws_profile` AWS CLI profile to find the policy with the name `MyEC2Policy`. If found, it will convert the policy to a Terraform configuration and save it as `MyEC2Policy.tf` in the same directory.

## Important Notes

- Ensure that you have the necessary permissions in your AWS CLI profile to list and retrieve IAM policies.

- Double-check the generated Terraform configuration file for correctness before using it in your infrastructure.

- Always review the IAM policy's implications before applying it to your AWS resources to prevent unintended access.

- Remember to keep your AWS credentials secure and avoid sharing them in plaintext. Use AWS profile configurations to manage credentials securely.

## Conclusion

The `create-policy.sh` script is a helpful tool to convert IAM policies into Terraform configuration files, enabling you to manage access control in your AWS infrastructure more effectively. Please ensure you meet the prerequisites and follow the usage instructions to utilize the script successfully. If you encounter any issues or have questions, feel free to seek assistance from your system administrator or refer to the script's documentation.
