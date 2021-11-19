# ARC.md

### 실행 결과
```
PS D:\workspace\AZ204\2021-11-18\mslearn-hotel-reservation-system\src> az acr create --resource-group taeyeolrg --name taeyeolacr --sku Basic
{
  "adminUserEnabled": false,
  "anonymousPullEnabled": false,
  "creationDate": "2021-11-18T01:59:55.483328+00:00",
  "dataEndpointEnabled": false,
  "dataEndpointHostNames": [],
  "encryption": {
    "keyVaultProperties": null,
    "status": "disabled"
  },
  "id": "/subscriptions/0aa01477-9ad1-4549-bacf-eac6035fa242/resourceGroups/taeyeolrg/providers/Microsoft.ContainerRegistry/registries/taeyeolacr",
  "identity": null,
  "location": "eastus",
  "loginServer": "taeyeolacr.azurecr.io",
  "name": "taeyeolacr",
  "networkRuleBypassOptions": "AzureServices",
  "networkRuleSet": null,
  "policies": {
    "quarantinePolicy": {
      "status": "disabled"
    },
    "retentionPolicy": {
      "days": 7,
      "lastUpdatedTime": "2021-11-18T01:59:57.832597+00:00",
      "status": "disabled"
    },
    "trustPolicy": {
      "status": "disabled",
      "type": "Notary"
    }
  },
  "privateEndpointConnections": [],
  "provisioningState": "Succeeded",
  "publicNetworkAccess": "Enabled",
  "resourceGroup": "taeyeolrg",
  "sku": {
    "name": "Basic",
    "tier": "Basic"
  },
  "status": null,
  "systemData": {
    "createdAt": "2021-11-18T01:59:55.483328+00:00",
    "createdBy": "taeeyoul77@gmail.com",
    "createdByType": "User",
    "lastModifiedAt": "2021-11-18T01:59:55.483328+00:00",
    "lastModifiedBy": "taeeyoul77@gmail.com",
    "lastModifiedByType": "User"
  },
  "tags": {},
  "type": "Microsoft.ContainerRegistry/registries",
  "zoneRedundancy": "Disabled"
}
```
```
PS D:\workspace\AZ204\2021-11-18\mslearn-hotel-reservation-system\src> az acr update --name taeyeolacr --admin-enabled true
{
  "adminUserEnabled": true,
  "anonymousPullEnabled": false,
  "creationDate": "2021-11-18T01:59:55.483328+00:00",
  "dataEndpointEnabled": false,
  "dataEndpointHostNames": [],
  "encryption": {
    "keyVaultProperties": null,
    "status": "disabled"
  },
  "id": "/subscriptions/0aa01477-9ad1-4549-bacf-eac6035fa242/resourceGroups/taeyeolrg/providers/Microsoft.ContainerRegistry/registries/taeyeolacr",
  "identity": null,
  "location": "eastus",
  "loginServer": "taeyeolacr.azurecr.io",
  "name": "taeyeolacr",
  "networkRuleBypassOptions": "AzureServices",
  "networkRuleSet": null,
  "policies": {
    "quarantinePolicy": {
      "status": "disabled"
    },
    "retentionPolicy": {
      "days": 7,
      "lastUpdatedTime": "2021-11-18T01:59:57.832597+00:00",
      "status": "disabled"
    },
    "trustPolicy": {
      "status": "disabled",
      "type": "Notary"
    }
  },
  "privateEndpointConnections": [],
  "provisioningState": "Succeeded",
  "publicNetworkAccess": "Enabled",
  "resourceGroup": "taeyeolrg",
  "sku": {
    "name": "Basic",
    "tier": "Basic"
  },
  "status": null,
  "systemData": {
    "createdAt": "2021-11-18T01:59:55.483328+00:00",
    "createdBy": "taeeyoul77@gmail.com",
    "createdByType": "User",
    "lastModifiedAt": "2021-11-18T02:00:42.872722+00:00",
    "lastModifiedBy": "taeeyoul77@gmail.com",
    "lastModifiedByType": "User"
  },
  "tags": {},
  "type": "Microsoft.ContainerRegistry/registries",
  "zoneRedundancy": "Disabled"
}
PS D:\workspace\AZ204\2021-11-18\mslearn-hotel-reservation-system\src> az acr credential show --name taeyeolacr --query "passwords[0].value"
"9cao8cnVn2qA65u+e2YVj9AxrMUNuvZX"
```
```
PS D:\workspace\AZ204\2021-11-18\mslearn-hotel-reservation-system\src> az acr credential show --name taeyeolacr
{
  "passwords": [
    {
      "name": "password",
      "value": "9cao8cnVn2qA65u+e2YVj9AxrMUNuvZX"
    },
    {
      "name": "password2",
      "value": "WigSwUU5R+5aHsHQXlVE3dErErBxTEnO"
    }
  ],
  "username": "taeyeolacr"
}
PS D:\workspace\AZ204\2021-11-18\mslearn-hotel-reservation-system\src> 
```
- login
```
PS D:\workspace\AZ204\2021-11-18\mslearn-hotel-reservation-system\src> docker login taeyeolacr.azurecr.io
Username: taeyeolacr
Password: 
Login Succeeded
PS D:\workspace\AZ204\2021-11-18\mslearn-hotel-reservation-system\src> 
```
- 이미지 가져와서 넣기
```
PS D:\workspace\AZ204\2021-11-18\mslearn-hotel-reservation-system\src> docker pull mcr.microsoft.com/azuredocs/aci-helloworld
Using default tag: latest
latest: Pulling from azuredocs/aci-helloworld
6d987f6f4279: Pull complete
a1b9769c94cd: Pull complete
ea13ff2dbf08: Pull complete
3be0618266da: Pull complete
9e232827e52f: Pull complete
b53c152f538f: Pull complete
Digest: sha256:565dba8ce20ca1a311c2d9485089d7ddc935dd50140510050345a1b0ea4ffa6e
Status: Downloaded newer image for mcr.microsoft.com/azuredocs/aci-helloworld:latest
mcr.microsoft.com/azuredocs/aci-helloworld:latest
PS D:\workspace\AZ204\2021-11-18\mslearn-hotel-reservation-system\src> docker tag mcr.microsoft.com/azuredocs/aci-helloworld taeyeolacr.azurecr.io/hello-world:v1
PS D:\workspace\AZ204\2021-11-18\mslearn-hotel-reservation-system\src> docker push taeyeolacr.azurecr.io/hello-world:v1
The push refers to repository [taeyeolacr.azurecr.io/hello-world]
31ba1ebd9cf5: Pushed
cd07853fe8be: Pushed
73f25249687f: Pushed
d8fbd47558a8: Pushed
44ab46125c35: Pushed
5bef08742407: Pushed
v1: digest: sha256:565dba8ce20ca1a311c2d9485089d7ddc935dd50140510050345a1b0ea4ffa6e size: 1576
PS D:\workspace\AZ204\2021-11-18\mslearn-hotel-reservation-system\src> 
```