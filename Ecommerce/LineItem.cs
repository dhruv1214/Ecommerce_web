//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Ecommerce
{
    using System;
    using System.Collections.Generic;
    
    public partial class LineItem
    {
        public int InvoiceNumber { get; set; }
        public string ProductID { get; set; }
        public decimal UnitPrice { get; set; }
        public int Quantity { get; set; }
        public Nullable<decimal> Extension { get; set; }
    
        public virtual invoice invoice { get; set; }
        public virtual Product Product { get; set; }
    }
}
