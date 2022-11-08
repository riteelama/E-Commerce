using CatalogService.BusinessManager;
using CommonEnitity.Catalog;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace CatalogService.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CatalogController : ControllerBase
    {
        // GET: api/<CatalogController>
        [HttpPost]
        public IEnumerable<CatalogItem> GetCatalogItemList()
        {
            CatalogManager catalogManager = new CatalogManager();            
            return catalogManager.GetCatalogItemList();
        }

        [HttpPost]
        public CatalogItem GetCatalogItem(Guid CatalogItemID)
        {
            CatalogManager catalogManager = new CatalogManager();
            return catalogManager.GetCatalogItemByID(CatalogItemID);
        }

        // GET api/<CatalogController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<CatalogController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<CatalogController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<CatalogController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
