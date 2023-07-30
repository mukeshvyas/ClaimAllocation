using ClaimDBEntity;
using ClaimRepository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ClaimAllocationAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClaimStatusController : ControllerBase
    {
        [HttpGet(Name = "GetClaimStatus")]
        //  [Route("Claim/GetClaimbyId")]
        public List<ClaimStatus> GetClaimStatus()
        {
            ClaimStatusRepo CRepo = new ClaimStatusRepo();
            return CRepo.GetClaimStatus();
        }
    }
}
