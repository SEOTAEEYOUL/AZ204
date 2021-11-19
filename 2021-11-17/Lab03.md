# Lab03
## 실습 1: Azure 리소스 만들기

### 스토리지 계정 : mediastortaeyeol 
- key : ip1wtRDamTXNhC27ImJwAzK1fekTbJeiRYfwnWFRMd1dkWSh3j20QNHE4/JRMw7pkWgmMAYLnF8O6oNS8gtiAg==  
- 연결 문자열 : DefaultEndpointsProtocol=https;AccountName=mediastortaeyeol;AccountKey=ip1wtRDamTXNhC27ImJwAzK1fekTbJeiRYfwnWFRMd1dkWSh3j20QNHE4/JRMw7pkWgmMAYLnF8O6oNS8gtiAg==;EndpointSuffix=core.windows.net  
- endpoint : https://mediastortaeyeol.blob.core.windows.net/

## 연습 2: 컨테이너에 BLOB 업로드
### 작업 2: 컨테이너 생성(테이터스토리지 > 컨테이너)
- 이름 : raster-graphics
- 공용 액세스 수준 : 프라이빗(익명 액세스 없음)

### 작업 2: 스토리지 계정 BLOB 업로드
- BlobManager라는 새 .NET 프로젝트 생성
```PowerShell
PS D:\workspace\AZ204\AZ-204KO-DevelopingSolutionsforMicrosoftAzure\Allfiles\Labs\03\Starter\BlobManager> dotnet new console --name BlobManager --output .

"콘솔 앱" 템플릿이 성공적으로 생성되었습니다.

생성 후 작업 처리 중...
D:\workspace\AZ204\AZ-204KO-DevelopingSolutionsforMicrosoftAzure\Allfiles\Labs\03\Starter\BlobManager\BlobManager.csproj에서 'dotnet restore' 실행 중 ...
  복원할 프로젝트를 확인하는 중...
  D:\workspace\AZ204\AZ-204KO-DevelopingSolutionsforMicrosoftAzure\Allfiles\Labs\03\Starter\BlobManager\BlobManager.csproj을(를) 239 ms 동안 복원했습니다.
복원에 성공했습니다.

PS D:\workspace\AZ204\AZ-204KO-DevelopingSolutionsforMicrosoftAzure\Allfiles\Labs\03\Starter\BlobManager> 
```

