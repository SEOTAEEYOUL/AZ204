using System;
using StackExchange.Redis;
using System.Threading.Tasks;

namespace DemoRedis
{
    class Program
    {
        static async Task Main(string[] args)
        {

            string connectionString = "taeyeol7redis.redis.cache.windows.net:6380,password=H6R2JqOnYptRVpZEuDoow2HBsJLoJPZRAAzCaIGlArU=,ssl=True,abortConnect=False";
            using (var cache = ConnectionMultiplexer.Connect(connectionString))
            {
                IDatabase db = cache.GetDatabase();
                bool setValue = await db.StringSetAsync("test:key", "100");
                Console.WriteLine($"SET: {setValue}");

                string getValue = await db.StringGetAsync("test:key");
                Console.WriteLine($"GET: {getValue}");

                var result = await db.ExecuteAsync("ping");
                Console.WriteLine($"PING = {result.Type} : {result}");

                result = await db.ExecuteAsync("flushdb");
                Console.WriteLine($"FLUSHDB = {result.Type} : {result}");

            }

            Console.WriteLine("Hello World!");
        }
    }
}