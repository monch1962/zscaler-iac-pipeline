package zscaler.guardrails

deny[msg] {
  input.resource_type == "zpa_application_segment"
  input.resource.application_protocol == "HTTP"
  msg := "Application Segment must not use HTTP."
}

deny[msg] {
  input.resource_type == "zpa_application_segment"
  startswith(input.resource.domain_names[_], "*.")
  msg := "Wildcard domains are not allowed."
}

deny[msg] {
  input.resource_type == "zpa_application_segment"
  not input.resource.tags.owner
  msg := "Missing 'owner' tag."
}
