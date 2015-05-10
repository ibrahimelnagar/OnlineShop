using System;
using System.Threading.Tasks;
using System.Web.Mvc;
using OnlineShop.Core.Database;
using OnlineShop.Core.Interfaces;

namespace OnlineShop.Controllers
{
    [Authorize]
    public class CheckoutController : Controller
    {
        private readonly IDatabaseHelper _databaseHelper;
        private readonly string _cartId;
        private const string PromoCode = "FREE";

        public CheckoutController(IDatabaseHelper databaseHelper, IClientStorageService clientStorageService)
        {
            _databaseHelper = databaseHelper;
            _cartId = clientStorageService.GetCartId();
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AddressAndPayment()
        {
            return View();
        }

        [HttpPost]
        public async Task<ActionResult> AddressAndPayment(FormCollection values)
        {
            var order = new Order();
            TryUpdateModel(order);

            try
            {
                if (string.Equals(values["PromoCode"], PromoCode, StringComparison.OrdinalIgnoreCase) == false)
                {
                    return View(order);
                }

                order.Username = User.Identity.Name;
                order.OrderDate = DateTime.UtcNow;

                await _databaseHelper.SaveOrderAsync(order);
                await _databaseHelper.CreateOrderAsync(order, _cartId);

                return RedirectToAction("Complete", new { id = order.Id });
            }
            catch (Exception)
            {
                return View(order);
            }
        }

        public async Task<ActionResult> Complete(int id)
        {
            var isValid = await _databaseHelper.UserOwnsThisOrder(id, User.Identity.Name);

            return isValid ? View(id) : View("Error");
        }
    }
}