# AZ 204

## 준비
> [git](https://1drv.ms/u/s!AmlADRmU8M8uk_h_GY-jXnm09_asPg?e=c0BjUn)  
> [HttpRepl](https://github.com/dotnet/HttpRepl)  

- .NET Core가 지원되는 모든 곳에서 지원되는 가벼운 플랫폼 간 명령줄 도구입니다.
- ASP.NET Core 웹 API를 테스트하고 결과를 보기 위한 HTTP 요청을 만드는 데 사용됩니다.

TechSkillsSupport@microsoft.com
Delivery ID : 33786
2021년 11월 15일~
AZ-204 Developing Solutions for Microsoft Azure

### 교육관련 자료
[one drive - 강의 자료](https://1drv.ms/u/s!AmlADRmU8M8uk_h_GY-jXnm09_asPg?e=c0BjUn)  
[AZ-204: Microsoft Azure 솔루션 개발 - GitHub](https://github.com/MicrosoftLearning/AZ-204KO-DevelopingSolutionsforMicrosoftAzure)  
[AZ-204 영문자료 - GitHub](https://github.com/MicrosoftLearning/AZ-204-DevelopingSolutionsforMicrosoftAzure.git)  
> [skilpipe.com](skilpipe.com)   
> [Microsoft Learning](https://github.com/MicrosoftLearning)  

### 강의실(teams)
https://teams.microsoft.com/l/meetup-join/19%3ameeting_NjE0MmMzMmQtOWRlZi00MjZiLTllYTYtMGRjMzQ3YzUwMGQy%40thread.v2/0?context=%7b%22Tid%22%3a%2272f988bf-86f1-41af-91ab-2d7cd011db47%22%2c%22Oid%22%3a%22c5825cfd-a05b-4288-8c3d-cec2cf365dd6%22%7d



## 기본 환경
> [Download .NET](https://dotnet.microsoft.com/download)  
> [Download .NET Core 3.1](https://dotnet.microsoft.com/download/dotnet/3.1)  
> [Download Visual Studio Code](https://code.visualstudio.com/download#)  

### 기본 dotnet 사용
- Windows 에서 Program 설치
  - dotnetcore 3.1
  - dotnet 4
  - SDK 6
- Cloud Shell 에는 기본 설치 되어 있음(Linux 에서도 사용 가능)
```
dotnet --version
mkdir sample01
cd sample01
dotnet new
#dotnet new mvc
dotnet new mvc -f netcoreapp3.1 #3.1버전을 지정해서 생성
dotnet restore
dotnet build
code .   
```
## Git
https://filezilla-project.org/download.php?show_all=1
https://git-scm.com/downloads

https://github.com/MicrosoftLearning/AZ-204KO-DevelopingSolutionsforMicrosoftAzure

git config --global user.name "John Doe"
git config --global user.email johndoe@example.com

https://docs.microsoft.com/ko-kr/learn/certifications/

https://esi.learnondemand.net/
교육키 : 794419154814457D

https://azure.microsoft.com/ko-kr/free/


## 강의 링크
[2021-11-15](./2021-11-15/README.md)  
[2021-11-16](./2021-11-16/README.md)  
[2021-11-17](./2021-11-17/README.md)  
[2021-11-18](./2021-11-18/README.md)  
[2021-11-19](./2021-11-19/README.md)  

### AZ204 - Github

#### …or create a new repository on the command line
```
echo "# AZ204" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/SEOTAEEYOUL/AZ204.git
git push -u origin main
```

#### …or push an existing repository from the command line
```
git remote add origin https://github.com/SEOTAEEYOUL/AZ204.git
git branch -M main
git push -u origin main
```