using CommonEnitity.Catalog;

namespace CatalogService.SQLDataProvider;

public interface ICatalogDataProvider
{
    Task<IEnumerable<CatalogItem>> GetCatalogItemListAsyc();
    Task<CatalogItem> GetCatalogItemByIDAsync(Guid itemID);
}

