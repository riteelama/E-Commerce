using CatalogService.SQLDataProvider;
using CommonEnitity.Catalog;

namespace CatalogService.BusinessManager;

public class CatalogManager: ICatalogManager
{
    public async Task<IEnumerable<CatalogItem>> GetCatalogItemListAsyc()
    {
        ICatalogDataProvider objcatalogDataProvider = CatalogFactory.Create();
        return await objcatalogDataProvider.GetCatalogItemListAsyc();
    }

    public async Task<CatalogItem> GetCatalogItemByIDAsync(Guid itemID)
    {
        ICatalogDataProvider objcatalogDataProvider = CatalogFactory.Create();
        return await objcatalogDataProvider.GetCatalogItemByIDAsync(itemID);
    }
}

