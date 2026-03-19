using System;
using System.Collections.Generic;

namespace SWD_Group4.DataAccess.Models;

public partial class RefundRequest
{
    public int Id { get; set; }

    public int? OrderId { get; set; }

    public string? Reason { get; set; }

    public string? Status { get; set; }

    public virtual Order? Order { get; set; }
}
