output "router_id" {
  value       = google_compute_router.main.id
  description = "Router ID"
}

output "router_gateway_ip" {
  value       = google_compute_router.main.gateway_ipv4
  description = "Router gateway IPv4"
}

output "vlan_attachment_id" {
  value       = google_compute_interconnect_attachment.on_prem.id
  description = "VLAN ID"
}

output "vlan_attachment_key" {
  value       = google_compute_interconnect_attachment.on_prem.pairing_key
  description = "VLAN Pairing key"
}

output "vlan_attachment_asn" {
  value       = google_compute_interconnect_attachment.on_prem.partner_asn
  description = "Local BGP Autonomous System Number (ASN). Must be an RFC6996 private ASN, either 16-bit or 32-bit. The value will be fixed for this router resource. All VPN tunnels that link to this router will have the same local ASN."
}

