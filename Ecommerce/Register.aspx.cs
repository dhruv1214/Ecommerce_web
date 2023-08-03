using System;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web.UI;

namespace Ecommerce
{
    public partial class Register : Page
    {
        Electronics_ShowRoomEntities db = new Electronics_ShowRoomEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            // Add other required registration fields here

            // Check if the username already exists in the Users table
            bool isUsernameExist = db.Users.Any(u => u.username == username);

            if (isUsernameExist)
            {
                // Show an error message for duplicate username
                lblErrorMessage.Text = "Username already exists. Please choose a different username.";
                lblErrorMessage.Visible = true;
            }
            else
            {
                // Create a new user and save data to the Users table using Entity Framework
                var u = new User
                {
                    username = username,
                    password = password,
                    userType = "admin"
                };

                db.Users.Add(u);

                try
                {
                    db.SaveChanges();
                    lblRegistrationMessage.Visible = true;
                }
                catch (DbEntityValidationException ex)
                {
                    // Handle validation errors
                    var errorMessages = ex.EntityValidationErrors
                        .SelectMany(x => x.ValidationErrors)
                        .Select(x => x.ErrorMessage);

                    lblErrorMessage.Text = "Registration failed due to the following errors:<br />";
                    lblErrorMessage.Text += string.Join("<br />", errorMessages);
                    lblErrorMessage.Visible = true;
                }
            }
        }
    }
}
