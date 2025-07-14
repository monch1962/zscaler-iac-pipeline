package zscaler.guardrails

deny[msg] {
  input.resource_type == "zia_dlp_rule"
  input.resource.rule_type == "CUSTOM" 
  count(input.resource.patterns) == 0
  msg := "Custom DLP rules must include at least one pattern."
}
