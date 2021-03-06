using System;
using System.Threading.Tasks;
using Microsoft.Azure.Cosmos;


namespace DemoCosmos
{
    class Program
    {
        // Azure Cosmos DB 엔드포인트
        private static readonly string EndpointUri = "https://hahaysh09cosmos.documents.azure.com:443/";
        // Azure Cosmos account primary key
        private static readonly string PrimaryKey = "ZERGZERG";
        private CosmosClient cosmosClient;
        private Database database;
        private Container container;
        // 데이타 베이스와 컨테이너 만들 이름 선언
        private string databaseId = "broodwar";
        private string containerId = "zerg";

        public static async Task Main(string[] args)

        {

            Console.WriteLine("Beginning operations...\n");
            Program p = new Program();
            await p.CosmosDemoAsync();

        }
        public async Task CosmosDemoAsync()
        {
            // Create a new instance of the Cosmos Client
            this.cosmosClient = new CosmosClient(EndpointUri, PrimaryKey);
            // Runs the CreateDatabaseAsync method
            await this.CreateDatabaseAsync();

            await this.CreateContainerAsync();
        }

        private async Task CreateDatabaseAsync()
        {
            // Create a new database
            this.database = await this.cosmosClient.CreateDatabaseIfNotExistsAsync(databaseId);
            Console.WriteLine("Created Database: {0}\n", this.database.Id);
        }


        private async Task CreateContainerAsync()
        {
            // Create a new container
            this.container = await this.database.CreateContainerIfNotExistsAsync(containerId, "/LastName");
            Console.WriteLine("Created Container: {0}\n", this.container.Id);
        }

    }
}