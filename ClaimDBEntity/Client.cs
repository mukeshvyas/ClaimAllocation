using System;
using System.Collections.Generic;

namespace ClaimDBEntity
{
    public partial class Client
    {
        public long Id { get; set; }
        public string? FullName { get; set; }
        public string? Description { get; set; }
        public DateTime? DateOfCreation { get; set; }
    }
}
