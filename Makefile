init:
	terraform init

plan:
	terraform plan

apply:
	terraform apply

destroy:
	terraform destroy

lint:
	terraform fmt -check -recursive
	tflint
	terraform validate
	tfsec .
	checkov -q -d .

docs:
	terraform-docs markdown table --output-file README.md --output-mode inject .
	terraform-docs markdown table --output-file modules/powervs-instance/README.md --output-mode inject modules/powervs-instance
