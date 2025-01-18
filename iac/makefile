# Variables
TERRAFORM = terraform
PLAN_FILE = tfplan
VAR_FILE ?= 
TARGET ?= 

# Default target
.PHONY: all
all: plan apply

# Initialize Terraform
.PHONY: init
init:
	@$(TERRAFORM) init

# Run Terraform plan with optional var-file and target
.PHONY: plan
plan: init
	@echo "Running terraform plan..."
	@$(TERRAFORM) plan -out=$(PLAN_FILE) $(if $(VAR_FILE),-var-file=$(VAR_FILE)) $(if $(TARGET),--target=$(TARGET))

# Apply the saved plan
.PHONY: apply
apply: plan
	@echo "Applying terraform plan..."
	@$(TERRAFORM) apply $(PLAN_FILE)

# Clean up generated files
.PHONY: clean
clean:
	@echo "Cleaning up..."
	@rm -f $(PLAN_FILE)

# Display help message
.PHONY: help
help:
	@echo "Makefile for managing Terraform with options for var-file and target"
	@echo "Available targets:"
	@echo "  init       - Initialize Terraform"
	@echo "  plan       - Run Terraform plan with optional var-file and target"
	@echo "  apply      - Apply the saved Terraform plan"
	@echo "  clean      - Remove generated plan file"
	@echo "  help       - Display this help message"
	@echo ""
	@echo "Options (set via environment variables):"
	@echo "  VAR_FILE   - Path to a custom variable file (e.g., variables.tfvars)"
	@echo "  TARGET     - Specific resource to target (e.g., module.example)"

