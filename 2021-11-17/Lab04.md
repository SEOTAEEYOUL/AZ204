# Lab4

## cosmo db
### 설정 > 키
- 기본 연결 문자열 : AccountEndpoint=https://polycosmostaeyeol.documents.azure.com:443/;AccountKey=7aKYB9SB4li7nPesaf81k6tU8YPNshRmBAuK6P7SNLwm9vQ6aJO0srTPW7TyYJEVuQBG1lRWjCjNQeEk5G339A==;

```
{
"id": "1",
"category": "personal",
"name": "groceries",
"description": "Pick up apples and strawberries.",
"isComplete": false
}


{
"id": "2",
"category": "personal2",
"name": "groceries",
"email": "hahaysh@hotmail.com",
"description": "Pick up apples and strawberries.",
"isComplete": false
}


dotnet new console -f netcoreapp3.1
dotnet add package Microsoft.Azure.Cosmos

using System.Threading.Tasks; 
using Microsoft.Azure.Cosmos;
```

### Storage Account
- image Container 
  - URL : https://polystortaeyeol.blob.core.windows.net/image

### AdventureWorks(polysqlsrvrtaeyeol/AdventureWorks) | 설정 > 연결 문자열
- 연결 문자열 : Server=tcp:polysqlsrvrtaeyeol.database.windows.net,1433;Initial Catalog=AdventureWorks;Persist Security Info=False;User ID=polysqlsrvr;Password={TestPa55w.rd};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;

- id : testuser
- pw : TestPa55w.rd
