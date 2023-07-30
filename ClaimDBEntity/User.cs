using System;
using System.Collections.Generic;

namespace ClaimDBEntity
{
    public partial class User
    {
        public long Id { get; set; }
        public string? UserName { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string? Password { get; set; }
        public bool? IsActive { get; set; }
        public DateTime? DateOfCreation { get; set; }
    }
}
