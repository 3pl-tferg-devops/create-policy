# create-policy

This is just a little script you can use to generate an aws_iam_policy_document from an existing IAM policy.

The idea is to stick this script in your path and run it from the directory you want to generate the policy document in. 

## Usage

```bash
create-policy <aws-account> <iam-policy> # E.g. create-policy blake-staging blake-admin-policy
```

## Dependencies

## [AWS CLI](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/index.html)

```bash
asdf install awscli 2.11.7
```

### [iam-policy-json-to-terraform](https://github.com/flosell/iam-policy-json-to-terraform)

```bash
asdf plugin add iam-policy-json-to-terraform https://github.com/carlduevel/asdf-iam-policy-json-to-terraform.git
```

```bash
asdf install iam-policy-json-to-terraform 1.8.2
```

## Installation

Clone the repo and add it to your $PATH

```bash
git clone git@github.com:3pl-tferg-devops/create-policy.git
```

```bash
echo "export PATH=\"\$PATH:$(pwd)/create-policy\"" >> ~/.zshrc
```

Remember to source your ~/.zshrc or reload your shell

```bash
source ~/.zshrc
```
