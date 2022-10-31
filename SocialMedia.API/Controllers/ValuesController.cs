using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace SocialMedia.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        public IActionResult GetAction()
        {
            return Ok(null);
        }
    }
}
