using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Hosting;

namespace app.Controllers
{
    [Route("api/[controller]")]
    public class ValuesController : Controller
    {
        IHostingEnvironment ENV {get; set;}
        public ValuesController(IHostingEnvironment hopefullyThisIsDI)
        {
           ENV = hopefullyThisIsDI;
        }

        
        [Route("/")]
        [Route("/api/values")]
        [HttpGet]
        public IEnumerable<string> Get()
        {

            var networks = System.Net.NetworkInformation.NetworkInterface.GetAllNetworkInterfaces().ToList().Select( nic => nic.GetIPStatistics()).Select( ip => Newtonsoft.Json.JsonConvert.SerializeObject(ip)).Aggregate( (p, n) => $"{p} {n}");
            
            return new string[] { 
                $"ApplicationName: {ENV.ApplicationName}", 
                $"ContentRootPath: {ENV.ContentRootPath}",
                $"EnvironmentName : {ENV.EnvironmentName}",
                $"WebRootPath : {ENV.WebRootPath}",
                $"Networks: {networks}"
                };
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
