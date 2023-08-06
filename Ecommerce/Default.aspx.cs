using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce
{
    public partial class _Default : Page
    {
        // Add a flag to track the editing state
        private bool isEditing = false;
        Electronics_ShowRoomEntities db = new Electronics_ShowRoomEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] != null && Session["username"].ToString() == "admin")
                {
                    adminTab.Visible = true;
                    gvCategoriesBind();
                }
                else
                {
                    adminTab.Visible = false;
                }
            }
        }

        public void gvCategoriesBind()
        {
            var categories = from c in db.Categories
                             select c;

            gvCategories.DataSource = categories.ToList();
            gvCategories.DataBind();
        }

        protected void gvCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gvCategories.SelectedIndex >= 0)
            {
                string categoryId = gvCategories.DataKeys[gvCategories.SelectedIndex]["CategoryID"].ToString();
                var selectedCategory = db.Categories.FirstOrDefault(c => c.CategoryID == categoryId);

            }
        }

        protected void dvCategoryNew_DataBound(object sender, EventArgs e)
        {
            if (dvCategoryNew.CurrentMode == DetailsViewMode.ReadOnly)
            {
                foreach (DetailsViewRow row in dvCategoryNew.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        LinkButton deleteLink = row.Cells[0].Controls.OfType<LinkButton>().FirstOrDefault(lb => lb.CommandName == "Delete");
                        if (deleteLink != null)
                        {
                            // Get the data key value from the DataKeyNames property of DetailsView
                            string categoryId = dvCategoryNew.DataKey.Value.ToString();

                            // Retrieve the data item from the database based on the categoryId
                            var category = db.Categories.FirstOrDefault(c => c.CategoryID == categoryId);
                            if (category != null)
                            {
                                string item = category.ShortName;
                                deleteLink.Attributes["onclick"] = "return confirm('Do you want to delete " + item + "? All associated products will be deleted as well.');";
                            }
                        }
                    }
                }
            }
        }

        protected void dvCategoryNew_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
        {
            if (isEditing)
            {
                // Get the data key value from the DataKeyNames property of DetailsView
                string categoryId = dvCategoryNew.DataKey.Value.ToString();

            // Retrieve the category from the database based on the categoryId
            var categoryToDelete = db.Categories.FirstOrDefault(c => c.CategoryID == categoryId);

            if (categoryToDelete != null)
            {
                // Check if there are any products associated with the category to be deleted
                var productsInCategory = db.Products.Where(p => p.CategoryID == categoryId).ToList();

                if (productsInCategory.Count > 0)
                {
                    // Delete all products associated with the category
                    db.Products.RemoveRange(productsInCategory);
                }

                // Now, delete the category itself
                db.Categories.Remove(categoryToDelete);
                db.SaveChanges();

                // Rebind the DetailsView after deleting
                dvCategoryNew.DataBind();
                gvCategories.DataBind();
            }

            // Cancel the default delete operation
            e.Cancel = true;
                
            }
            gvCategoriesBind();
            dvCategoryNew.DataBind();
        }

        protected void dvCategoryNew_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            gvCategoriesBind(); // Bind the GridView to refresh the data
            dvCategoryNew.ChangeMode(DetailsViewMode.ReadOnly); // Switch back to ReadOnly mode after insertion
        }

        protected void dvCategoryNew_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            gvCategoriesBind(); // Bind the GridView to refresh the data
        }

        protected void dvCategoryNew_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            gvCategoriesBind(); // Bind the GridView to refresh the data
        }

        protected void dvProduct_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            // Assuming "ProductId" is the name of your primary key column in the GridView
            string primaryKeyColumnName = "ProductID";

            if (e.AffectedRows > 0 && gvProducts.DataKeys != null)
            {
                // Find the primary key value of the newly inserted product
                object primaryKeyValue = e.Values[primaryKeyColumnName];

                // Find the index of the newly inserted product in the GridView's data source
                int index = -1;
                for (int i = 0; i < gvProducts.DataKeys.Count; i++)
                {
                    if (gvProducts.DataKeys[i].Value.Equals(primaryKeyValue))
                    {
                        index = i;
                        break;
                    }
                }

                // Select the newly inserted product in the GridView
                if (index != -1)
                {
                    gvProducts.SelectedIndex = index;
                }
            }

            // Rebind the GridView and switch the DetailsView to read-only mode
            gvProducts.DataBind();
            dvProduct.ChangeMode(DetailsViewMode.ReadOnly);
        }




        protected void dvProduct_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            gvProducts.DataBind();
        }

        protected void dvProduct_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            gvProducts.DataBind();
        }



    }
}
