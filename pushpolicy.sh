#!/usr/bin/env bash
set -euo pipefail 
IFS=$'\n\t'

echo "Running the sentinel simulator tests"
sentinel test -verbose

echo "Encoding token-metadata.sentinel as base64"
POLICY=$(base64 token-metadata.sentinel)

echo "Writing token-metadata.sentinel policy to vault egp"
vault write sys/policies/egp/token-metadata policy="${POLICY}" paths="kv-v2/*" enforcement_level="hard-mandatory"

echo "Reading the policy as stored in vault"
vault read sys/policies/egp/token-metadata

echo "Writing good data to kv-v2 from good_example.json"
vault kv put kv-v2/example @token_metadata_good_example.json

echo "Writing bad data to kv-v2 from bad_example.json"
vault kv put kv-v2/example @token_metadata_bad_example.json