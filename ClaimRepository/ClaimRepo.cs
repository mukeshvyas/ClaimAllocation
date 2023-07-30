using ClaimDBEntity;
using ClaimModel.Model;
using Microsoft.Extensions.Configuration;

namespace ClaimRepository
{
    public class ClaimRepo
    {
        private readonly ClaimAllocationContext _context;

        public ClaimRepo()
        {
            ClaimAllocationContext context = new ClaimAllocationContext();
            _context = context;
        }

        public int GetclaimUnassigned()
        {
            return _context.Claims.Where(o => o.ClaimStatusId == 1).Count();
        }
        public int GetclaimAssigned()
        {
            return _context.Claims.Where(o => o.ClaimStatusId == 2).Count();
        }
        public int GetclaimWIP()
        {
            return _context.Claims.Where(o => o.ClaimStatusId == 3).Count();
        }

        public ClaimCount Getclaimcounts()
        {
            
            ClaimCount UR = new ClaimCount();
            UR.ClaimUnassigned = _context.Claims.Where(o => o.ClaimStatusId == 1).Count();
            UR.ClaimAssigned = _context.Claims.Where(o => o.ClaimStatusId == 2).Count();
            UR.ClaimWIP = _context.Claims.Where(o => o.ClaimStatusId == 3).Count();
            return UR;
        }

        public List<ClaimDetailsModel> GetClaimDetails(int ClaimID)
        {

            return _context.ClaimDetails.Where(o => o.ClaimId == ClaimID).Select(p => new ClaimDetailsModel()
            {
                CPTHCPC = p.Cpthcpc,
                AllowedAmount = p.AllowedAmount,
                PaidAmount = p.PaidAmount
            }).ToList();
           
        }

        public Claim GetClaimById(int ClaimID)
        {
             return _context.Claims.Where(o => o.Id == ClaimID).FirstOrDefault();
        }

    }
}