using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace LeagueOfYourLegends_API.Models
{
    public class ConjRunes
    {
        public PrimTree primTreeConj { get; set; }
        public SecTree secTreeConj { get; set; }

        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);
        MySqlCommand command = new MySqlCommand();

        public ConjRunes getConjRunesByChampionKey(string keyChampion)
        {
            connection.Open();
            command.CommandText = "CALL spGetConjRunesByChampionKey(@KeyChampion);";
                command.Parameters.Add("@KeyChampion", MySqlDbType.VarChar).Value = keyChampion;
                command.Connection = connection;
            var readConjRunes = command.ExecuteReader();
            var tempConjRunes = new ConjRunes();

            if (readConjRunes.Read())
            {
                tempConjRunes.primTreeConj = new PrimTree().getPrimTreeById(int.Parse(readConjRunes["idPrimTree"].ToString()));
                tempConjRunes.secTreeConj = new SecTree().getSecTreeById(int.Parse(readConjRunes["idSecTree"].ToString()));
            };

            readConjRunes.Close();
            connection.Close();

            return tempConjRunes;
        }
    }
}