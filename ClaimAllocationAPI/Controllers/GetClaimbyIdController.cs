using ClaimDBEntity;
using ClaimRepository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ClaimAllocationAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GetClaimbyIdController : ControllerBase
    {
        [HttpGet(Name = "GetClaimbyId")]
      //  [Route("Claim/GetClaimbyId")]
        public Claim GetClaimbyId(int ClaimId)
        {
            ClaimRepo CRepo = new ClaimRepo();
            return CRepo.GetClaimById(ClaimId);
        }
    }
}
