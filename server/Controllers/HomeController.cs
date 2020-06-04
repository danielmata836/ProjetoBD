using System;
using Microsoft.AspNetCore.Mvc;

namespace ProjetoNew.Controllers
{
    public partial class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
