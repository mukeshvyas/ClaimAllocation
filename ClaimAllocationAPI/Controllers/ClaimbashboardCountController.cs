using ClaimModel.Model;
using ClaimRepository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ClaimAllocationAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClaimbashboardCountController : ControllerBase
    {
        
        [HttpGet(Name = "GetClaimCount")]
        public ClaimCount Get()
        {
            ClaimRepo CRepo = new ClaimRepo();
            return CRepo.Getclaimcounts();            
        }
    }
}
