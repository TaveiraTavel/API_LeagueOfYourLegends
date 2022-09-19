using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LeagueOfYourLegends_API.Models
{
    public class Build
    {
        public Inicial inicialBuild { get; set; }
        public Geral geralBuild { get; set; }
        public Situacional situacionalBuild { get; set; }
    }
}