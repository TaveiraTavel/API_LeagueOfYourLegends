using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace LeagueOfYourLegends_API.Models
{
    public class Champion
    {
        public string nomChamp { get; set; }
        public string keyChamp { get; set; }
        public PairSpells pairSpellsChamp { get; set; }
        public ConjRunes conjRunesChamp { get; set; }
        public Build buildChamp { get; set; }

        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);
        MySqlCommand command = new MySqlCommand();

        public Champion getChampionByKey(string keyChampion)
        {
            connection.Open();
            command.CommandText = "CALL spGetChampionByKey(@KeyChampion);";
                command.Parameters.Add("@KeyChampion", MySqlDbType.VarChar).Value = keyChampion;
                command.Connection = connection;
            var readChampion = command.ExecuteReader();
            var tempChamp = new Champion();

            if (readChampion.Read())
            {
                tempChamp.nomChamp = readChampion["nomChampion"].ToString();
                tempChamp.keyChamp = readChampion["keyChampion"].ToString();
                tempChamp.pairSpellsChamp = new PairSpells().getPairSpellByChampionKey(keyChampion);
                tempChamp.conjRunesChamp = new ConjRunes().getConjRunesByChampionKey(keyChampion);
            }

            readChampion.Close();
            connection.Close();

            return tempChamp;
        }
    }
}
