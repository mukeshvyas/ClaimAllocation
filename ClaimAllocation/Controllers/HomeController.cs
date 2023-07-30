using ClaimAllocation.Common;
using ClaimAllocation.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Net;

namespace ClaimAllocation.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            webClient wclient = new webClient();
            
            string result = wclient.GetClientData("Claim");
            //string result = wclient.SetClientData("ClaimSave", Newtonsoft.Json.JsonConvert.SerializeObject(objData));
            if (!string.IsNullOrWhiteSpace(result))
            {

               // return JsonConvert.DeserializeObject<T>(result);
            }

            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}