using System.Configuration;
using System.Threading.Tasks;
using System.Web.Mvc;
using OnlineShop.Core.Interfaces;

namespace OnlineShop.Controllers
{
    public class HomeController : Controller
    {
        private readonly IDatabaseHelper _databaseHelper;
        private readonly string ble = "sdas";

        private static int TopSellingAlbumsAmount
        {
            get { return int.Parse(ConfigurationManager.AppSettings["TopSellingAlbumsAmount"]); }
        }

        public HomeController(IDatabaseHelper databaseHelper)
        {
            _databaseHelper = databaseHelper;
        }

        public async Task<ActionResult> Index()
        {
            return View(await _databaseHelper.GetTopSellingAlbumsAsync(TopSellingAlbumsAmount));
        }
    }
}