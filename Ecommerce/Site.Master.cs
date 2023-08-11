using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool isLoggedIn = Session["username"] != null;

            // Set the visibility of the login and register links based on the user's authentication status
            loginLink.Visible = !isLoggedIn;
         

            // Set the visibility of the logout link based on the user's authentication status
            logoutLink.Visible = isLoggedIn;
        }
    }
}