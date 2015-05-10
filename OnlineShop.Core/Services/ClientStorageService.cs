using System;
using System.Diagnostics.CodeAnalysis;
using System.Web;
using OnlineShop.Core.Interfaces;

namespace OnlineShop.Core.Services
{
    [SuppressMessage("ReSharper", "ClassNeverInstantiated.Global")]
    public class ClientStorageService : IClientStorageService
    {
        private const string CartCookieKey = "CartId";

        public string GetCartId()
        {
            if (HttpContext.Current.Request.Cookies[CartCookieKey] != null) return HttpContext.Current.Request.Cookies[CartCookieKey].Value;

            HttpContext.Current.Response.Cookies.Add(!string.IsNullOrWhiteSpace(HttpContext.Current.User.Identity.Name)
                ? new HttpCookie(CartCookieKey) { Value = HttpContext.Current.User.Identity.Name }
                : new HttpCookie(CartCookieKey) { Value = Guid.NewGuid().ToString() });

            return HttpContext.Current.Request.Cookies[CartCookieKey] == null ? string.Empty : HttpContext.Current.Request.Cookies[CartCookieKey].Value;
        }
    }
}
