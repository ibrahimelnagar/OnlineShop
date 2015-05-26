using System.Configuration;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;
using Newtonsoft.Json;
using OnlineShop.Core.Interfaces;

namespace OnlineShop.Controllers
{
    public class HomeController : Controller
    {
        private readonly IDatabaseHelper _databaseHelper;

        private static int TopSellingAlbumsAmount
        {
            get { return int.Parse(ConfigurationManager.AppSettings["TopSellingAlbumsAmount"]); }
        }

        public HomeController(IDatabaseHelper databaseHelper)
        {
            _databaseHelper = databaseHelper;
        }

        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<JsonResult> GetTopSellingAlbumsAsync()
        {
            var topSellingAlbums = await _databaseHelper.GetTopSellingAlbumsAsync(TopSellingAlbumsAmount);

            var albums = topSellingAlbums.Select(x => new {id = x.Id, title = x.Title, albumArtUrl = x.AlbumArtUrl});

            return Json(new { albums = albums });
        } 
    }
}