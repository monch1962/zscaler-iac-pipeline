resource "zia_url_filtering_rule" "social_media" {
  name   = "Allow Facebook"
  urls   = ["*.facebook.com"]
  action = "ALLOW"
  rank   = 1
}

resource "zia_firewall_rule" "insecure_fw" {
  name     = "Open Firewall"
  protocol = "ALL"
}
