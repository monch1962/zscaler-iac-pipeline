package zscaler.guardrails

deny[msg] {
  input.resource_type == "zia_scim_group_rule"
  not input.resource.name
  msg := "SCIM group rule must include a name."
}
