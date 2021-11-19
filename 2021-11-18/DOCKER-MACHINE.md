# docker-machine

## 오류 로그
```
PS D:\workspace\AZ204\2021-11-18\mslearn-hotel-reservation-system> docker build -t reservationsystem .
[+] Building 0.6s (8/14)
 => [internal] load build definition from Dockerfile                                                                                                                             0.0s 
 => => transferring dockerfile: 655B                                                                                                                                             0.0s 
 => [internal] load .dockerignore                                                                                                                                                0.0s 
 => => transferring context: 2B                                                                                                                                                  0.0s 
 => [internal] load metadata for mcr.microsoft.com/dotnet/core/sdk:2.2                                                                                                           0.4s 
 => CANCELED [ 1/10] FROM mcr.microsoft.com/dotnet/core/sdk:2.2@sha256:42699bba2fe4545dd753694499e6db08478ba5b3bcc34b929e7e324d4c115449                                          0.1s 
 => => resolve mcr.microsoft.com/dotnet/core/sdk:2.2@sha256:42699bba2fe4545dd753694499e6db08478ba5b3bcc34b929e7e324d4c115449                                                     0.0s 
 => => sha256:42699bba2fe4545dd753694499e6db08478ba5b3bcc34b929e7e324d4c115449 2.19kB / 2.19kB                                                                                   0.0s 
 => => sha256:db9b38d066fdbdd5ac5ce862076c27e4ae17f2b57cbacd03bdc3b24e06696ae8 1.80kB / 1.80kB                                                                                   0.0s 
 => => sha256:2357b6790b9df0fb28364d113ff94eb67628cb1564aa86074d24c68b1597b62e 4.40kB / 4.40kB                                                                                   0.0s 
 => [internal] load build context                                                                                                                                                0.1s 
 => => transferring context: 93.31kB                                                                                                                                             0.0s 
 => CACHED [ 2/10] WORKDIR /src                                                                                                                                                  0.0s 
 => ERROR [ 3/10] COPY [HotelReservationSystem/HotelReservationSystem.csproj, HotelReservationSystem/]                                                                           0.0s 
 => ERROR [ 4/10] COPY [HotelReservationSystemTypes/HotelReservationSystemTypes.csproj, HotelReservationSystemTypes/]                                                            0.0s 
------
 > [ 3/10] COPY [HotelReservationSystem/HotelReservationSystem.csproj, HotelReservationSystem/]:
------
------
 > [ 4/10] COPY [HotelReservationSystemTypes/HotelReservationSystemTypes.csproj, HotelReservationSystemTypes/]:
------
failed to compute cache key: "/HotelReservationSystem/HotelReservationSystem.csproj" not found: not found
```

