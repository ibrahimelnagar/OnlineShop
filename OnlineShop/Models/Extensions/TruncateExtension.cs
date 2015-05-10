using System.Web.Mvc;

namespace OnlineShop.Models.Extensions
{
    public static class TruncateExtension
    {
        public static string Truncate(this HtmlHelper helper, string input, int length)
        {
            if (input.Length > length) return input.Substring(0, length) + "...";
            return input;
        }   
    } 
}