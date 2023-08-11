using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool isLoggedIn = Session["username"] != null;

           
            if (isLoggedIn)
            {
                Session.Clear(); 
                Session.Abandon(); 

                
            }
        }
    }
}