```
PS D:\workspace\AZ204\2021-11-18\mslearn-hotel-reservation-system\src> docker build -t reservationsystem .
[+] Building 30.0s (4/14)
 => [internal] load build definition from Dockerfile                                                                                                                             0.0s 
 => => transferring dockerfile: 655B                                                                                                                                             0.0s 
 => [internal] load .dockerignore                                                                                                                                                0.0s 
 => => transferring context: 2B                                                                                                                                                  0.0s 
 => [internal] load metadata for mcr.microsoft.com/dotnet/core/sdk:2.2                                                                                                           0.4s 
 => [internal] load build context                                                                                                                                                0.0s 
 => => transferring context: 16.09kB                                                                                                                                             0.0s 
 => [ 1/10] FROM mcr.microsoft.com/dotnet/core/sdk:2.2@sha256:42699bba2fe4545dd753694499e6db08478ba5b3bcc34b929e7e324d4c115449                                                  29.5s 
 => => resolve mcr.microsoft.com/dotnet/core/sdk:2.2@sha256:42699bba2fe4545dd753694499e6db08478ba5b3bcc34b929e7e324d4c115449                                                     0.0s 
 => => sha256:9935d0c62ace92b388be202275e222007d6cac10b9c1f2c1ea63af38c09ea7ab 10.80MB / 10.80MB                                                                                 3.6s 
 => => sha256:db0efb86e80601b5bbdbb7c406426982c4202d339687c14c3941b364527e2249 4.34MB / 4.34MB                                                                                   0.6s 
 => => sha256:db9b38d066fdbdd5ac5ce862076c27e4ae17f2b57cbacd03bdc3b24e06696ae8 1.80kB / 1.80kB                                                                                   0.0s 
 => => sha256:2357b6790b9df0fb28364d113ff94eb67628cb1564aa86074d24c68b1597b62e 4.40kB / 4.40kB                                                                                   0.0s 
 => => sha256:146bd6a886182fde06fbf747470b1c89814bc8ab1c96fdf1aef6107171959fe6 45.38MB / 45.38MB                                                                                11.3s 
 => => sha256:42699bba2fe4545dd753694499e6db08478ba5b3bcc34b929e7e324d4c115449 2.19kB / 2.19kB                                                                                   0.0s 
 => => sha256:e705a4c4fd310b96bfb3d7928428e65f0d3f5bad0cd0bda1434aee1d89418468 50.07MB / 50.07MB                                                                                14.6s 
 => => sha256:563ac9aa7c8039c3169f383c57e43c0d8281d01f6b6c59a4f5b0e9168a9a3427 13.25MB / 13.25MB                                                                                 7.5s 
 => => sha256:9db5b5c16f62413ee33c1b77d00b801b18b0a9bb8dd5151c35cad7a757d4e33f 113.25MB / 173.40MB                                                                              29.5s 
 => => sha256:ff05a093e8aa7f92b287883ed215c63b767074e67aa2a730ae82fd8ed6e1bd89 93.32MB / 301.07MB                                                                               29.5s 
 => => extracting sha256:146bd6a886182fde06fbf747470b1c89814bc8ab1c96fdf1aef6107171959fe6                                                                                        6.3s 
 => => extracting sha256:9935d0c62ace92b388be202275e222007d6cac10b9c1f2c1ea63af38c09ea7ab                                                                                        1.3s 
 => => extracting sha256:db0efb86e80601b5bbdbb7c406426982c4202d339687c14c3941b364527e2249                                                                                        0.6s 
 => => extracting sha256:e705a4c4fd310b96bfb3d7928428e65f0d3f5bad0cd0bda1434aee1d89418468  
 [+] Building 63.8s (4/14)
 => [ 1/10] FROM mcr.microsoft.com/dotnet/core/sdk:2.2@sha256:42699bba2fe4545dd753694499e6db08478ba5b3bcc34b929e7e324d4c115449                                                  63.4s 
 => => sha256:42699bba2fe4545dd753694499e6db08478ba5b3bcc34b929e7e324d4c115449 2.19kB / 2.19kB                                                                                   0.0s 
 => => sha256:e705a4c4fd310b96bfb3d7928428e65f0d3f5bad0cd0bda1434aee1d89418468 50.07MB / 50.07MB                                                                                14.6s 
 => => sha256:563ac9aa7c8039c3169f383c57e43c0d8281d01f6b6c59a4f5b0e9168a9a3427 13.25MB / 13.25MB                                                                                 7.5s 
 => => sha256:9db5b5c16f62413ee33c1b77d00b801b18b0a9bb8dd5151c35cad7a757d4e33f 173.40MB / 173.40MB                                                                              40.9s 
 => => sha256:ff05a093e8aa7f92b287883ed215c63b767074e67aa2a730ae82fd8ed6e1bd89 301.07MB / 301.07MB                                                                              61.0s 
 => => extracting sha256:146bd6a886182fde06fbf747470b1c89814bc8ab1c96fdf1aef6107171959fe6                                                                                        6.3s 
 => => extracting sha256:9935d0c62ace92b388be202275e222007d6cac10b9c1f2c1ea63af38c09ea7ab                                                                                        1.3s 
 => => extracting sha256:db0efb86e80601b5bbdbb7c406426982c4202d339687c14c3941b364527e2249                                                                                        0.6s 
 => => extracting sha256:e705a4c4fd310b96bfb3d7928428e65f0d3f5bad0cd0bda1434aee1d89418468                                                                                        8.5s 
 => => extracting sha256:563ac9aa7c8039c3169f383c57e43c0d8281d01f6b6c59a4f5b0e9168a9a3427                                                                                        1.6s 
 => => extracting sha256:9db5b5c16f62413ee33c1b77d00b801b18b0a9bb8dd5151c35cad7a757d4e33f                                                                                       12.7s 
[+] Building 85.0s (9/14)
 => [internal] load build definition from Dockerfile                                                                                                                             0.0s 
 => => transferring dockerfile: 655B                                                                                                                                             0.0s 
 => [internal] load .dockerignore                                                                                                                                                0.0s 
 => => transferring context: 2B                                                                                                                                                  0.0s 
 => [internal] load metadata for mcr.microsoft.com/dotnet/core/sdk:2.2                                                                                                           0.4s 
 => [internal] load build context                                                                                                                                                0.0s 
 => => transferring context: 16.09kB                                                                                                                                             0.0s 
 => [ 1/10] FROM mcr.microsoft.com/dotnet/core/sdk:2.2@sha256:42699bba2fe4545dd753694499e6db08478ba5b3bcc34b929e7e324d4c115449                                                  81.0s 
 => => resolve mcr.microsoft.com/dotnet/core/sdk:2.2@sha256:42699bba2fe4545dd753694499e6db08478ba5b3bcc34b929e7e324d4c115449                                                     0.0s 
 => => sha256:9935d0c62ace92b388be202275e222007d6cac10b9c1f2c1ea63af38c09ea7ab 10.80MB / 10.80MB                                                                                 3.6s 
 => => sha256:db0efb86e80601b5bbdbb7c406426982c4202d339687c14c3941b364527e2249 4.34MB / 4.34MB                                                                                   0.6s 
 => => sha256:db9b38d066fdbdd5ac5ce862076c27e4ae17f2b57cbacd03bdc3b24e06696ae8 1.80kB / 1.80kB                                                                                   0.0s 
 => => sha256:2357b6790b9df0fb28364d113ff94eb67628cb1564aa86074d24c68b1597b62e 4.40kB / 4.40kB                                                                                   0.0s 
 => => sha256:146bd6a886182fde06fbf747470b1c89814bc8ab1c96fdf1aef6107171959fe6 45.38MB / 45.38MB                                                                                11.3s 
 => => sha256:42699bba2fe4545dd753694499e6db08478ba5b3bcc34b929e7e324d4c115449 2.19kB / 2.19kB                                                                                   0.0s 
 => => sha256:e705a4c4fd310b96bfb3d7928428e65f0d3f5bad0cd0bda1434aee1d89418468 50.07MB / 50.07MB                                                                                14.6s 
 => => sha256:563ac9aa7c8039c3169f383c57e43c0d8281d01f6b6c59a4f5b0e9168a9a3427 13.25MB / 13.25MB                                                                                 7.5s 
 => => sha256:9db5b5c16f62413ee33c1b77d00b801b18b0a9bb8dd5151c35cad7a757d4e33f 173.40MB / 173.40MB                                                                              40.9s 
 => => sha256:ff05a093e8aa7f92b287883ed215c63b767074e67aa2a730ae82fd8ed6e1bd89 301.07MB / 301.07MB                                                                              61.0s 
 => => extracting sha256:146bd6a886182fde06fbf747470b1c89814bc8ab1c96fdf1aef6107171959fe6                                                                                        6.3s 
 => => extracting sha256:9935d0c62ace92b388be202275e222007d6cac10b9c1f2c1ea63af38c09ea7ab                                                                                        1.3s 
 => => extracting sha256:db0efb86e80601b5bbdbb7c406426982c4202d339687c14c3941b364527e2249                                                                                        0.6s 
 => => extracting sha256:e705a4c4fd310b96bfb3d7928428e65f0d3f5bad0cd0bda1434aee1d89418468                                                                                        8.5s 
 => => extracting sha256:563ac9aa7c8039c3169f383c57e43c0d8281d01f6b6c59a4f5b0e9168a9a3427                                                                                        1.6s 
 => => extracting sha256:9db5b5c16f62413ee33c1b77d00b801b18b0a9bb8dd5151c35cad7a757d4e33f                                                                                       12.7s 
 => => extracting sha256:ff05a093e8aa7f92b287883ed215c63b767074e67aa2a730ae82fd8ed6e1bd89                                                                                       19.4s 
 => [ 2/10] WORKDIR /src                                                                                                                                                         1.0s 
 => [ 3/10] COPY [HotelReservationSystem/HotelReservationSystem.csproj, HotelReservationSystem/]                                                                                 0.0s 
 => [ 4/10] COPY [HotelReservationSystemTypes/HotelReservationSystemTypes.csproj, HotelReservationSystemTypes/]                                                                  0.0s 
 => ERROR [ 5/10] RUN dotnet restore "HotelReservationSystem/HotelReservationSystem.csproj"                                                                                      2.4s 
------
 > [ 5/10] RUN dotnet restore "HotelReservationSystem/HotelReservationSystem.csproj":
#9 2.285 /usr/share/dotnet/sdk/2.2.207/NuGet.targets(119,5): error : Unable to load the service index for source https://api.nuget.org/v3/index.json. [/src/HotelReservationSystem/HotelReservationSystem.csproj]
#9 2.285 /usr/share/dotnet/sdk/2.2.207/NuGet.targets(119,5): error :   The SSL connection could not be established, see inner exception. [/src/HotelReservationSystem/HotelReservationSystem.csproj]
#9 2.285 /usr/share/dotnet/sdk/2.2.207/NuGet.targets(119,5): error :   The remote certificate is invalid according to the validation procedure. [/src/HotelReservationSystem/HotelReservationSystem.csproj]
------
executor failed running [/bin/sh -c dotnet restore "HotelReservationSystem/HotelReservationSystem.csproj"]: exit code: 1
PS D:\workspace\AZ204\2021-11-18\mslearn-hotel-reservation-system\src>       
```

