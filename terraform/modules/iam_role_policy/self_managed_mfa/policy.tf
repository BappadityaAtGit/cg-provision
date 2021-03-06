data "template_file" "policy" {
  # from https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_examples_aws_my-sec-creds-self-manage-mfa-only.html
  template = "${file("${path.module}/policy.json")}"
  vars {
    aws_partition = "${var.aws_partition}"
  }
}

resource "aws_iam_policy" "iam_policy" {
  name = "${var.policy_name}"
  policy = "${data.template_file.policy.rendered}"
}
