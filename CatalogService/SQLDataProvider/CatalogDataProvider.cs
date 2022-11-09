using CommonEnitity.Catalog;
using SQLHelper;

namespace CatalogService.SQLDataProvider;

public class CatalogDataProvider: ICatalogDataProvider
{
    public async Task<IEnumerable<CatalogItem>> GetCatalogItemListAsyc()
    {
        SQLGetListAsync objSQLH = new SQLGetListAsync();
        string spName = objSQLH.GetFullSpName("uspGetCatalogItemList");
        try
        {
            IEnumerable<CatalogItem> objCataLogList =
                await objSQLH.ExecuteAsListAsync<CatalogItem>(spName);
            return objCataLogList;
        }
        catch 
        {
            throw;
        }
    }

    public async Task<CatalogItem> GetCatalogItemByIDAsync(Guid itemID)
    {
        List<SQLParam> sParam = new List<SQLParam>
        {
            new SQLParam("@ItemID", itemID)
        };
        SQLGetAsync objSQLH = new SQLGetAsync();
        string spName = objSQLH.GetFullSpName("uspGetCatalogItemByID");
        try
        {
            return await objSQLH.ExecuteAsObjectAsync<CatalogItem>(spName, sParam);
        }
        catch
        {
            throw;
        }
    }
}

