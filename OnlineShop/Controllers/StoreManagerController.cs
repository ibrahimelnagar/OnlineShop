using System.Net;
using System.Threading.Tasks;
using System.Web.Mvc;
using OnlineShop.Core.Database;
using OnlineShop.Core.Interfaces;

namespace OnlineShop.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class StoreManagerController : Controller
    {
        private readonly IDatabaseHelper _databaseHelper;

        public StoreManagerController(IDatabaseHelper databaseHelper)
        {
            _databaseHelper = databaseHelper;
        }

        public async Task<ActionResult> Index()
        {
            return View(await _databaseHelper.GetAlbumsWithArtistAndGenreAsync());
        }

        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var album = await _databaseHelper.GetAlbumAsync(id.Value);
            
            if (album == null)
            {
                return HttpNotFound();
            }

            return View(album);
        }

        public async Task<ActionResult> Create()
        {
            ViewBag.ArtistId = new SelectList(await _databaseHelper.GetArtistsAsync(), "Id", "Name");
            ViewBag.GenreId = new SelectList(await _databaseHelper.GetGenresAsync(), "Id", "Name");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,GenreId,ArtistId,Title,Price,AlbumArtUrl")] Album album)
        {
            if (ModelState.IsValid)
            {
                await _databaseHelper.CreateAlbum(album);
                return RedirectToAction("Index");
            }

            ViewBag.ArtistId = new SelectList(await _databaseHelper.GetArtistsAsync(), "Id", "Name", album.ArtistId);
            ViewBag.GenreId = new SelectList(await _databaseHelper.GetGenresAsync(), "Id", "Name", album.GenreId);
            return View(album);
        }

        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var album = await _databaseHelper.GetAlbumAsync(id.Value);

            if (album == null)
            {
                return HttpNotFound();
            }

            ViewBag.ArtistId = new SelectList(await _databaseHelper.GetArtistsAsync(), "Id", "Name", album.ArtistId);
            ViewBag.GenreId = new SelectList(await _databaseHelper.GetGenresAsync(), "Id", "Name", album.GenreId);
            return View(album);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,GenreId,ArtistId,Title,Price,AlbumArtUrl")] Album album)
        {
            if (ModelState.IsValid)
            {
                await _databaseHelper.UpdateAlbumAsync(album);
                return RedirectToAction("Index");
            }

            ViewBag.ArtistId = new SelectList(await _databaseHelper.GetArtistsAsync(), "Id", "Name", album.ArtistId);
            ViewBag.GenreId = new SelectList(await _databaseHelper.GetGenresAsync(), "Id", "Name", album.GenreId);
            return View(album);
        }

        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var album = await _databaseHelper.GetAlbumAsync(id.Value);

            if (album == null)
            {
                return HttpNotFound();
            }

            return View(album);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            var album = await _databaseHelper.GetAlbumAsync(id);
            await _databaseHelper.RemoveAlbumAsync(album);
            return RedirectToAction("Index");
        }
    }
}
