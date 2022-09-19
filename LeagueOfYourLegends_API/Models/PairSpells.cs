using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace LeagueOfYourLegends_API.Models
{
    public class PairSpells
    {
        public Spell spell1 { get; set; }
        public Spell spell2 { get; set; }

        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);
        MySqlCommand command = new MySqlCommand();

        public PairSpells getPairSpellByChampionKey(string keyChampion)
        {
            connection.Open();
            command.CommandText = "CALL spGetPairSpellByChampionKey(@KeyChampion);";
                command.Parameters.Add("@KeyChampion", MySqlDbType.VarChar).Value = keyChampion;
                command.Connection = connection;
            var readPairSpell = command.ExecuteReader();
            var tempPairSpell = new PairSpells();
            
            if (readPairSpell.Read())
            {
                tempPairSpell.spell1 = new Spell().getSpellByKey(readPairSpell["keySpell1"].ToString());
                tempPairSpell.spell2 = new Spell().getSpellByKey(readPairSpell["keySpell2"].ToString());
            };

            readPairSpell.Close();
            connection.Close();

            return tempPairSpell;
        }
    }
}