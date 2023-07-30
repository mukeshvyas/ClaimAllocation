using ClaimDBEntity;
using ClaimRepository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ClaimAllocationAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClaimcommentController : ControllerBase
    {
        [HttpGet(Name = "GetClaimComments")]
        //  [Route("Claim/GetClaimbyId")]
        public List<ClaimCommentHistory> GetClaimCommentsbyId(int ClaimId)
        {
            ClaimCommentsRepo CRepo = new ClaimCommentsRepo();
            return CRepo.GetClaimCommentHistroy(ClaimId);
        }
    }
}
