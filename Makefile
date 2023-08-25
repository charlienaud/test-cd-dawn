.DEFAULT_GOAL = help

# —— Variables —————————————————————————————————————————————
THEME_PATH = ./

## —— Shopify theme Makefile ——————————————————————————————————
.PHONY: help
help: ## Outputs this help screen
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

## —— Coding standards  —————————————————————————————————————
.PHONY: theme-check
theme-check: ## Run shopify theme check
	@shopify theme check --auto-correct --fail-level=error --path=$(THEME_PATH)

.PHONY: precommit
precommit: theme-check ## Run precommit checks
