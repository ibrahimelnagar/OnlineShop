using System.Collections.Generic;
using System.Threading.Tasks;
using OnlineShop.Core.Database;

namespace OnlineShop.Core.Interfaces
{
    public interface IDatabaseHelper
    {
        #region Genres

        Task<List<Genre>> GetGenresAsync();
        List<Genre> GetGenres();
        Genre GetGenreWithAlbums(string genreName);

        #endregion

        #region Albums

        Task<Album> GetAlbumAsync(int id);
        Task<List<Album>> GetAlbumsWithArtistAndGenreAsync();
        Task CreateAlbum(Album album);
        Task UpdateAlbumAsync(Album album);
        Task RemoveAlbumAsync(Album album);
        Task<string> GetAlbumNameAsync(int id);
        Task<List<Album>> GetTopSellingAlbumsAsync(int count);

        #endregion

        #region Artists

        Task<List<Artist>> GetArtistsAsync();

        #endregion

        #region Cart

        Task AddToCartAsync(Album album, string shoppingCartId);
        Task<int> RemoveFromCartAsync(int id, string shoppingCartId);
        Task EmptyCartAsync(string shoppingCartId);
        Task<List<Cart>> GetCartItemsAsync(string shoppingCartId);
        int GetCount(string shoppingCartId);
        Task<int> GetCountAsync(string shoppingCartId);
        Task<decimal> GetTotalAsync(string shoppingCartId);
        Task MigrateCartAsync(string userName, string shoppingCartId);
        Task<int> CreateOrderAsync(Order order, string shoppingCartId);

        #endregion

        #region Orders

        Task SaveOrderAsync(Order order);
        Task<bool> UserOwnsThisOrder(int id, string userName);

        #endregion
    }
}
