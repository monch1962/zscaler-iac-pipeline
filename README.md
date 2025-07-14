# Zscaler IaC Guardrails with Terraform + OPA + Sentinel + GitHub Actions

This project enables secure, policy-enforced delivery of Zscaler ZIA and ZPA configurations using:

- **Terraform**: To define infrastructure-as-code
- **OPA (Open Policy Agent)** and **Conftest**: For local and CI policy validation
- **Sentinel**: For policy enforcement in Terraform Cloud
- **GitHub Actions**: To run policy checks on PRs and commits

---

## 🧪 Rego Unit Tests

Rego unit tests are defined in `policy/test/*.yaml`. These simulate inputs and expected denials.

To run locally:

```bash
conftest test --policy policy/ policy/test/
```

---

## 🔁 CI Workflows

### PR Policy Check
Defined in `.github/workflows/zscaler-policy-check.yml`, this runs:
- `terraform plan`
- `conftest` against the JSON output

### Policy Unit Tests
Defined in `.github/workflows/opa-policy-tests.yml`, this runs all test cases in `policy/test/`.

---

## ✅ Sentinel Integration (Terraform Cloud)

Sentinel policies are defined in `sentinel/`.

To enforce in Terraform Cloud:

1. Upload policies to a policy set
2. Assign the policy set to your workspace
3. Use `tfplan/v2` imports for plan evaluation

Policies include:
- `enforce_https.sentinel`
- `enforce_tags.sentinel`
- `block_all_protocols.sentinel`

---

## 🛠 Extendable Modules

You can extend this repo to support:
- DLP Rule Checks
- Posture Profile Enforcement
- SCIM Group Rule Validation

Let me know if you'd like support for GitLab, Jenkins, or TFC automated policy set deployment.

---

## 🔁 DevSecOps Pipeline Walkthrough

### Overview

This pipeline ensures that all Zscaler IaC changes are:
- Defined as code via Terraform
- Validated against policy guardrails using OPA (locally and in CI)
- Optionally enforced in Terraform Cloud using Sentinel

### 🧭 Flow Diagram (Mermaid)

```mermaid
graph TD
  A[Developer Creates Terraform Change] --> B[GitHub Pull Request]
  B --> C[Terraform Plan (CI)]
  C --> D[Run OPA Policy Checks via Conftest]
  D -->|Pass| E[Merge Allowed]
  D -->|Fail| F[Block Merge & Alert]
  E --> G[Terraform Apply]
  G --> H[Terraform Cloud Sentinel Policies (Optional)]
  H -->|Pass| I[Deploy Config to Zscaler]
  H -->|Fail| J[Rollback / Review]
```

---

## ✅ Sentinel Deployment in Terraform Cloud

To use Sentinel:

1. Go to **Terraform Cloud → Policy Sets**
2. Create a **new policy set** and connect to this GitHub repo or upload `.sentinel` files
3. Assign the policy set to your Zscaler workspace(s)
4. Confirm enforcement level (advisory, soft-mandatory, hard-mandatory)

---

## 🧪 Testing

### OPA Rego Tests

```bash
conftest test --policy policy/ policy/test/
```

### Full CI Validation on PR

Pushing to a branch with `.tf` changes triggers:
- `terraform plan`
- `conftest` policy check
- Results shown in GitHub Checks tab

---

