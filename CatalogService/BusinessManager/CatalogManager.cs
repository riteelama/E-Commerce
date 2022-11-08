using CommonEnitity.Catalog;

namespace CatalogService.BusinessManager;

public class CatalogManager
{
    public IEnumerable<CatalogItem> GetCatalogItemList()
    {
        List<CatalogItem> objList = new List<CatalogItem>();
        //We will call SQLData Provider to get the data from MS SQL DB
        return objList;
    }

    public CatalogItem GetCatalogItemByID(Guid itemID)
    {
        CatalogItem objItem = new CatalogItem();

        return objItem;
    }
}

