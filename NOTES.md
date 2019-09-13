Examples
https://github.com/hashicorp/vault-guides/tree/master/governance/sentinel

construct curl command to write this payload to vault kv-v2 then construct the headers and use those as payload basis


vault enable kv-v2

vault kv put -output-curl-string kv-v2/example @example.json

curl -X PUT -H "X-Vault-Token: $(vault print token)" -d '{"data":{"AccountID":"adobeitcfunkyservice223","AccountKEY":"a340b6a946bbdw4515r884dy12b8a484b518","Contact":"username@adobe.com","Expiration":"2020-08-16 09:52:05","Owner":"Blake Garner","TeamName":"IT Cloud","cred_description":"Funky Service from external vendor"},"options":{}}' https://testvault.in.adobe.com:8200/v1/kv-v2/data/example