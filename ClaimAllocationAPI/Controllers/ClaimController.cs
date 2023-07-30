using ClaimDBEntity;
using ClaimModel.Model;
using ClaimRepository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ClaimAllocationAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClaimController : ControllerBase
    {
        
        [HttpGet(Name = "GetClaimlist")]
       // [Route("Claim/GetClaimlist")]
        public List<ClaimlistModel> Get()
        {
            ClaimlistRepo CRepo = new ClaimlistRepo();
            return CRepo.GetClaimlists();
        }


        
    }
}
