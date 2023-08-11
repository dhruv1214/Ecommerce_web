using Ecommerce;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class CartItem
{
    private Ecommerce.Product product;
    private Product product1;


    //public decimal TotalPrice;

    public CartItem(Ecommerce.Product product, int quantity)
    {
        this.product = product;
        Quantity = quantity;
        TotalPrice = product.UnitPrice * quantity;
        CartText = this.product.UnitPrice.ToString("c") + " x " + Quantity + " = " + TotalPrice;
    }
    public Ecommerce.Product Product // Use the Product property to access the stored product
    {
        get { return product; }
    }

    public CartItem(Product product1, int quantity)
    {
        this.product1 = product1;
        Quantity = quantity;
    }


    public int Quantity { get; set; }

    public decimal TotalPrice { get; set; }

    public string CartText { get; set; }

    public void AddQuantity(int quantity)
    {
        this.Quantity += quantity;
    }

    public string GetProductName()
    {
        return this.Product.Name;
    }

    public decimal GetTotal()
    {
        return this.Product.UnitPrice * this.Quantity;
    }

    public string Display()
    {
        string displayString = string.Format("{0} ({1} @ {2} each = {3})",
            Product.Name,
            Quantity.ToString(),
            Product.UnitPrice.ToString("c"),
            (Product.UnitPrice * Quantity).ToString("c"));

        return displayString;
    }


}
