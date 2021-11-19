Install-Module -Name Az -AllowClobber
Get-Module -ListAvailable -Name Az*
Connect-AzAccount

Get-AzSubscription
Select-AzSubscription -SubscriptionId f889a2a0-5c37-4fc8-b19c-5b6368a4fe03

Get-AzVM

# Create VM by PowerShell
$myID = "hahaysh10"
$myLocation = "eastus"
$myVMSize = "Standard_DS2_v2"

New-AzVM `
    -ResourceGroupName $myID"rg" `
    -Name $myID"vm2" `
    -Location $myLocation `
    -Size $myVMSize `
    -VirtualNetworkName $myID"vnet" `
    -SubnetName $myID"sbn" `
    -SecurityGroupName $myID"nsg" `
    -PublicIpAddressName $myID"pubip2" `
    -OpenPorts 80, 3389 `
    -AsJob


# Create VM by Azure CLI
$myID = "hahaysh10"
$myLocation = "eastus"
$myVMSize = "Standard_DS2_v2"

# 리소스 그룹 만들기
az group create --name $myID"rg” --location $myLocation

# 가상컴퓨터 만들기
az vm create --resource-group $myID"rg” --name $myID"vm3" --image "win2016datacenter" --size $myVMSize --admin-username "hahaysh" --admin-password "P@ssw0rd1234"

# 웹서버를 위한 80포트 개방
az vm open-port --port 3389 --resource-group $myID"rg" --name $myID"vm“







az vm image list --all --location eastus --publisher MicrosoftWindowsServer --offer WindowsServer --sku 2019-Datacenter -o table

# 미국 동부 지역에서 사용할 수 있는 모든 게시자 목록 가져오기
az vm image list-publishers --location eastus -o table

# MicrosoftWindowsServer 게시자의 모든 제품 목록 얻기
az vm image list-offers --location eastus --publisher MicrosoftWindowsServer

# WindowsServer 제품의 SKU 목록 받기
az vm image list-skus --location eastus --publisher MicrosoftWindowsServer --offer WindowsServer -o table

# 2019-Datacenter SKU에 사용할 수 있는 모든 이미지의 목록 얻기
az vm image list --all --location eastus --publisher MicrosoftWindowsServer --offer WindowsServer --sku 2019-Datacenter -o table

# VM 이미지의 2019.0.20190603 버전 가져오기
az vm image show --location eastus --publisher MicrosoftWindowsServer --offer WindowsServer --sku 2019-Datacenter --version 2019.0.20190717

# 또는 URN을 사용하여 VM 이미지의 지정된 버전 가져오기
az vm image show --location eastus --urn MicrosoftWindowsServer:windowsserver-gen2preview:2019-datacenter-gen2:2019.0.20190717





# 미국 동부 지역에서 사용할 수 있는 모든 게시자 목록 가져오기
Get-AzVMImagePublisher -Location eastus

# MicrosoftWindowsServer 게시자의 모든 제품 목록 가져오기
Get-AzVMImageOffer -Location eastus -PublisherName MicrosoftWindowsServer

# WindowsServer 제품의 SKU 목록 가져오기
Get-AzVMImageSku -Location eastus -PublisherName MicrosoftWindowsServer -Offer WindowsServer

# 2019-Datacenter SKU에 사용할 수 있는 모든 이미지의 목록 가져오기  -->최종 VMImage로 Portal Marketplace에서 검색 할수 있다.
Get-AzVMImage -Location eastus -PublisherName MicrosoftWindowsServer -Offer WindowsServer -Sku 2019-Datacenter

# VM 이미지의 2019.0.20190410 버전 가져오기
Get-AzVMImage -Location eastus -PublisherName MicrosoftWindowsServer -Offer WindowsServer -Sku 2019-Datacenter -Version 2019.0.20190410




# --all옵션을 사용하지 않고 list 명령을 실행하면 Azure MarketPlace에서 인기 있는 VM이미지 목록이 나옵니다.
az vm image list --output table

# 특정 이미지를 찾아봅니다. Cannonical 게시자가 올린 eastus에 유효한 이미지 확인합니다. --all 옵션은 시간이 많이 걸립니다. --all 옵션이 없으면 공용 이미지의 로컬 캐시만 검색합니다.
az vm image list --location eastus --offer WindowsServer --publisher MicrosoftWindowsServer --output table

# 참한 이미지 하나를 선별하고 URN을 이용해서 VM을 만들어 봅니다.
az group create -n hahaysh12rg -l eastus2
az vm create -n hahaysh12vm -g hahaysh12rg --admin-username hahaysh --image MicrosoftWindowsServer:WindowsServer:2019-Datacenter:latest







# SAC 콘솔에 접속합니다. 도움말 실행
help
# cmd를 입력해서 CMD인스턴스가 있는 채널을 만듭니다.
cmd
ch -si 1

# 로그인
username:hahaysh
domain: <empty>
password : P@ssw0rd

dir

# 열린포트 확인
netstat -an

# 파워셀 시작
powershell
Get-command
Get-command *system*
systeminfo

# IIS 설치 – 설치후 접속확인
Install-WindowsFeature -name Web-Server –IncludeManagementTools

# 확인차 다른곳에 갔다가 와도 serial console창은 그대로 유지된다.
iisreset /stop
iisreset /start


Template deployment (deploy using custom templates)