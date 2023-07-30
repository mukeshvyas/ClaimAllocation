using ClaimDBEntity;
using ClaimModel.Model;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClaimRepository
{
    public class ClaimlistRepo
    {
        private readonly ClaimAllocationContext _context;

        public ClaimlistRepo()
        {
            ClaimAllocationContext context = new ClaimAllocationContext();
            _context = context;
        }

        public List<ClaimlistModel> GetClaimlists()
        {
            //List<ClaimlistModel> ClaimDetails = _context.Database.SqlQuery<ClaimlistModel>($"EXEC GetClaimlist").ToList();
            return _context.GetClaimlist_Result.FromSqlInterpolated<ClaimlistModel>($"EXEC GetClaimlist ").ToList();
        }
    }
}
