using ClaimEntity;
using Microsoft.AspNetCore.Mvc;

namespace ClaimAllocationAPI.Controllers
{
    public class UserController : Controller
    {
        DataContext _DataContext;
        public IActionResult Index(IConfiguration configuration)
        {

            return View();
        }

        [HttpGet(Name = "GetUser")]
        public IEnumerable<User> Get()
        {
            DataContext DB = new DataContext();
            return DB.Users.ToArray();
            //var lst = 
            //return Enumerable.Range(1, 5).Select(index => new WeatherForecast
            //{
            //    Date = DateTime.Now.AddDays(index),
            //    TemperatureC = Random.Shared.Next(-20, 55),
            //    Summary = Summaries[Random.Shared.Next(Summaries.Length)]
            //})
            //.ToArray();
        }
    }
}
