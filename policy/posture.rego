package zscaler.guardrails

deny[msg] {
  input.resource_type == "zpa_posture_profile"
  not input.resource.settings.os
  msg := "Posture profile must define OS criteria."
}
