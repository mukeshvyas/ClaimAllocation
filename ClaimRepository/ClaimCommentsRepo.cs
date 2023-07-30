using ClaimDBEntity;
using ClaimModel.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClaimRepository
{
    public class ClaimCommentsRepo
    {
        private readonly ClaimAllocationContext _context;

        public ClaimCommentsRepo()
        {
            ClaimAllocationContext context = new ClaimAllocationContext();
            _context = context;
        }
        public List<ClaimCommentHistory> GetClaimCommentHistroy(int ClaimID)
        {
            return _context.ClaimCommentHistories.Where(o => o.ClaimId == ClaimID).ToList();
        }
    }
}
