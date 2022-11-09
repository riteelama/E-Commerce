using CommonEnitity.Catalog;
using Microsoft.AspNetCore.Http.HttpResults;
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

    public async Task CatalogItemAddAsync(CatalogItem objCatalogItem)
    {
        List<SQLParam> sParam = new List<SQLParam>
        {
            new SQLParam("@Id", objCatalogItem.Id),
            new SQLParam("@Id", objCatalogItem.Name),
            new SQLParam("@Id", objCatalogItem.AvailableStock),
            new SQLParam("@Id", objCatalogItem.CatalogTypeId),
            new SQLParam("@Id", objCatalogItem.AvailableStock),
            new SQLParam("@Id", objCatalogItem.CatalogBrandId),
            new SQLParam("@Id", objCatalogItem.Description),
            new SQLParam("@Id", objCatalogItem.MaxStockThreshold),
            new SQLParam("@Id", objCatalogItem.OnReorder),
            new SQLParam("@Id", objCatalogItem.PictureFileName),
            new SQLParam("@Id", objCatalogItem.PictureUri),
            new SQLParam("@Id", objCatalogItem.Price),
            new SQLParam("@Id", objCatalogItem.RestockThreshold)           
        };
        SQLExecuteNonQueryAsync objSQLH = new SQLExecuteNonQueryAsync();
        string spName = objSQLH.GetFullSpName("uspCatalogItemAdd");
        try
        {
            await objSQLH.ExecuteNonQueryAsync(spName, sParam);
        }
        catch
        {
            throw;
        }
    }
}

