# Makefile for setting up environment
#################### Read Environment
RUNTIME_FILE := ./config/runtime/runtime.env
include $(RUNTIME_FILE)

#################### Makefile Configuration
GIT_ROOT ?= $(shell git rev-parse --show-toplevel)
# e.g., Darwin for MacOS
PLATFORM_TYPE = $(shell uname)
# dynamically detect shell type as bash or zsh
ifeq ($(shell basename $(SHELL)), zsh)
        SHELL := zsh
		SHELL_CONFIG := $(HOME)/.zshrc
else
        SHELL := bash
		SHELL_CONFIG := $(HOME)/.bashrc
endif

#################### Makefile Context
.DEFAULT_GOAL := info

.PHONY: help info info_dotfiles
help:
	@echo "Commands  : "
	@echo "download  : downloads dependencies distribution"
	@echo "system    : Installs System Libraries per $(PLATFORM_TYPE)"
	@echo "install   : create environment based on project $(PACKAGE_INSTALL_NAME)"
	@echo "format    : formatting and linting of project $(PACKAGE_NAME)"
	@echo "clean     : cleans all files or project $(PACKAGE_INSTALL_NAME)"
	@echo "test      : execute unit testing"

info:
	@echo "Package:        $(PACKAGE_INSTALL_NAME) - $(PACKAGE_NAME)"
	@echo "Platform:       ${PLATFORM_TYPE}"
	@echo "Architecture:   $$(uname -m)"
	@echo "Shell:          $(SHELL)"

info_dotfiles:
	@echo "Dotfiles Repo:      $(DOTFILES_REPO)"
	@echo "Dotfiles Remote:    $(DOTFILES_REMOTE)"
	@echo "Dotfiles Branch:    $(BRANCH)"


#################### Installation
.PHONY: install install_setup install_dotfiles link_dotfiles link_vaultspace

install:
	@echo "Installing package $(PACKAGE_INSTALL_NAME) for development..."
	$(MAKE) install_setup
	$(MAKE) install_dotfiles
	$(MAKE) link_vaultspace

install_setup:
	@echo "Installing Setup for $(PACKAGE_NAME)..."
	mkdir -p .velari
	mkdir -p _build docs config
	touch .env.template

install_dotfiles:
	@echo "Installing Dotfiles from $(DOTFILES_REPO)..."
	@if [ ! -d $(DOTFILES_DIR) ]; then \
		git clone $(DOTFILES_REPO) $(DOTFILES_DIR) && $(MAKE) link_dotfiles; \
	fi

# links to dotfiles: e.g., .vscode, .github for project configuration and templates
link_dotfiles:
	@echo "Linking Dotfiles..."
	ln -sf $(DOTFILES_DIR)/.vscode .vscode
	ln -sf $(DOTFILES_DIR)/.github .github

# links to obsidian vaults for contextlib, artifactlib, promptlib
link_vaultspace:
	@echo "Linking Vaultspace..."
	mkdir -p stores
	ln -sfn $(VAULTSPACE_ROOT)/contextlib 	stores/contextlib
	ln -sfn $(VAULTSPACE_ROOT)/artifactlib 	stores/artifactlib
	ln -sfn $(VAULTSPACE_ROOT)/promptlib 	stores/promptlib

#################### Coding Agents
.PHONY: install_agent setup_agent setup_agent_claude install_agent_claude
.PHONY: install_marketplace_claude install_plugin_claude
.PHONY: install_plugin_local

install_agent:
	@echo "Installing Coding Agent..."
	$(MAKE) setup_agent
# directory structure
	$(MAKE) install_agent_claude
	$(MAKE) install_agent_gemini
# create links
#	$(MAKE) link_agents
#	$(MAKE) verify_agents
# external marketplace and plugins
	$(MAKE) install_marketplace_claude
	$(MAKE) install_plugin_claude

setup_agent:
	@echo "Setting up Coding Agents..."
	touch AGENTS.md CLAUDE.md GEMINI.md
#	touch USER.md
# 	touch MEMORY.md
# 	touch BACKLOG.md GOALS.md
	mkdir -p .agents

install_agent_claude:
	@echo "Installing Claude Coding Agent..."
	claude --version
# user level
	mkdir -p .claude
	mkdir -p .claude-plugin
	touch .claude/CLAUDE.md
# plugin level
	mkdir -p $(PACKAGE_DIR)/{agents,commands,skills,rules,hooks}
	touch $(PACKAGE_DIR)/settings.json
	touch $(PACKAGE_DIR)/settings.local.json

install_agent_gemini:
	@echo "Installing Gemini Coding Agent..."
	mkdir -p .gemini

install_marketplace_claude:
	@echo "Installing Marketplace..."
	@claude plugin marketplace add anthropics/skills
	@claude plugin marketplace add anthropics/claude-plugins-official

install_plugin_claude:
	@echo "Installing Claude Plugins..."
	@claude plugin install skill-creator@claude-plugins-official   --scope project
	@claude plugin install playground@claude-plugins-official      --scope project
	@claude plugin install frontend-design@claude-plugins-official --scope project
# development languages
	@claude plugin install pyright-lsp@claude-plugins-official 	   --scope project
	@claude plugin install typescript-lsp@claude-plugins-official  --scope project
# development
	@claude plugin install context7@claude-plugins-official 	   --scope project
	@claude plugin install superpowers@claude-plugins-official 	   --scope project
	@claude plugin install code-simplifier@claude-plugins-official --scope project
	@claude plugin install code-review@claude-plugins-official 	   --scope project
	@claude plugin install github@claude-plugins-official 	   	   --scope project
	@claude plugin install commit-commands@claude-plugins-official --scope project
# connectors
	@claude plugin install slack@claude-plugins-official 	   	   --scope project
	@claude plugin install playwright@claude-plugins-official 	   --scope project
# general
	@claude plugin install feature-dev@claude-plugins-official 	   --scope project
	@claude plugin install document-skills@anthropic-agent-skills  --scope project

install_plugin_local:
# /plugin marketplace remove velaristudios-local
	@echo "Installing Local Claude Plugins..."
	@claude --plugin-dir ./packages/ai/focus --plugin-dir ./packages/docgen --plugin-dir ./packages/research
	@claude plugin validate ./packages
	@claude plugin marketplace add ./packages
	@claude plugin install focus@velaristudios-local    --scope project
	@claude plugin install docgen@velaristudios-local   --scope project
	@claude plugin install research@velaristudios-local --scope project


#################### General
.PHONY: clean
clean:
	echo "Cleaning project files for installed package ..."
	rm -rf ./__pycache__
	find . -name "*.pyc" -delete
	find . -name "*.pyo" -delete
	find . -name "__pycache__" -delete
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name "outputs" -exec rm -rf {} +
	find . -name "*.out" -delete
	find . -name ".DS_Store" -delete
