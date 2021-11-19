# 2021-11-18

## Az login
```
seo@Azure:~$ az login
Cloud Shell is automatically authenticated under the initial account signed-in with. Run 'az login' only if you need to use a different account
To sign in, use a web browser to open the page https://microsoft.com/devicelogin and enter the code F7N926FET to authenticate.
cA Cloud Shell credential problem occurred. When you report the issue with the error below, please mention the hostname 'cc-7347b6b-f5c65b68b-vp6rv'
The following tenants require Multi-Factor Authentication (MFA). Use 'az login --tenant TENANT_ID' to explicitly login to a tenant.
488c43cb-891e-4986-8b6b-40c2e5c7b87f '기본 디렉터리'
[
  {
    "cloudName": "AzureCloud",
    "homeTenantId": "856fc847-123d-4e69-ab53-bd4d3d42fea9",
    "id": "0aa01477-9ad1-4549-bacf-eac6035fa242",
    "isDefault": true,
    "managedByTenants": [],
    "name": "Azure Pass - 스폰서쉽",
    "state": "Enabled",
    "tenantId": "856fc847-123d-4e69-ab53-bd4d3d42fea9",
    "user": {
      "name": "taeeyoul77@gmail.com",
      "type": "user"
    }
  }
]
seo@Azure:~$
seo@Azure:~$ az group create -n taeyeolrg --location eastus
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
seo@Azure:~$
```

## Docker
### docker-machine 만들기  
- 로컬 호스트용인 VirtualBox를 비롯하여 AWS 같은 클라우드 환경에 Docker의 실행 환경을 명령으로 자동 생성하기 위한 툴
즉, 하나의 호스트 머신이 아닌 여러대의 호스트 머신에서 Docker의 실행 환경을 명령으로 자동 생성하기 위한 툴 이다.
이러한 Docker Machine을 자세히 살펴보게 되면 다음과 같은 기능이 존재한다.

1. Docker Engine을 사용자 앞의 기계가 아닌 클라우드 컴퓨팅 VM을 비롯한 원격지의 서버에 설치
2. 명령 하나로 아직 존재하지 않는 기계를 새로 만들어서 Engine까지 한방에 설치
3. 원격지에 위치한 다수의 Docker Node를 손쉽게 규정하고 관리

```bash
#!/bin/bash
MYSUBID=$(az account show --query "id" -o tsv)
echo $MYSUBID

MYID="taeyeol"
MYLO="eastus"

docker-machine create -d azure \
    --azure-subscription-id $MYSUBID \
    --azure-ssh-user taeyeol \
    --azure-open-port 80 \
    --azure-location $MYLO \
    --azure-resource-group $MYID"rg" \
    --azure-size "Standard_D2_v2" $MYID"vm"

docker-machine env $MYID"vm" --shell /?
eval $(docker-machine env $MYID"vm" --shell /?)

docker ps
docker images
```

### 실행 결과

### Azure VM 설치된 docker 환경을 체크합니다.
docker-machine env "hahaysh12vm" --shell /?
eval $(docker-machine env $MYID"vm" --shell /?)
docker-machine ip "hahaysh12vm" 

### 샘플 이미지
docker pull mcr.microsoft.com/dotnet/core/samples:aspnetapp
### 80 포트에 앱 맵핑
docker run -d -p 80:80 mcr.microsoft.com/dotnet/core/samples:aspnetapp
### 배포된 앱을 브라우저에서 확인합니다.
20.36.166.114

### nginx 앱 샘플을 하나더 배포. 8080 포트에 맵핑
docker run -d -p 8082:80 --restart=always nginx
### 배포된 앱을 브라우저에서 확인합니다.
- http://20.36.166.114:8080/

- docker rm 78e43271ecdf -f
- docker rmi






### 먼저 웹앱 샘플 소스 가지고 오기
git clone https://github.com/MicrosoftDocs/mslearn-hotel-reservation-system.git
```
PS D:\workspace\AZ204\2021-11-18> git clone https://github.com/MicrosoftDocs/mslearn-hotel-reservation-system.git
Cloning into 'mslearn-hotel-reservation-system'...
remote: Enumerating objects: 33, done.
remote: Total 33 (delta 0), reused 0 (delta 0), pack-reused 33
Receiving objects: 100% (33/33), 16.96 KiB | 964.00 KiB/s, done.
Resolving deltas: 100% (5/5), done.
PS D:\workspace\AZ204\2021-11-18>
```
### 폴더로 이동
cd mslearn-hotel-reservation-system/src
### (확장자가 없는) Dockerfile을 만든다.
echo "" > Dockerfile
### visual studio code 실행
code .
### dokerfile을 편집후 저장
### 이미지를 빌드하고 로컬에 저장. 마지막에 쩜을 꼭 찍습니다.
docker build -t reservationsystem .
### 이미지 확인
- docker images
- docker ps
### 웹앱을 테스트
docker run -p 8081:80 -d --name reservations reservationsystem
# 브라우저에 접속 테스트 해봅니다. 예약번호1에 대한 데이터가 포함된 JSON문서가 반환되는 걸 확인합니다.
http://localhost:8081/api/reservations/1
# 컨테이너의 상태를 검사합니다.
docker ps -a

