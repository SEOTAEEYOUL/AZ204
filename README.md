# AZ 204

## 준비
> [Azure에서 클라우드 스토리지 관리](https://azure.microsoft.com/ko-kr/features/storage-explorer/#overview)  
> [git](https://1drv.ms/u/s!AmlADRmU8M8uk_h_GY-jXnm09_asPg?e=c0BjUn)  
> [HttpRepl](https://github.com/dotnet/HttpRepl)  

- .NET Core가 지원되는 모든 곳에서 지원되는 가벼운 플랫폼 간 명령줄 도구입니다.
- ASP.NET Core 웹 API를 테스트하고 결과를 보기 위한 HTTP 요청을 만드는 데 사용됩니다.

TechSkillsSupport@microsoft.com
Delivery ID : 33786
2021년 11월 15일~
AZ-204 Developing Solutions for Microsoft Azure
[one drive - 강의 자료](https://1drv.ms/u/s!AmlADRmU8M8uk_h_GY-jXnm09_asPg?e=c0BjUn)  
[AZ-204: Microsoft Azure 솔루션 개발 - GitHub](https://github.com/MicrosoftLearning/AZ-204KO-DevelopingSolutionsforMicrosoftAzure)  
[AZ-204 영문자료 - GitHub](https://github.com/MicrosoftLearning/AZ-204-DevelopingSolutionsforMicrosoftAzure.git)  
> skilpipe.com  
> learns  

https://teams.microsoft.com/l/meetup-join/19%3ameeting_NjE0MmMzMmQtOWRlZi00MjZiLTllYTYtMGRjMzQ3YzUwMGQy%40thread.v2/0?context=%7b%22Tid%22%3a%2272f988bf-86f1-41af-91ab-2d7cd011db47%22%2c%22Oid%22%3a%22c5825cfd-a05b-4288-8c3d-cec2cf365dd6%22%7d

https://dotnet.microsoft.com/download
https://dotnet.microsoft.com/download/dotnet/3.1
https://code.visualstudio.com/download#

dotnet --version
mkdir sample01
cd sample01
dotnet new
#dotnet new mvc
dotnet new mvc -f netcoreapp3.1 #3.1버전을 지정해서 생성
dotnet restore
dotnet build
code .   



## git

### …or create a new repository on the command line
```
echo "# AZ204" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/SEOTAEEYOUL/AZ204.git
git push -u origin main
```

### …or push an existing repository from the command line
```
git remote add origin https://github.com/SEOTAEEYOUL/AZ204.git
git branch -M main
git push -u origin main
```