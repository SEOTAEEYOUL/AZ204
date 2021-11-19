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