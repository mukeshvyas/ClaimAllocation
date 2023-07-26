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
    public class ClaimlistController : ApiController
    {
        public ClaimCount Getclaimlist()
        {
            ClaimRepo CR = new ClaimRepo();
            ClaimCount Claim = new ClaimCount();
            Claim = CR.Getclaim();
            return Claim;
        }
    }
}
