using System;
using System.Collections.Generic;

namespace ClaimDBEntity
{
    public partial class ClaimCommentHistory
    {
        public long Id { get; set; }
        public string? Comment { get; set; }
        public long? CommentedBy { get; set; }
        public long? ClaimId { get; set; }
    }
}
