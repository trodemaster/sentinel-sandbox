log_level = "error"
log_format = "json"
ui = true
cluster_name = "nextbook"

listener "tcp" {
  address       = "127.0.0.1:8200"
  tls_disable = 1
  #tls_cert_file = "/etc/vault.d/orac.jibb.tv.pem"
  #tls_key_file  = "/etc/vault.d/orac.jibb.tv.key"
  tls_disable_client_certs = "true"
}

storage "raft" {
  path = "/Users/bgarner/code/sentinel-sandbox/vaultdata"
  node_id = "nextbook"
}

cluster_addr = "http://127.0.0.1:8201"
api_addr = "http://127.0.0.1:8200"
