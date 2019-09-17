
# Construct a sentinel policy that validated the contents of a json payload written to a kv-v2 secrets store
 Build out multiple tests that pass json data to the sentinel simulator for validation against the EGP vault policy. The sentinel policy should be directly usable in vault without modification.

example.json from this repo is the test payload and would be written to vault like this. 

Cli example of writing the json payload that should be validated by sentinel policy.
`vault kv put kv-v2/example @example.json`

Curl example of writing the json payload that should be validated by sentinel policy.
`curl -X PUT -H "X-Vault-Token: $(vault print token)" -d '{"data":{"AccountID":"adobeitcfunkyservice223","AccountKEY":"a340b6a946bbdw4515r884dy12b8a484b518","Contact":"username@adobe.com","Expiration":"2020-08-16 09:52:05","Owner":"Blake Garner","TeamName":"Internal Cloud","cred_description":"Funky Service from external vendor"},"options":{}}' https://testvault.in.adobe.com:8200/v1/kv-v2/data/example`

Sentinel code examples
https://github.com/hashicorp/vault-guides/tree/master/governance/sentinel

