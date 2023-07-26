using ClaimModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClaimEntity.Repo
{
    public class ClaimRepo
    {
        AlgoZyEntities DBContext = new AlgoZyEntities();
        public int GetclaimUnassigned()
        {
            return DBContext.Claims.Where(o => o.ClaimStatusId == 1).Count();
        }
        public int GetclaimAssigned()
        {
            return DBContext.Claims.Where(o => o.ClaimStatusId == 2).Count();
            
        }
        public int GetclaimWIP()
        {
            return DBContext.Claims.Where(o => o.ClaimStatusId == 3).Count();
            
        }

        public ClaimCount Getclaim()
        {
            ClaimCount UR = new ClaimCount();
            UR.claimUnassigned = DBContext.Claims.Where(o => o.ClaimStatusId == 1).Count();
            UR.claimAssigned = DBContext.Claims.Where(o => o.ClaimStatusId == 2).Count();
            UR.claimWIP = DBContext.Claims.Where(o => o.ClaimStatusId == 3).Count();
            return UR;
        }

    }
}
