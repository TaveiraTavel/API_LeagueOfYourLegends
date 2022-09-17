using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LeagueOfYourLegends_API.Models
{
    public class Champion
    {
        public int idChamp { get; set; }
        public string nomChamp { get; set; }
        public string keyChamp { get; set; }
        public PairSpells pairSpellsChamp { get; set; }
        public ConjRunes conjRunesChamp { get; set; }
        public Build buildChamp { get; set; }

        public Champion(int idChamp, string nomChamp, string keyChamp, List<Spell> spellsChamp)
        {
            
        }
    }
}
