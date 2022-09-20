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
        public Champion GetSpecified(string champion)
        {
            return new Champion().getChampionByKey(champion);
        }

        public string Get()
        {
            //return new Champion().getAllChampions();
            return "TODOS";
        }
    }
}
