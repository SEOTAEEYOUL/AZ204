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
