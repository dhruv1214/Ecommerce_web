using System;
using System.Linq;
using System.Web.UI;

namespace Ecommerce
{
    public partial class Login : Page
    {
        Electronics_ShowRoomEntities db = new Electronics_ShowRoomEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Check if the user with the provided credentials exists in the Users table
            var user = db.Users.FirstOrDefault(u => u.username == username && u.password == password);

            if (user != null)
            {
                // Redirect to the home page or any other page after successful login
                Session["username"] = user.username; // Assuming you have a UserID property in the Users table
                
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                // Show an error message for invalid user credentials
                lblErrorMessage.Text = "Invalid Username Or Password.";
                lblErrorMessage.Visible = true;
            }
        }
    }
}
