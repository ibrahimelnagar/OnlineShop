using System.Threading.Tasks;
using System.Web.Mvc;
using OnlineShop.Core.Interfaces;

namespace OnlineShop.Controllers
{
    public class StoreController : Controller
    {
        private readonly IDatabaseHelper _databaseHelper = null;

        public StoreController(IDatabaseHelper databaseHelper)
        {
            _databaseHelper = databaseHelper;
        }

        public async Task<ActionResult> Index()
        {
            return View(await _databaseHelper.GetGenresAsync());
        }

        public ActionResult Browse(string genre)
        {
            var model = _databaseHelper.GetGenreWithAlbums(genre);
            return View(model);
        }

        public async Task<ActionResult> Details(int id)
        {
            return View(await _databaseHelper.GetAlbumAsync(id));
        }

        public ActionResult GenreMenu()
        {
            var genres = _databaseHelper.GetGenres(); 
            return PartialView(genres);
        }
    }
}