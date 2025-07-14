# 👋 Welcome to the Zscaler IaC DevSecOps Toolkit

This toolkit enables secure, local-first infrastructure-as-code development and testing for Zscaler (ZIA/ZPA) using:

✅ Terraform  
✅ Open Policy Agent (OPA)  
✅ Gatekeeper YAML validation  
✅ Sentinel (Terraform Cloud policies)  
✅ GitHub Actions and Docker  
✅ Developer-friendly setup with pre-commit, Makefile, and VS Code devcontainers

---

## 🚀 Getting Started (Local Setup)

### 1. Clone the Repo
```bash
git clone https://your-repo-url zscaler-iac-pipeline
cd zscaler-iac-pipeline
```

### 2. Run the Bootstrap Script
```bash
./bootstrap.sh
```

This will:
- Build the Docker image
- Set up pre-commit hooks (if available)
- Provide instructions for local testing

---

## 🧪 Developer Workflows

| Task                      | Command                             |
|---------------------------|--------------------------------------|
| Run OPA tests             | `make test`                         |
| Run Terraform plan        | `make plan`                         |
| Apply Terraform changes   | `make apply`                        |
| Validate Gatekeeper YAML  | `make gatekeeper`                   |
| Start Dev Container       | `docker-compose run zscaler-devsecops` |

---

## 💻 VS Code Dev Container (Optional)
If you use **VS Code** with Docker:

1. Open the project folder in VS Code
2. Press `F1` → **Remote-Containers: Reopen in Container**
3. Terminal is ready with all tools

---

## ☁️ GitHub Codespaces (Optional)
1. Open this repo in GitHub
2. Click `Code → Codespaces → New codespace`
3. Devcontainer auto-loads with full environment

---

## 🔍 Pre-commit Hooks
Automatically run checks before every commit. Installed during bootstrap, or run:
```bash
pre-commit install
```

---

## 🔐 Terraform Cloud (Optional)
You can enforce Sentinel policies by uploading from the `/sentinel` folder and assigning them to your Terraform Cloud workspace.

---

Need help? Ping the DevSecOps lead or open an issue in this repo.
