#!/bin/bash
echo "🏁 Starting Zscaler DevSecOps container..."
echo "🔎 Running OPA tests..."

# Run policy tests
if [ -d "/iac/policy" ] && [ -d "/iac/test" ]; then
  echo "🔍 Testing Rego policies..."
  opa test /iac/policy /iac/test
fi

# Run Gatekeeper policy validation
if [ -d "/iac/gatekeeper" ]; then
  echo "🔐 Validating Gatekeeper YAML constraints..."
  for file in /iac/gatekeeper/*.yaml; do
    if [ -f "$file" ]; then
      echo "✅ Checking $file"
      opa eval --format pretty --data /iac/gatekeeper --input "$file" "data"
    fi
  done
fi

echo "✅ Finished. Use 'terraform' or 'opa' commands as needed in interactive mode."
exec /bin/bash
