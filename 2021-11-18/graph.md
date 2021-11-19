# [Graph](https://docs.microsoft.com/ko-kr/graph/overview)
> [Overview of Microsoft Graph](https://docs.microsoft.com/ko-kr/graph/overview)  
> [그래프 탐색기](https://developer.microsoft.com/en-us/graph/graph-explorer)
> [Microsoft Graph API](https://docs.microsoft.com/ko-kr/azure/active-directory/develop/microsoft-graph-intro)  

-  Microsoft 클라우드 서비스 리소스에 액세스할 수 있도록 하는 RESTful 웹 API
-  앱을 등록하고 사용자 또는 서비스에 대한 인증 토큰을 가져온 후 Microsoft Graph API에 대한 요청을 수행할 수 있습니다.


dotnet new console -f netcoreapp3.1

dotnet add package Microsoft.Identity.Client
dotnet add package Microsoft.Graph
dotnet add package Microsoft.Graph.Auth --version 1.0.0-preview.5  

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

            // AuthenticationResult result = await app.AcquireTokenInteractive(scopes).ExecuteAsync();
            // Console.WriteLine($"Token:\t{result.AccessToken}");

            var provider = new InteractiveAuthenticationProvider(app, scopes);
            var client = new GraphServiceClient(provider);

            User me = await client.Me.Request().GetAsync();
            Console.WriteLine($"Display Name:\t{me.DisplayName}");

            Console.WriteLine("Hello World!");
        }
    }
}
================================