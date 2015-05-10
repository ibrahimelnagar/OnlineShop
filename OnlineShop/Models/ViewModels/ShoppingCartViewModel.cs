using System.Collections.Generic;
using OnlineShop.Core.Database;

namespace OnlineShop.Models.ViewModels
{
    public class ShoppingCartViewModel
    {
        public List<Cart> CartItems { get; set; }
        public decimal CartTotal { get; set; }
    }
}