## 정상 동작 로그
```
seo@Azure:~$ docker-machine create -d azure \
>     --azure-subscription-id $MYSUBID \
>     --azure-ssh-user taeyeol \
>     --azure-open-port 80 \
>     --azure-location $MYLO \
>     --azure-resource-group $MYID"rg" \
>     --azure-size "Standard_D2_v2" $MYID"vm"
Running pre-create checks...
(taeyeolvm) Microsoft Azure: To sign in, use a web browser to open the page https://microsoft.com/devicelogin and enter the codeHJJT8H3ZS to authenticate.
(taeyeolvm) Registering subscription to resource provider.  ns="Microsoft.Compute" subs="0aa01477-9ad1-4549-bacf-eac6035fa242"
(taeyeolvm) Registering subscription to resource provider.  ns="Microsoft.Network" subs="0aa01477-9ad1-4549-bacf-eac6035fa242"
(taeyeolvm) Completed machine pre-create checks.
Creating machine...
(taeyeolvm) Querying existing resource group.  name="taeyeolrg"
(taeyeolvm) Creating resource group.  name="taeyeolrg" location="eastus"
(taeyeolvm) Configuring availability set.  name="docker-machine"
(taeyeolvm) Configuring network security group.  name="taeyeolvm-firewall" location="eastus"
Error creating machine: Error in driver during machine creation: network.SecurityGroupsClient#CreateOrUpdate: Failure respondingto request: StatusCode=409 -- Original Error: autorest/azure: Service returned an error. Status=409 Code="SubscriptionNotRegistered" Message="Subscription 0aa01477-9ad1-4549-bacf-eac6035fa242 is not registered with NRP." Details=[]
The default lines below are for a sh/bash shell, you can specify the shell you're using, with the --shell flag.

seo@Azure:~$
seo@Azure:~$ docker-machine env $MYID"vm" --shell /?
Error checking TLS connection: compute.VirtualMachinesClient#Get: Failure responding to request: StatusCode=404 -- Original Error: autorest/azure: Service returned an error. Status=404 Code="ResourceNotFound" Message="The Resource 'Microsoft.Compute/virtualMachines/taeyeolvm' under resource group 'taeyeolrg' was not found. For more details please go to https://aka.ms/ARMResourceNotFoundFix"
seo@Azure:~$ eval $(docker-machine env $MYID"vm" --shell /?)
Error checking TLS connection: compute.VirtualMachinesClient#Get: Failure responding to request: StatusCode=404 -- Original Error: autorest/azure: Service returned an error. Status=404 Code="ResourceNotFound" Message="The Resource 'Microsoft.Compute/virtualMachines/taeyeolvm' under resource group 'taeyeolrg' was not found. For more details please go to https://aka.ms/ARMResourceNotFoundFix"
```

