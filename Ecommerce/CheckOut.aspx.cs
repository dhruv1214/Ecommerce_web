using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce
{
    public partial class CheckOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblmsg.Text = string.Empty;
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("cart.aspx");
        }


        protected void ButtonCheckout_Click(object sender, EventArgs e)
        {
            lblmsg.Text = "Order Placed!!";
            lblmsg.ForeColor = Color.Green;
            lblmsg.Font.Size = new FontUnit(24);
            lblmsg.Font.Bold = true;


            // Resetting the form fields
            textEmail.Text = string.Empty;
            textReEmail.Text = string.Empty;
            textFirstName.Text = string.Empty;
            textLastName.Text = string.Empty;
            textPhoneNumber.Text = string.Empty;
            textAddress.Text = string.Empty;
            textCity.Text = string.Empty;
            selState.SelectedIndex = 0;
            textZipCode.Text = string.Empty;


        }
    }
}