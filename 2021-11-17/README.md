# 2011-11-17(수, 3일자 교육)

[AzCopy 시작](https://docs.microsoft.com/ko-kr/azure/storage/common/storage-use-azcopy-v10)  

[Lab03.md](./Lab03.md)  

## Azure Cosmos DB
- 전역 분산 DataBase
- Region 추가 시 중단이 필요 없음
- 전역 복제
- 다양한 일관성 수준
  - Strong
  - Bounded-stateless
  - Session
  - Consistent prefix
  - Eventual
- 낮은 대기 시간
- 탄력적인 규모 확장

## dotnet package
- Blob : dotnet add package Azure.Storage.Blobs --version 12.0.0 
- SqlServer : dotnet add package Microsoft.EntityFrameworkCore.SqlServer --version 3.0.1
- Cosmos : dotnet add package Microsoft.Azure.Cosmos --version 3.4.1

- 낙관적 동시성 제어
  - HTTP eTag 사용(같은 eTag 이면 데이타가 같음)
  - HTTP 412 오류 발생

[Lab04.md](./Lab04.md)  

## VM
- Insight
- 가용성 집합
  - 중복성과 가용성을 제공하기 위해 Azure에서 애플리케이션이 빌드되는 방식을 이해할 수 있도록 하는 VM의 논리적 그룹
- 장애 도메인(Fault domain 0)
  - 공통 전원과 네트워크 스위치를 공유하는 가상 머신 그룹을 정의
- 업데이트 도메인
  - 동시에 다시 부팅할 수 있는 가상 머신 그룹과 기본 물리적 하드웨어
  - 애저의 유지보수로 업데이트 할 때 동시에 진행되는 리소스 그룹

- iisrestart

- VM Serial Console
  - Portal 에서만 접근 가능

## Azure Resource Manager Template
- 리소스
  - Azure 를 통해 사용랄 수 있는 관리 가능한 단일 항목
- 리소스 그룹
  - 관련 리소스를 보유한 그룹
- .
  - .
- 선언적 구문
  - 리소스를 수동으로 만드는 대신 템플릿을 사용하여 리소스를 설명하는 작업

[ARM 템플릿 및 Azure Portal을 사용하여 리소스 배포](https://docs.microsoft.com/ko-kr/azure/azure-resource-manager/templates/deploy-portal)  
[Azure Resource Manager QuickStart Templates](https://github.com/Azure/azure-quickstart-templates)  
- 템플릿 배포(사용자 지정 템플릿을 사용하여 배포)  
- Template deployment (deploy using custom templates)  