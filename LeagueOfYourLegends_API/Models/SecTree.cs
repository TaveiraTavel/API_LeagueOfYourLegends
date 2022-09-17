using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LeagueOfYourLegends_API.Models
{
    public class SecTree
    {
        public int idSecTree { get; set; }
        public Tree treePrimTree { get; set; }
        public Rune rune1 { get; set; }
        public Rune rune2 { get; set; }
    }
}