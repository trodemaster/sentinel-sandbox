#!/usr/bin/env bash
set -euo pipefail 
IFS=$'\n\t'

#echo "Running the sentinel simulator tests"
#sentinel test -verbose

echo "Encoding allowlist_auth_methods.sentinel as base64"
POLICY=$(base64 allowlist_auth_methods.sentinel)

echo "Writing allowlist_auth_methods.sentinel policy to vault egp"
vault write sys/policies/egp/allowlist_auth_methods policy="${POLICY}" paths="auth/*" enforcement_level="soft-mandatory"


exit 0

echo "Writing token-metadata.sentinel policy to vault egp"
vault write sys/policies/egp/token-metadata policy="${POLICY}" paths="kv-v2/*" enforcement_level="hard-mandatory"

echo "Reading the policy as stored in vault"
vault read sys/policies/egp/token-metadata

echo "Writing good data to kv-v2 from good_example.json"
vault kv put kv-v2/example @token_metadata_good_example.json

echo "Writing bad data to kv-v2 from bad_example.json"
vault kv put kv-v2/example @token_metadata_bad_example.json