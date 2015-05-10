using System;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using OnlineShop.Core.Interfaces;
using OnlineShop.Models.ViewModels;

namespace OnlineShop.Controllers
{
    public class ShoppingCartController : Controller
    {
        private readonly IDatabaseHelper _databaseHelper;
        private readonly string _cartId;

        public ShoppingCartController(IDatabaseHelper databaseHelper, IClientStorageService clientStorageService)
        {
            _databaseHelper = databaseHelper;
            _cartId = clientStorageService.GetCartId();
        }

        public async Task<ActionResult> Index()
        {
            var viewModel = new ShoppingCartViewModel
            {
                CartItems = await _databaseHelper.GetCartItemsAsync(_cartId),
                CartTotal = await _databaseHelper.GetTotalAsync(_cartId)
            };

            return View(viewModel);
        }

        public async Task<ActionResult> AddToCart(int id)
        {
            var addedAlbum = await _databaseHelper.GetAlbumAsync(id);
            var cart = _databaseHelper.AddToCartAsync(addedAlbum, _cartId);
            return RedirectToAction("Index");
        }

        public async Task<ActionResult> RemoveFromCart(int id)
        {
            var albumName = await _databaseHelper.GetAlbumNameAsync(id);
            var itemCount = await _databaseHelper.RemoveFromCartAsync(id, _cartId);
            var results = new ShoppingCartRemoveViewModel()
            {
                Message = Server.HtmlEncode(albumName) + " has been removed from your shopping cart.",
                CartTotal = await _databaseHelper.GetTotalAsync(_cartId),
                CartCount = await _databaseHelper.GetCountAsync(_cartId),
                ItemCount = itemCount,
                DeleteId = id
            };

            return Json(results);
        }

        [ChildActionOnly]
        public ActionResult CartSummary()
        {
            ViewBag.CartCount = _databaseHelper.GetCount(_cartId);
            return PartialView("CartSummary");
        }
    }
}