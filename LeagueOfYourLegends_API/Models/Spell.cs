using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LeagueOfYourLegends_API.Models
{
    public class Spell
    {
        public string nomSpell { get; set; }
        public string keySpell { get; set; }
        public string imgSpell { get; set; }

        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);
        MySqlCommand command = new MySqlCommand();

        public Spell getSpellByKey(string keySpell)
        {
            connection.Open();
            command.CommandText = "CALL spGetSpellByKey(@KeySpell);";
                command.Parameters.Add("@KeySpell", MySqlDbType.VarChar).Value = keySpell;
                command.Connection = connection;
            var readSpell = command.ExecuteReader();
            var tempSpell = new Spell();

            if (readSpell.Read())
            {
                tempSpell.nomSpell = readSpell["nomSpell"].ToString();
                tempSpell.keySpell = readSpell["keySpell"].ToString();
                tempSpell.imgSpell = readSpell["imgSpell"].ToString();
            };

            readSpell.Close();
            connection.Close();

            return tempSpell;
        }
    }
}