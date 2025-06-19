using Microsoft.AspNetCore.Mvc;

namespace HelloWorldAspNetCore.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class HelloController : ControllerBase
    {
        [HttpGet]
        public string Get()
        {
            return "ljggkvhuj";
        }
    }
}
