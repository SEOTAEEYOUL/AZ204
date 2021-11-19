# KeyValut.md

## 변수를 먼저 설정합니다.
```
PS D:\workspace\AZ204> $myResourceGroup="taeyeolrg"
PS D:\workspace\AZ204> $myKeyVault="taeyeolkv"
PS D:\workspace\AZ204> $myLocation="eastus"
```
## # 리소스 그룹을 만듭니다.
```
PS D:\workspace\AZ204> az group create --name $myResourceGroup --location $myLocation
{
  "id": "/subscriptions/0aa01477-9ad1-4549-bacf-eac6035fa242/resourceGroups/taeyeolrg",
  "location": "eastus",
  "managedBy": null,
  "name": "taeyeolrg",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null,
  "type": "Microsoft.Resources/resourceGroups"
}
```

## # Key vault를 만듭니다.
```
PS D:\workspace\AZ204> az keyvault create --name $myKeyVault --resource-group $myResourceGroup --location $myLocation
Resource provider 'Microsoft.KeyVault' used by this operation is not registered. We are registering for you.
Registration succeeded.
{
  "id": "/subscriptions/0aa01477-9ad1-4549-bacf-eac6035fa242/resourceGroups/taeyeolrg/providers/Microsoft.KeyVault/vaults/taeyeolkv",
  "location": "eastus",
  "name": "taeyeolkv",
  "properties": {
    "accessPolicies": [
      {
        "applicationId": null,
        "objectId": "e7f44c8d-447b-499b-b994-ea8a4db42ed8",
        "permissions": {
          "certificates": [
            "get",
            "list",
            "delete",
            "create",
            "import",
            "update",
            "managecontacts",
            "getissuers",
            "listissuers",
            "setissuers",
            "deleteissuers",
            "manageissuers",
            "recover"
          ],
          "keys": [
            "get",
            "create",
            "delete",
            "list",
            "update",
            "import",
            "backup",
            "restore",
            "recover"
          ],
          "secrets": [
            "get",
            "list",
            "set",
            "delete",
            "backup",
            "restore",
            "recover"
          ],
          "storage": [
            "get",
            "list",
            "delete",
            "set",
            "update",
            "regeneratekey",
            "setsas",
            "listsas",
            "getsas",
            "deletesas"
          ]
        },
        "tenantId": "856fc847-123d-4e69-ab53-bd4d3d42fea9"
      }
    ],
    "createMode": null,
    "enablePurgeProtection": null,
    "enableRbacAuthorization": null,
    "enableSoftDelete": true,
    "enabledForDeployment": false,
    "enabledForDiskEncryption": null,
    "enabledForTemplateDeployment": null,
    "networkAcls": null,
    "privateEndpointConnections": null,
    "provisioningState": "Succeeded",
    "sku": {
      "family": "A",
      "name": "standard"
    },
    "softDeleteRetentionInDays": 90,
    "tenantId": "856fc847-123d-4e69-ab53-bd4d3d42fea9",
    "vaultUri": "https://taeyeolkv.vault.azure.net/"
  },
  "resourceGroup": "taeyeolrg",
  "systemData": {
    "createdAt": "2021-11-18T07:11:09.936000+00:00",
    "createdBy": "taeeyoul77@gmail.com",
    "createdByType": "User",
    "lastModifiedAt": "2021-11-18T07:11:09.936000+00:00",
    "lastModifiedBy": "taeeyoul77@gmail.com",
    "lastModifiedByType": "User"
  },
  "tags": {},
  "type": "Microsoft.KeyVault/vaults"
}
```

## Secret추가하고 검색합니다.
### Secret을 만들고 앱에서 사용할 수 있는 암호를 추가해봅니다.
```
PS D:\workspace\AZ204> az keyvault secret set --vault-name $myKeyVault --name "ExamplePass" --value "P@ssw0rd1234"
Error occurred in request., SSLError: HTTPSConnectionPool(host='taeyeolkv.vault.azure.net', port=443): Max retries exceeded with url: /secrets/ExamplePass?api-version=7.0 (Cause
d by SSLError(SSLCertVerificationError(1, '[SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: self signed certificate in certificate chain (_ssl.c:1125)')))
```

### 생성된 secret을 검색해봅니다
```
PS D:\workspace\AZ204> az keyvault secret show --name "ExamplePass" --vault-name $myKeyVault
Error occurred in request., SSLError: HTTPSConnectionPool(host='taeyeolkv.vault.azure.net', port=443): Max retries exceeded with url: /secrets/ExamplePass/?api-version=7.0 (Caus
ed by SSLError(SSLCertVerificationError(1, '[SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: self signed certificate in certificate chain (_ssl.c:1125)')))
PS D:\workspace\AZ204> 
```

### 삭제
```
PS D:\workspace\AZ204> az keyvault delete --name $myKeyVault --resource-group $myResourceGroup
Warning! If you have soft-delete protection enabled on this key vault, you will not be able to reuse this key vault name until the key vault has been purged from the soft delete
d state. Please see the following documentation for additional guidance.
https://docs.microsoft.com/en-us/azure/key-vault/general/soft-delete-overview
```