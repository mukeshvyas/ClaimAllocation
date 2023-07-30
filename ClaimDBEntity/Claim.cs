using System;
using System.Collections.Generic;

namespace ClaimDBEntity
{
    public partial class Claim
    {
        public long Id { get; set; }
        public string? PatientName { get; set; }
        public string? ProviderName { get; set; }
        public decimal? ClaimAmount { get; set; }
        public decimal? AllowedAmount { get; set; }
        public decimal? PaidAmount { get; set; }
        public int? ClaimStatusId { get; set; }
        public string? LastComment { get; set; }
        public long? ClientId { get; set; }
        public string? ClaimNo { get; set; }
    }
}
