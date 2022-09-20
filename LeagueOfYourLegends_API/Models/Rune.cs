using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace LeagueOfYourLegends_API.Models
{
    public class Rune
    {
        public string nomRune { get; set; }
        public string keyRune { get; set; }
        public string imgRune { get; set; }

        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);
        MySqlCommand command = new MySqlCommand();

        public Rune getRuneById(int idRune)
        {
            connection.Open();
            command.CommandText = "CALL spGetRuneById(@IdRune);";
                command.Parameters.Add("@IdRune", MySqlDbType.Int32).Value = idRune;
                command.Connection = connection;
            var readRune = command.ExecuteReader();
            var tempRune = new Rune();

            if (readRune.Read())
            {
                tempRune.nomRune = readRune["nomRune"].ToString();
                tempRune.keyRune = readRune["keyRune"].ToString();
                tempRune.imgRune = readRune["imgRune"].ToString();
            };

            readRune.Close();
            connection.Close();

            return tempRune;
        }
    }
}