---
```Dockerfile
#1 
FROM mcr.microsoft.com/dotnet/core/sdk:2.2
WORKDIR /src
COPY ["HotelReservationSystem/HotelReservationSystem.csproj", "HotelReservationSystem/"]
COPY ["HotelReservationSystemTypes/HotelReservationSystemTypes.csproj", "HotelReservationSystemTypes/"]
RUN dotnet restore "HotelReservationSystem/HotelReservationSystem.csproj"

#2
COPY . .
WORKDIR "/src/HotelReservationSystem"
RUN dotnet build "HotelReservationSystem.csproj" -c Release -o /app

#3
RUN dotnet publish "HotelReservationSystem.csproj" -c Release -o /app

#4
EXPOSE 80
WORKDIR /app
ENTRYPOINT ["dotnet", "HotelReservationSystem.dll"]
```


## ACR
- docker registry 2.0 기준
- private docker container image 저장 및 관리
- Azure App Service, Azure Batch, Azure Container Instance, Azure Kubernetes Service 에 긴밀하게 통합
- 레지스트리 - 컨테이너 이미지를 저장하는 서비스
- 리포지토리 - 관련 컨테이너 이미지 그룹

| SKU | 설명 |  
|:---|:---|  
| 기본 | 학습하는 개발자에게 적합 </BR> 크기 및 사용량 제약 | 
| 표준| 대부분의 프로덕션 시나리오의 요구 사항을 충족 </BR> 스토리지 제한 침 이미지 처리량 증가 |  
| 프리미엄 | 대용량 시나리오를 지원 (향상된 스토리지 기능을 포함한 스토리지 및 동시 작업 등 </BR> 여러 지역에서 단일 레지스트리를 관리하기 위해 지리적 복제와 같은 기능 추가 | 

### Container Registry 에 이미지 배포
- 자격 증명이 필요
- az acr credential show --name taeyeolacr

```
# docker 환경을 체크합니다.
docker-machine env "taeyeolvm" --shell /?
eval $(docker-machine env "taeyeolvm" --shell /?)

# 리소스만들기
az group create --name taeyeolrg --location eastus
az acr create --resource-group taeyeolrg --name taeyeolacr --sku Basic

# 로그인
az acr update --name taeyeolacr --admin-enabled true
az acr credential show --name taeyeolacr --query "passwords[0].value"
docker login taeyeol.azurecr.io 

# 이미지 가지고 pull/tag/push
docker pull mcr.microsoft.com/azuredocs/aci-helloworld
docker tag mcr.microsoft.com/azuredocs/aci-helloworld taeyeolacr.azurecr.io/hello-world:v1
docker push taeyeolacr.azurecr.io/hello-world:v1

# 확인
az acr repository list --name hahaysh13acr --output table
az acr repository show-tags --name hahaysh13acr --repository hello-world --output table
az acr repository show -n hahaysh13acr -t hello-world:v1

# 로컬에서 실행
docker run -p 8080:80 -d --name hello-world hahaysh13acr.azurecr.io/hello-world:v1
```

> 실행결과[./ACR.md]

## ACR Sample - Hello World
```
# CloudShell에 로그인
# Bash 셸로 변경

# github에 들어가서 아래 repository를 포크합니다.
https://github.com/Azure-Samples/acr-build-helloworld-node 
git clone https://github.com/hahaysh/acr-build-helloworld-node
cd acr-build-helloworld-node

# 전역 선언
MYID=taeyeol
RES_GROUP=$MYID"rg"
ACR_NAME=$MYID"acr"

# 리소스그룹이랑 ACR을 만듭니다.
# az group create --resource-group $RES_GROUP --location eastus
# az acr create --resource-group $RES_GROUP --name $ACR_NAME --sku Standard --location eastus
az acr build --registry $ACR_NAME --image helloacrtasks:v1 .

# 확인
az acr repository list --name $ACR_NAME --output table
az acr repository show-tags --name $ACR_NAME --repository helloacrtasks --output table
az acr repository show -n $ACR_NAME -t helloacrtasks:v1
```

> [ACR Sample : helloworld 실행 결과](./ACR-helloworld.md)

## Lab05 - ACI
```
az group create -n ContainerCompute --location eastus
az vm create --resource-group ContainerCompute --name quickvm --image Debian --admin-username student --admin-password StudentPa55w.rd
az vm show --resource-group ContainerCompute --name quickvm
az vm list-ip-addresses --resource-group ContainerCompute --name quickvm
az vm list-ip-addresses --resource-group ContainerCompute --name quickvm --query '[].{ip:virtualMachine.network.publicIpAddresses[0].ipAddress}' --output tsv
ipAddress=$(az vm list-ip-addresses --resource-group ContainerCompute --name quickvm --query '[].{ip:virtualMachine.network.publicIpAddresses[0].ipAddress}' --output tsv)
echo $ipAddress
ssh student@$ipAddress
```
```
cd ~/clouddrive
mkdir ipcheck
cd ~/clouddrive/ipcheck
dotnet new console --output . --name ipcheck
touch Dockerfile
code .
```
```
az acr list
az acr list --query "max_by([], &creationDate).name" --output tsv
seo@Azure:~/clouddrive/ipcheck$ acrName=$(az acr list --query "max_by([], &creationDate).name" --output tsv)
echo $acrName
```

```
cd ~/clouddrive/ipcheck
dir
az acr build --registry $acrName --image ipcheck:latest .
```

```
az group delete --name ContainerCompute --no-wait --yes
```

## Auth
```
dotnet new console -f netcoreapp3.1

dotnet add package Microsoft.Identity.Client

================================
using System;
using System.Threading.Tasks;
using Microsoft.Identity.Client;

namespace DemoAuth
{
    class Program
    {
        private const string _clientId = "APPLICATION_CLIENT_ID";
        private const string _tenantId = "DIRECTORY_TENANT_ID";
        public static async Task Main(string[] args)

        {
            var app = PublicClientApplicationBuilder
                .Create(_clientId)  //클라이언트ID만들기
                .WithAuthority(AzureCloudInstance.AzurePublic, _tenantId) //클라우드지정
                .WithRedirectUri("http://localhost")
                .Build();

            string[] scopes = { "user.read" };


            AuthenticationResult result = await app.AcquireTokenInteractive(scopes).ExecuteAsync();
            Console.WriteLine($"Token:\t{result.AccessToken}");

            Console.WriteLine("Hello World!");
        }
    }
}
================================


https://developer.microsoft.com/en-us/graph/graph-explorer

dotnet add package Microsoft.Graph
dotnet add package Microsoft.Graph.Auth --version 1.0.0-preview.5  
```

## [Graph](./graph.md)

### SAS(공유 액세스 서명)
> [SAS(공유 액세스 서명)를 사용하여 Azure Storage 리소스에 대한 제한된 액세스 권한 부여](https://docs.microsoft.com/ko-kr/azure/storage/common/storage-sas-overview)
- 스토리지 계정의 리소스에 대한 안전한 위임된 권한을 제공
- 리소스 : sr=b
- 저장된 액세스 정책

## Azure Key Vault
- 클라우드 앱 및 서비스에서 사용하는 암호화 키 및 기타 비밀 보호

### 인증
- 관리 ID : 
- 서비스 주체 : 어렵고 권장하지 않음

### Azure CLI 를 사용하여 Key Valut 비밀 만들기
```
# 변수를 먼저 설정합니다.
$myResourceGroup="taeyeolrg"
$myKeyVault="taeyeolkv"
$myLocation="eastus"


# 리소스 그룹을 만듭니다.
az group create --name $myResourceGroup --location $myLocation

# Key vault를 만듭니다.
az keyvault create --name $myKeyVault --resource-group $myResourceGroup --location $myLocation

# Secret추가하고 검색합니다.
# Secret을 만들고 앱에서 사용할 수 있는 암호를 추가해봅니다.
az keyvault secret set --vault-name $myKeyVault --name "ExamplePass" --value "P@ssw0rd1234"

# 생성된 secret을 검색해봅니다.
az keyvault secret show --name "ExamplePass" --vault-name $myKeyVault
```

```
dotnet new console -f netcoreapp3.1

dotnet add package Microsoft.Azure.KeyVault
dotnet add package Microsoft.IdentityModel.Clients.ActiveDirectory


===================
using System;
using System.Threading.Tasks;
using Microsoft.Azure.KeyVault; // dotnet add package Microsoft.Azure.KeyVault
using Microsoft.IdentityModel.Clients.ActiveDirectory; // dotnet add package Microsoft.IdentityModel.Clients.ActiveDirectory


namespace DemoKeyVault
{
    class Program
    {

        const string CLIENTSECRET = "ZERG";
        const string CLIENTID = "ZERG";
        const string secretUri = "https://hahaysh01kv.vault.azure.net/secrets/ExamplePass";

        public static async Task Main(string[] args)

        {

            // # Key Vault 클라이언트 만들기
            var client = new KeyVaultClient(new KeyVaultClient.AuthenticationCallback(GetToken));
            // 비밀 얻기
            var secretBundle = await client.GetSecretAsync(secretUri);
            // 비밀의 값 얻기
            var secret = secretBundle.Value;
            Console.WriteLine("Hello World!");
            Console.WriteLine(secret.ToString());

        }

        //# 등록한 앱을 통해서 Key를 접근하기위한 Token생성하기
        public static async Task<string> GetToken(string authority, string resource, string scope)
        {
            var authContext = new AuthenticationContext(authority);
            ClientCredential clientCred = new ClientCredential(CLIENTID, CLIENTSECRET);
            AuthenticationResult result = await authContext.AcquireTokenAsync(resource, clientCred);
            if (result == null)
                throw new InvalidOperationException("Failed to obtain the JWT token");
            return result.AccessToken;
        }

    }
}

===================

az identity create --resource-group hahaysh19rg --name hahaysh19id

resourceID=$(az identity show --resource-group hahaysh19rg --name hahaysh19id --query id --output tsv)

az webapp identity assign -g hahaysh19rg -n hahaysh19webapp --identities [system] $resourceID

```

## Azure App Configuration


