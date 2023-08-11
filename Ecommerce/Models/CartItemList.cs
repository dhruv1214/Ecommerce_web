using Ecommerce;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class CartItemList : IEnumerable<CartItem>
{
    private List<CartItem> cartItems;

    public CartItemList()
    {
        cartItems = new List<CartItem>();
    }

    public int Count
    {
        get { return cartItems.Count; }
    }

    public CartItem this[int index]
    {
        get { return cartItems[index]; }
        set { cartItems[index] = value; }
    }

    public CartItem this[string id]
    {
        get
        {
            foreach (CartItem c in cartItems)
                if (c.Product.ProductID == id) return c;
            return null;
        }
    }

    public decimal GetTotalPrice()
    {
        //CartItemList cart = (CartItemList)HttpContext.Current.Session["Cart"];
        decimal total = 0;
        foreach (CartItem c in this.cartItems)
            total += c.Product.UnitPrice * c.Quantity;
        return total;
    }

    public static CartItemList GetCart()
    {
        CartItemList cart = (CartItemList)HttpContext.Current.Session["Cart"];
        if (cart == null)
        {
            cart = new CartItemList();
            HttpContext.Current.Session["Cart"] = cart;
        }
        return cart;
    }
    public void AddItem(Ecommerce.Product product, int quantity)
    {
        CartItem c = new CartItem(product, quantity);
        cartItems.Add(c);
    }

    public List<CartItem> GetCartItems()
    {
        return cartItems;
    }

    public void RemoveAt(int index)
    {
        cartItems.RemoveAt(index);
    }

    public void Clear()
    {
        cartItems.Clear();
    }

    public IEnumerator<CartItem> GetEnumerator()
    {
        return cartItems.GetEnumerator();
    }

    IEnumerator IEnumerable.GetEnumerator()
    {
        return GetEnumerator();
    }
}
