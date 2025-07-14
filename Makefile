.PHONY: test plan apply gatekeeper

test:
	@echo "🔍 Running OPA Rego policy tests..."
	opa test policy/ policy/test/

plan:
	@echo "📦 Running Terraform plan..."
	cd terraform && terraform init && terraform plan -out=tfplan.binary && terraform show -json tfplan.binary > tfplan.json

apply:
	@echo "🚀 Applying Terraform..."
	cd terraform && terraform apply tfplan.binary

gatekeeper:
	@echo "🔐 Validating Gatekeeper YAML files..."
	for file in gatekeeper/*.yaml; do \
		echo "✅ Checking $$file"; \
		opa eval --format pretty --data gatekeeper --input $$file "data"; \
	done
