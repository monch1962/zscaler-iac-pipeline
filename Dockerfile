FROM alpine:3.19

LABEL maintainer="you@example.com"
LABEL description="Zscaler IaC DevSecOps container with OPA, Terraform, Gatekeeper support"

RUN apk add --no-cache curl bash git unzip terraform

# Install OPA
ENV OPA_VERSION=0.63.0
RUN curl -L -o /usr/local/bin/opa https://openpolicyagent.org/downloads/v${OPA_VERSION}/opa_linux_amd64_static && \
    chmod +x /usr/local/bin/opa

# Work directories
RUN mkdir -p /iac/terraform /iac/policy /iac/sentinel /iac/test /iac/gatekeeper
WORKDIR /iac

# Copy entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Volumes for dynamic usage
VOLUME ["/iac/terraform", "/iac/policy", "/iac/sentinel", "/iac/test", "/iac/gatekeeper"]

ENTRYPOINT ["/entrypoint.sh"]
