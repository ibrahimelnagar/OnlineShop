﻿using Microsoft.Owin;
using OnlineShop;
using Owin;

[assembly: OwinStartup(typeof(Startup))]
namespace OnlineShop
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
