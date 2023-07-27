using ClaimEntity.Repo;
using ClaimModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ClaimAllocationAPI.Controllers
{
    public class ClaimDetailsController : ApiController
    {
        // GET api/<controller>/5
        public List<ClaimDetailsModel> Getclaimdetails(int ClaimId)
        {
            ClaimRepo CR = new ClaimRepo();
            return CR.GetClaimDetails(ClaimId);            
        }
    }
}
