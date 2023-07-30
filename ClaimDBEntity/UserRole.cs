using System;
using System.Collections.Generic;

namespace ClaimDBEntity
{
    public partial class UserRole
    {
        public long Id { get; set; }
        public long? UserId { get; set; }
        public long? RoleId { get; set; }
        public bool? IsActive { get; set; }
    }
}
