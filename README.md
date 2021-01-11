
# Construct a sentinel policy that validates the contents of a structured data payload written to a vault kv-v2 secrets store
 Build out multiple tests that pass structured data data to the sentinel simulator for validation against the EGP vault policy. The sentinel policy should be directly usable in vault without modification.

Cli example of writing the structured data payload that should be validated by sentinel policy.

`vault kv put kv-v2/example @token_metadata_good_example.json`

The sentinel policy itself is in `token-metadata.sentinel`

Sentinel simulator test for good data is `test/token-metadata/good_owner.json`

The script `pushpolicy.sh` steps through the whole process. 


# notes
https://discuss.hashicorp.com/t/validating-a-user-provided-date-with-sentinel/3619/10

