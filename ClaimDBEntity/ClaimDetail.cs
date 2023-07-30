using System;
using System.Collections.Generic;

namespace ClaimDBEntity
{
    public partial class ClaimDetail
    {
        public long Id { get; set; }
        public long? ClaimId { get; set; }
        public string? Cpthcpc { get; set; }
        public decimal? AllowedAmount { get; set; }
        public decimal? PaidAmount { get; set; }
    }
}
