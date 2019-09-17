*Goal*
Construct a sentinel policy that validated the contents of a json payload written to a kv-v2 secrets store. Additionally build out multiple tests that pass json data to the sentinel simulator for validation against the EGP vault policy. The sentinel policy should be directly usable in vault without modification.

example.json is the test payload and would be written to vault like this. 

vault kv put -output-curl-string kv-v2/example @example.json

curl -X PUT -H "X-Vault-Token: $(vault print token)" -d '{"data":{"AccountID":"adobeitcfunkyservice223","AccountKEY":"a340b6a946bbdw4515r884dy12b8a484b518","Contact":"username@adobe.com","Expiration":"2020-08-16 09:52:05","Owner":"Blake Garner","TeamName":"Internal Cloud","cred_description":"Funky Service from external vendor"},"options":{}}' https://testvault.in.adobe.com:8200/v1/kv-v2/data/example

Sentinel Examples
https://github.com/hashicorp/vault-guides/tree/master/governance/sentinel

