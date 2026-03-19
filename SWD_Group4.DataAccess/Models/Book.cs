using System;
using System.Collections.Generic;

namespace SWD_Group4.DataAccess.Models;

public partial class Book
{
    public int Id { get; set; }

    public int? SellerId { get; set; }

    public string? Title { get; set; }

    public string? Author { get; set; }

    public double? Price { get; set; }

    public string? Description { get; set; }

    public string? Status { get; set; }

    public int? StockQuantity { get; set; }

    public virtual ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();

    public virtual User? Seller { get; set; }

    public virtual ICollection<Category> Categories { get; set; } = new List<Category>();
}
