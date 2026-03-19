using System;
using System.Collections.Generic;

namespace SWD_Group4.DataAccess.Models;

public partial class Promotion
{
    public int Id { get; set; }

    public int? CreatedBy { get; set; }

    public string? PromotionName { get; set; }

    public string? DiscountType { get; set; }

    public double? DiscountValue { get; set; }

    public string? PromotionScope { get; set; }

    public string? Status { get; set; }

    public DateTime? StartDate { get; set; }

    public DateTime? EndDate { get; set; }

    public virtual User? CreatedByNavigation { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
