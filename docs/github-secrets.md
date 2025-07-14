# 🔐 GitHub Secrets Setup for ntfy Notifications

To enable ntfy-based CI notifications in GitHub Actions, set the following repository secrets:

| Secret Name     | Description                                | Example Value           |
|-----------------|--------------------------------------------|-------------------------|
| `NTFY_URL`      | Base URL of your ntfy server               | `https://ntfy.sh`       |
| `NTFY_TOPIC`    | Topic to post messages to                  | `zscaler-devsecops`     |

---

## 📌 How to Add GitHub Secrets

1. Go to your repository on GitHub
2. Click **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Add the secrets listed above

---

## 🧪 Local Testing with `.env`

For local development or testing, you can use a `.env` file in the root of your repo:

```bash
export $(cat .env | xargs)
```

Then test a notification:

```bash
curl -H "Title: Local Test" \
     -H "Tags: test" \
     -d "This is a test notification" \
     "$NTFY_URL/$NTFY_TOPIC"
```
