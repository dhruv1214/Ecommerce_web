using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace Ecommerce
{
    public partial class Product1 : System.Web.UI.Page
    {
        Electronics_ShowRoomEntities db = new Electronics_ShowRoomEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

       
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            lvProducts.DataBind();
        }

       
        protected string GetImageURL(object imageFileName)
        {
            if (imageFileName != null)
            {
                string imageName = imageFileName.ToString();
                string imagePath = $"~/image/{imageName}"; // Adjust the path as needed
                return ResolveUrl(imagePath);
            }
            return null;
        }

        
    }
}
