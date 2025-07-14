resource "zpa_application_segment" "insecure_example" {
  name                  = "Test Segment"
  application_protocol  = "HTTP"
  domain_names          = ["*.example.com"]
  segment_group_id      = "1234567890"
  tcp_ports             = ["80"]
  tags = {
    environment = "dev"
  }
}
