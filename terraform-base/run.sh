#!/bin/sh

# Set errexit, nounset and xtrace.
set -eux

cd terraform-base || true

terraform init \
    -no-color \
    -backend-config="bucket=${TF_STATE_S3_BUCKET}" \
    -backend-config="key=${TF_STATE_S3_OBJECT_KEY}" \
    -backend-config="dynamodb_table=${TF_STATE_LOCK_DYNAMODB_TABLE}" \
    ;

case "$TERRAFORM_OPERATION" in
PLAN)
    terraform plan \
        -no-color \
        -out="terraform.plan" \
        ;
    ;;
APPLY)
    terraform apply \
        -auto-approve \
        "$1" \
        ;
    ;;
*)
    printf "Unknown Terraform operation: %s\n" "$TERRAFORM_OPERATION"
    false
    ;;
esac
