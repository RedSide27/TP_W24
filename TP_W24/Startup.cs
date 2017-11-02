using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TP_W24.Startup))]
namespace TP_W24
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
