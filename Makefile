PROJECT_ROOT := $(shell git rev-parse --show-toplevel)

#//////////////////////////////////////////////////////////////////////////////
# TASKS
#//////////////////////////////////////////////////////////////////////////////

.PHONY: galaxy-update
galaxy-update: ## Retrieve roles and collections from Ansible Galaxy
	@echo "--- Downloading roles"
	@ansible-galaxy install -r requirements.yml
	@echo "--- Downloading collections"
	@ansible-galaxy collection install -r requirements.yml

.PHONY: deploy
deploy: galaxy-update ## Run the site.yml playbook
	@echo "--- Deploying site.yml"
	@ansible-playbook --diff site.yml

.PHONY: dry-run
dry-run: galaxy-update ## Dry-run the deployment of the site.yml playbook
	@echo "--- Dry-running site.yml"
	@ansible-playbook --diff --check site.yml

.PHONY: help
help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "; printf "\nUsage:\n"}; {printf "  %-15s %s\n", $$1, $$2}'
	@echo

.DEFAULT_GOAL := help

