using System;
using System.Collections.Generic;

namespace ClaimDBEntity
{
    public partial class ClaimWorkflow
    {
        public long Id { get; set; }
        public long? ClaimId { get; set; }
        public long? AssignerId { get; set; }
        public long? AssigneeId { get; set; }
        public int? ClaimStatusId { get; set; }
        public DateTime? CreatedDate { get; set; }
    }
}
