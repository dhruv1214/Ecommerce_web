using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Ecommerce
{
    public partial class Order : System.Web.UI.Page
    {
        private CartItemList cart;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlProducts.DataBind();
                cart = CartItemList.GetCart();
                UpdateCartSizeInUI();
            }

            if (ddlProducts.SelectedValue != "")
            {
                LoadProductDetails();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string productId = ddlProducts.SelectedValue;
            string productName = lblName.Text;
            string unitPriceText = lblUnitPrice.Text.Replace("$", "");
            decimal unitPrice = Convert.ToDecimal(unitPriceText);
            int quantity = Convert.ToInt32(txtQuantity.Text);

            cart = CartItemList.GetCart(); // Retrieve existing cart from session

            CartItem existingItem = null;

            // Find the existing item with the given productId
            foreach (CartItem item in cart)
            {
                if (item.Product.ProductID == productId)
                {
                    existingItem = item;
                    break;
                }
            }

            if (existingItem != null)
            {
                // Product already exists in the cart, increase the quantity
                existingItem.AddQuantity(quantity);
            }
            else
            {
                // Product is not in the cart, add it as a new item
                CartItem newItem = new CartItem(new Product
                {
                    ProductID = productId,
                    Name = productName,
                    UnitPrice = unitPrice
                }, quantity);

                cart.AddItem(newItem.Product, newItem.Quantity);
            }

            Session["Cart"] = cart;

            UpdateCartSizeInUI();
            txtQuantity.Text = "";
        }




        private void UpdateCartSizeInUI()
        {
            cart = CartItemList.GetCart();
            int cartSize = (cart != null) ? cart.Count : 0;
            spanCartSize.InnerText = cartSize.ToString();
        }

        private void LoadProductDetails()
        {
            string productId = ddlProducts.SelectedValue;

            using (Electronics_ShowRoomEntities db = new Electronics_ShowRoomEntities())
            {
                Product product = GetProductDetailById(db, productId);

                if (product != null)
                {
                    lblName.Text = product.Name;
                    lblShortDescription.Text = product.ShortDescription;
                    lblLongDescription.Text = product.LongDescription;
                    lblUnitPrice.Text = product.UnitPrice.ToString("c");
                    imgProduct.ImageUrl = GetImageURL(product.ImageFile);
                }
            }
        }

        private Product GetProductDetailById(Electronics_ShowRoomEntities db, string selectedId)
        {
            return db.Products.FirstOrDefault(p => p.ProductID == selectedId);
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