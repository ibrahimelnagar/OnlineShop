using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using OnlineShop.Core.Interfaces;

// ReSharper disable ClassNeverInstantiated.Global

namespace OnlineShop.Core.Database
{
    public class DatabaseHelper : IDisposable, IDatabaseHelper
    {
        private readonly IEntity _context;

        public DatabaseHelper(IEntity context)
        {
            _context = context;
        }

        #region Genres Queries

        public async Task<List<Genre>> GetGenresAsync()
        {
            return await _context.Genres.ToListAsync();
        }

        public List<Genre> GetGenres()
        {
            return _context.Genres.ToList();
        }

        public Genre GetGenreWithAlbums(string genreName)
        {
            return _context.Genres.Include("Albums").SingleOrDefault(x => x.Name == genreName);
        }

        #endregion

        #region Album Queries

        public async Task CreateAlbum(Album album)
        {
            _context.Albums.Add(album);
            await _context.SaveChangesAsync();
        }

        public async Task<Album> GetAlbumAsync(int id)
        {
            return await _context.Albums.FindAsync(id);
        }

        public async Task<List<Album>> GetAlbumsWithArtistAndGenreAsync()
        {
            return await _context.Albums.Include("Artist").Include("Genre").ToListAsync();
        }

        public async Task UpdateAlbumAsync(Album album)
        {
            _context.Entry(album).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task RemoveAlbumAsync(Album album)
        {
            _context.Albums.Remove(album);
            await _context.SaveChangesAsync();
        }

        public async Task<List<Album>> GetTopSellingAlbumsAsync(int count)
        {
            return await _context.Albums.OrderByDescending(x => x.OrderDetails.Count()).Take(count).ToListAsync();
        }

        #endregion

        #region Artists Queries

        public async Task<List<Artist>> GetArtistsAsync()
        {
            return await _context.Artists.ToListAsync();
        } 

        #endregion

        #region Cart Queries

        public async Task AddToCartAsync(Album album, string shoppingCartId)
        {
            var cartItem = await _context.Carts.SingleOrDefaultAsync(x => x.CartId == shoppingCartId && x.AlbumId == album.Id);

            if (cartItem == null)
            {
                cartItem = new Cart()
                {
                    AlbumId = album.Id,
                    CartId = shoppingCartId,
                    Count = 1,
                    DateCreated = DateTime.UtcNow
                };

                _context.Carts.Add(cartItem);
            }
            else
            {
                cartItem.Count++;
            }

            await _context.SaveChangesAsync();
        }

        public async Task<int> RemoveFromCartAsync(int id, string shoppingCartId)
        {
            var cartItem = await _context.Carts.SingleOrDefaultAsync(x => x.CartId == shoppingCartId && x.Id == id);
            var itemCount = 0;

            if (cartItem == null) return itemCount;

            if (cartItem.Count > 1)
            {
                cartItem.Count--;
                itemCount = cartItem.Count;
            }
            else
            {
                _context.Carts.Remove(cartItem);
            }

            await _context.SaveChangesAsync();

            return itemCount;
        }

        public async Task EmptyCartAsync(string shoppingCartId)
        {
            var cartItems = await _context.Carts.Where(x => x.CartId == shoppingCartId).ToListAsync();

            foreach (var item in cartItems)
            {
                _context.Carts.Remove(item);
            }

            await _context.SaveChangesAsync();
        }

        public async Task<List<Cart>> GetCartItemsAsync(string shoppingCartId)
        {
            return await _context.Carts.Where(x => x.CartId == shoppingCartId).ToListAsync();
        }

        public async Task<int> GetCountAsync(string shoppingCartId)
        {
            var count = await _context.Carts.Where(x => x.CartId == shoppingCartId).Select(x => (int?) x.Count).SumAsync(); 
            return count ?? 0;
        }

        public int GetCount(string shoppingCartId)  
        {
            int? count = _context.Carts.Where(x => x.CartId == shoppingCartId).Select(x => (int?)x.Count).Sum() ?? 0;
            return count ?? 0;
        }

        public async Task<decimal> GetTotalAsync(string shoppingCartId)
        {
            var total = await _context.Carts.Where(x => x.CartId == shoppingCartId).Select(x => (decimal?)x.Count*x.Album.Price).SumAsync();
            return total ?? decimal.Zero;
        }

        public async Task<int> CreateOrderAsync(Order order, string shoppingCartId)
        {
            var orderTotal = 0m
                ;

            var cartItems = await GetCartItemsAsync(shoppingCartId);
            foreach (var item in cartItems)
            {
                var orderDetail = new OrderDetail()
                {
                    AlbumId = item.AlbumId,
                    OrderId = order.Id,
                    UnitPrice = item.Album.Price,
                    Quantity = item.Count
                };

                orderTotal += (item.Count*item.Album.Price);
                _context.OrderDetails.Add(orderDetail);
            }

            order.Total = orderTotal;

            await _context.SaveChangesAsync();
            await EmptyCartAsync(shoppingCartId);
            return order.Id; 
        }

        public async Task MigrateCartAsync(string userName, string shoppingCartId)
        {
            var shoppingCart = await _context.Carts.Where(x => x.CartId == shoppingCartId).ToListAsync();

            foreach (var item in shoppingCart)
            {
                item.CartId = userName;
            }

            await _context.SaveChangesAsync();
        }

        public async Task<string> GetAlbumNameAsync(int id)
        {
            var cart = await _context.Carts.SingleAsync(x => x.Id == id);
            return cart.Album.Title;
        }

        #endregion

        #region Order Queries

        public async Task SaveOrderAsync(Order order)
        {
            _context.Orders.Add(order);
            await _context.SaveChangesAsync();
        }

        public async Task<bool> UserOwnsThisOrder(int id, string userName)
        {
            return await _context.Orders.AnyAsync(x => x.Id == id && x.Username == userName);
        }

        #endregion

        #region DisposeContext

        private bool _disposed;

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!_disposed)
            {
                if (disposing)
                {
                    _context.Dispose();
                }
            }

            _disposed = true;
        }

        #endregion
    }
}