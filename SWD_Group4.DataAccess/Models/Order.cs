using System;
using System.Collections.Generic;

namespace SWD_Group4.DataAccess.Models;

public partial class Order
{
    public int Id { get; set; }

    public int? CustomerId { get; set; }

    public int? SellerId { get; set; }

    public int? PromotionId { get; set; }

    public double? TotalPrice { get; set; }

    public string? Status { get; set; }

    public string? PaymentMethod { get; set; }

    public string? PaymentTransactionId { get; set; }

    public DateTime? PaymentDate { get; set; }

    public string? Address { get; set; }

    public virtual User? Customer { get; set; }

    public virtual ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();

    public virtual Promotion? Promotion { get; set; }

    public virtual ICollection<RefundRequest> RefundRequests { get; set; } = new List<RefundRequest>();

    public virtual User? Seller { get; set; }
}
