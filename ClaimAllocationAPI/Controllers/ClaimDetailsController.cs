using ClaimModel.Model;
using ClaimRepository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ClaimAllocationAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClaimDetailsController : ControllerBase
    {
        [HttpGet(Name = "GetClaimDetails")]
        public List<ClaimDetailsModel> Get(int ClaimId)
        {
            ClaimRepo CRepo = new ClaimRepo();
            return CRepo.GetClaimDetails(ClaimId);
        }
    }
}
