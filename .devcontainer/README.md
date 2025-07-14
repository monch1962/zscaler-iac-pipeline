# 🛠 .devcontainer for VS Code

This configuration allows developers to launch the entire Zscaler IaC toolkit in a preconfigured Docker development container using VS Code.

## 📦 Features
- Mounted volumes for Terraform, OPA, Sentinel, and Gatekeeper
- Auto-installed extensions (Terraform, Docker, YAML)
- Shared terminal and pre-commit hook setup

## 🚀 Usage
1. Open this folder in **VS Code**
2. Run `Remote-Containers: Reopen in Container`
3. Start coding and use integrated terminal to:
   - Run `make test`, `make plan`, or `opa` commands
