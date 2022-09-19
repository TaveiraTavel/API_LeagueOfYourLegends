using LeagueOfYourLegends_API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace LeagueOfYourLegends_API.Controllers
{
    public class ChampionController : ApiController
    {
        [HttpGet]
        [ActionName("DefaultApi")]
        public string justTest(int id)
        {
            string retorno = "id: " + id;
            return retorno;
        }

        private static Champion champion = new Champion().getChampionByKey("Kalista");

        public Champion Get()
        {
            return champion;
        }
    }
}
