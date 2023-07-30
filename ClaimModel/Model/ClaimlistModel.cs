using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClaimModel.Model
{
    public class ClaimlistModel
    {
        public string ClientName { get; set; }
        public string ClaimNo { get; set; }
        public string patientName { get; set; }
        public string ProviderName { get; set; }

        public string ClaimStatus { get; set; }
        public Nullable<decimal> AllowedAmount { get; set; }
        public Nullable<decimal> PaidAmount { get; set; }
        public string? LastComment { get; set; }
        public string? AssignedTo { get; set; }
    }
    
}