- NuGet에서 Azure.Storage.Blobs의 버전 12.0.0를 가져옴
```
PS D:\workspace\AZ204\AZ-204KO-DevelopingSolutionsforMicrosoftAzure\Allfiles\Labs\03\Starter\BlobManager> dotnet add package Azure.Storage.Blobs --version 12.0.0

  복원할 프로젝트를 확인하는 중...
  Writing C:\Users\Administrator\AppData\Local\Temp\tmpDEB.tmp
info : 'D:\workspace\AZ204\AZ-204KO-DevelopingSolutionsforMicrosoftAzure\Allfiles\Labs\03\Starter\BlobManager\BlobManager.csproj' 프로젝트에 'Azure.Storage.Blobs' 패키지에 대한 PackageReference를 추가하는 중입니다.
info : D:\workspace\AZ204\AZ-204KO-DevelopingSolutionsforMicrosoftAzure\Allfiles\Labs\03\Starter\BlobManager\BlobManager.csproj의 패키지를 복원하는 중...
info :   GET https://api.nuget.org/v3-flatcontainer/azure.storage.blobs/index.json
info :   OK https://api.nuget.org/v3-flatcontainer/azure.storage.blobs/index.json 731밀리초
info :   GET https://api.nuget.org/v3-flatcontainer/azure.storage.blobs/12.0.0/azure.storage.blobs.12.0.0.nupkg
info :   OK https://api.nuget.org/v3-flatcontainer/azure.storage.blobs/12.0.0/azure.storage.blobs.12.0.0.nupkg 36밀리초
info :   GET https://api.nuget.org/v3-flatcontainer/azure.storage.common/index.json
info :   GET https://api.nuget.org/v3-flatcontainer/azure.core/index.json
info :   OK https://api.nuget.org/v3-flatcontainer/azure.storage.common/index.json 4879밀리초
info :   GET https://api.nuget.org/v3-flatcontainer/azure.storage.common/12.0.0/azure.storage.common.12.0.0.nupkg
info :   OK https://api.nuget.org/v3-flatcontainer/azure.storage.common/12.0.0/azure.storage.common.12.0.0.nupkg 38밀리
초
info :   OK https://api.nuget.org/v3-flatcontainer/azure.core/index.json 5078밀리초
info :   GET https://api.nuget.org/v3-flatcontainer/azure.core/1.0.0/azure.core.1.0.0.nupkg
info :   OK https://api.nuget.org/v3-flatcontainer/azure.core/1.0.0/azure.core.1.0.0.nupkg 38밀리초
info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.bcl.asyncinterfaces/index.json
info :   GET https://api.nuget.org/v3-flatcontainer/system.diagnostics.diagnosticsource/index.json
info :   GET https://api.nuget.org/v3-flatcontainer/system.memory/index.json
info :   GET https://api.nuget.org/v3-flatcontainer/system.numerics.vectors/index.json
info :   GET https://api.nuget.org/v3-flatcontainer/system.threading.tasks.extensions/index.json
info :   OK https://api.nuget.org/v3-flatcontainer/system.diagnostics.diagnosticsource/index.json 211밀리초
info :   GET https://api.nuget.org/v3-flatcontainer/system.diagnostics.diagnosticsource/4.6.0/system.diagnostics.diagnosticsource.4.6.0.nupkg
info :   OK https://api.nuget.org/v3-flatcontainer/system.diagnostics.diagnosticsource/4.6.0/system.diagnostics.diagnosticsource.4.6.0.nupkg 38밀리초
info :   OK https://api.nuget.org/v3-flatcontainer/system.memory/index.json 813밀리초
info :   OK https://api.nuget.org/v3-flatcontainer/system.numerics.vectors/index.json 820밀리초
info :   GET https://api.nuget.org/v3-flatcontainer/system.memory/4.5.3/system.memory.4.5.3.nupkg
info :   GET https://api.nuget.org/v3-flatcontainer/system.numerics.vectors/4.5.0/system.numerics.vectors.4.5.0.nupkg   
info :   OK https://api.nuget.org/v3-flatcontainer/system.memory/4.5.3/system.memory.4.5.3.nupkg 38밀리초
info :   OK https://api.nuget.org/v3-flatcontainer/system.numerics.vectors/4.5.0/system.numerics.vectors.4.5.0.nupkg 39
밀리초
info :   OK https://api.nuget.org/v3-flatcontainer/system.threading.tasks.extensions/index.json 863밀리초
info :   GET https://api.nuget.org/v3-flatcontainer/system.threading.tasks.extensions/4.5.2/system.threading.tasks.extensions.4.5.2.nupkg
info :   OK https://api.nuget.org/v3-flatcontainer/system.threading.tasks.extensions/4.5.2/system.threading.tasks.extensions.4.5.2.nupkg 35밀리초
info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.bcl.asyncinterfaces/index.json 4956밀리초
info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.bcl.asyncinterfaces/1.0.0/microsoft.bcl.asyncinterfaces.1.0.0.nupkg
info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.bcl.asyncinterfaces/1.0.0/microsoft.bcl.asyncinterfaces.1.0.0.nupkg 36밀리초
info : 콘텐츠 해시 zh+W64u/WM+z6oz4NVQp6zHSGOA7ZzWp4OQ5XbZTLvjOJr173s3mXR4TltQY3C4fXfwZ/BkCHyXITd/skeRuuQ==을(를) 사용하
여 https://api.nuget.org/v3/index.json에서 Azure.Core 1.0.0을(를) 설치했습니다.
info : 콘텐츠 해시 oBUP9QKDT2Gsc+ZTQ+XChAXncqvuAHnv5lQtu5Eep/OJeipooWZ7lYbsFeidPc0JI8XVk3Ha5fXIcvRjRUIIoQ==을(를) 사용하
여 https://api.nuget.org/v3/index.json에서 Azure.Storage.Common 12.0.0을(를) 설치했습니다.
info : 콘텐츠 해시 AEwOzlxjuza/Qb3zzOQJjdY+0yHR4soY3WY9eih8hBqSQRtvACNUKlnFL2xL6TajcZEOfQl6xzyHE1vU7eUSoA==을(를) 사용하
여 https://api.nuget.org/v3/index.json에서 Azure.Storage.Blobs 12.0.0을(를) 설치했습니다.
info : 콘텐츠 해시 3oDzvc/zzetpTKWMShs1AADwZjQ/36HnsufHRPcOjyRAAMLDlu2iD33MBI2opxnezcVUtXyqDXXjoFMOU9c7SA==을(를) 사용하
여 https://api.nuget.org/v3/index.json에서 System.Memory 4.5.3을(를) 설치했습니다.
info : 콘텐츠 해시 K63Y4hORbBcKLWH5wnKgzyn7TOfYzevIEwIedQHBIkmkEBA9SCqgvom+XTuE+fAFGvINGkhFItaZ2dvMGdT5iw==을(를) 사용하
여 https://api.nuget.org/v3/index.json에서 Microsoft.Bcl.AsyncInterfaces 1.0.0을(를) 설치했습니다.
info : 콘텐츠 해시 mbBgoR0rRfl2uimsZ2avZY8g7Xnh1Mza0rJZLPcxqiMWlkGukjmRkuMJ/er+AhQuiRIh80CR/Hpeztr80seV5g==을(를) 사용하
여 https://api.nuget.org/v3/index.json에서 System.Diagnostics.DiagnosticSource 4.6.0을(를) 설치했습니다.
info : 콘텐츠 해시 BG/TNxDFv0svAzx8OiMXDlsHfGw623BZ8tCXw4YLhDFDvDhNUEV58jKYMGRnkbJNm7c3JNNJDiN7JBMzxRBR2w==을(를) 사용하
여 https://api.nuget.org/v3/index.json에서 System.Threading.Tasks.Extensions 4.5.2을(를) 설치했습니다.
info : 콘텐츠 해시 QQTlPTl06J/iiDbJCiepZ4H//BVraReU4O4EoRw1U02H5TLUIT7xn3GnDp9AXPSlJUDyFs4uWjWafNX6WrAojQ==을(를) 사용하
여 https://api.nuget.org/v3/index.json에서 System.Numerics.Vectors 4.5.0을(를) 설치했습니다.
info : 'Azure.Storage.Blobs' 패키지는 'D:\workspace\AZ204\AZ-204KO-DevelopingSolutionsforMicrosoftAzure\Allfiles\Labs\03\Starter\BlobManager\BlobManager.csproj' 프로젝트에 지정된 모든 프레임워크와 호환됩니다.
info : 'Azure.Storage.Blobs' 패키지 '12.0.0' 버전에 대한 PackageReference가 'D:\workspace\AZ204\AZ-204KO-DevelopingSolutionsforMicrosoftAzure\Allfiles\Labs\03\Starter\BlobManager\BlobManager.csproj' 파일에 추가되었습니다.
info : 복원을 커밋하는 중...
info : 자산 파일을 디스크에 쓰는 중입니다. 경로: D:\workspace\AZ204\AZ-204KO-DevelopingSolutionsforMicrosoftAzure\Allfiles\Labs\03\Starter\BlobManager\obj\project.assets.json
log  : D:\workspace\AZ204\AZ-204KO-DevelopingSolutionsforMicrosoftAzure\Allfiles\Labs\03\Starter\BlobManager\BlobManager.csproj을(를) 13.16 sec 동안 복원했습니다.
PS D:\workspace\AZ204\AZ-204KO-DevelopingSolutionsforMicrosoftAzure\Allfiles\Labs\03\Starter\BlobManager> 
```
- .NET 웹 애플리케이션을 빌드
```
PS D:\workspace\AZ204\AZ-204KO-DevelopingSolutionsforMicrosoftAzure\Allfiles\Labs\03\Starter\BlobManager> dotnet build

.NET용 Microsoft (R) Build Engine 버전 17.0.0+c9eb9dd64
Copyright (C) Microsoft Corporation. All rights reserved.

  복원할 프로젝트를 확인하는 중...
  복원할 모든 프로젝트가 최신 상태입니다.
  BlobManager -> D:\workspace\AZ204\AZ-204KO-DevelopingSolutionsforMicrosoftAzure\Allfiles\Labs\03\Starter\BlobManager\bin\Debug\net6.0\BlobManager.dll

빌드했습니다.
    경고 0개
    오류 0개

경과 시간: 00:00:06.39
PS D:\workspace\AZ204\AZ-204KO-DevelopingSolutionsforMicrosoftAzure\Allfiles\Labs\03\Starter\BlobManager> 
```
- 실행(donet run)  
```
PS D:\workspace\AZ204\AZ-204KO-DevelopingSolutionsforMicrosoftAzure\Allfiles\Labs\03\Starter\BlobManager> dotnet run  

Connected to Azure Storage Account
Account name:   mediastortaeyeol
Account kind:   StorageV2
Account sku:    StandardLrs
Container:      raster-graphics
Searching:      raster-graphics
Existing Blob:  graph.jpg
New Container:  vector-graphics
Blob Found:     graph.svg
Blob Url:       https://mediastortaeyeol.blob.core.windows.net/vector-graphics/graph.svg
PS D:\workspace\AZ204\AZ-204KO-DevelopingSolutionsforMicrosoftAzure\Allfiles\Labs\03\Starter\BlobManager> 
```