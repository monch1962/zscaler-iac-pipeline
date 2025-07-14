package zscaler.guardrails

deny[msg] {
  input.resource_type == "zia_url_filtering_rule"
  input.resource.action == "ALLOW"
  contains(input.resource.urls[_], "*.facebook.com")
  msg := "Allowing Facebook is not permitted."
}

deny[msg] {
  input.resource_type == "zia_firewall_rule"
  input.resource.protocol == "ALL"
  msg := "Firewall rule must not allow ALL protocols."
}
