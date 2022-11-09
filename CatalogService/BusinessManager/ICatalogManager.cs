using CommonEnitity.Catalog;

namespace CatalogService.BusinessManager;

public interface ICatalogManager
{
    Task<IEnumerable<CatalogItem>> GetCatalogItemListAsyc();
    Task<CatalogItem> GetCatalogItemByIDAsync(Guid itemID);
}