- 삭제
```
seo@Azure:~$ docker-machine rm taeyeolvm
About to remove taeyeolvm
WARNING: This action will delete both local reference and remote instance.
Are you sure? (y/n): y
(taeyeolvm) NOTICE: Please check Azure portal/CLI to make sure you have no leftover resources to avoid unexpected charges.
(taeyeolvm) Virtual Machine does not exist. Skipping.  name="taeyeolvm"
(taeyeolvm) Network Interface does not exist. Skipping.  name="taeyeolvm-nic"
(taeyeolvm) Public IP does not exist. Skipping.  name="taeyeolvm-ip"
(taeyeolvm) Network Security Group does not exist. Skipping.  name="taeyeolvm-firewall"
(taeyeolvm) Attempting to clean up Availability Set resource...  name="docker-machine"
(taeyeolvm) Attempting to clean up Subnet resource...  name="docker-machine"
(taeyeolvm) Attempting to clean up Virtual Network resource...  name="docker-machine-vnet"
Successfully removed taeyeolvm
seo@Azure:~$
```
- 재생성
```
seo@Azure:~$ docker-machine create -d azure \
>     --azure-subscription-id $MYSUBID \
>     --azure-ssh-user taeyeol \
>     --azure-open-port 80 \
>     --azure-location $MYLO \
>     --azure-resource-group $MYID"rg" \
>     --azure-size "Standard_D2_v2" $MYID"vm"
Running pre-create checks...
(taeyeolvm) Completed machine pre-create checks.
Creating machine...
(taeyeolvm) Querying existing resource group.  name="taeyeolrg"
(taeyeolvm) Resource group "taeyeolrg" already exists.
(taeyeolvm) Configuring availability set.  name="docker-machine"
(taeyeolvm) Configuring network security group.  name="taeyeolvm-firewall" location="eastus"
(taeyeolvm) Querying if virtual network already exists.  name="docker-machine-vnet" rg="taeyeolrg" location="eastus"
(taeyeolvm) Creating virtual network.  name="docker-machine-vnet" rg="taeyeolrg" location="eastus"
(taeyeolvm) Configuring subnet.  name="docker-machine" vnet="docker-machine-vnet" cidr="192.168.0.0/16"
(taeyeolvm) Creating public IP address.  name="taeyeolvm-ip" static=false
(taeyeolvm) Creating network interface.  name="taeyeolvm-nic"
(taeyeolvm) Creating storage account.  name="vhdssqlwyllyz204clhjphi7" location="eastus" sku=Standard_LRS
(taeyeolvm) Creating virtual machine.  name="taeyeolvm" location="eastus" size="Standard_D2_v2" username="taeyeol" osImage="canonical:UbuntuServer:16.04.0-LTS:latest"
Waiting for machine to be running, this may take a few minutes...
Detecting operating system of created instance...
Waiting for SSH to be available...
Detecting the provisioner...
Provisioning with ubuntu(systemd)...
Installing Docker...
Copying certs to the local machine directory...
Copying certs to the remote machine...
Setting Docker configuration on the remote daemon...
Checking connection to Docker...
Docker is up and running!
To see how to connect your Docker Client to the Docker Engine running on this virtual machine, run: docker-machine env taeyeolvm
seo@Azure:~$
```
- 생성 후 확인
```
seo@Azure:~$ docker-machine env $MYID"vm" --shell /?
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://52.152.218.116:2376"
export DOCKER_CERT_PATH="/home/seo/.docker/machine/machines/taeyeolvm"
export DOCKER_MACHINE_NAME="taeyeolvm"
# Run this command to configure your shell:
# eval $(docker-machine env taeyeolvm --shell /?)
seo@Azure:~$ eval $(docker-machine env $MYID"vm" --shell /?)
seo@Azure:~$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
seo@Azure:~$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
seo@Azure:~$
```
