using System;
using System.Collections.Generic;

namespace ClaimDBEntity
{
    public partial class Role
    {
        public long Id { get; set; }
        public string? RoleName { get; set; }
        public string? Description { get; set; }
        public bool? IsActive { get; set; }
    }
}
