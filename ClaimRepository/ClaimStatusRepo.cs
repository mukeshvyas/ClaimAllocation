using ClaimDBEntity;
using ClaimModel.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClaimRepository
{
    public class ClaimStatusRepo
    {
        private readonly ClaimAllocationContext _context;

        public ClaimStatusRepo()
        {
            ClaimAllocationContext context = new ClaimAllocationContext();
            _context = context;
        }

        public List<ClaimStatus> GetClaimStatus()
        {
            return _context.ClaimStatuses.ToList();
        }
    }
}
