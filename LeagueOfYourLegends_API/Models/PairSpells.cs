using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LeagueOfYourLegends_API.Models
{
    public class PairSpells
    {
        public int idPairSpells { get; set; }
        public Spell spell1 { get; set; }
        public Spell spell2 { get; set; }
    }
}