using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace LeagueOfYourLegends_API.Models
{
    public class Situacional
    {
        public Item item1 { get; set; }
        public Item item2 { get; set; }
        public Item item3 { get; set; }

        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);
        MySqlCommand command = new MySqlCommand();

        public Situacional getSituacionalBuildById(int idBuildSituacional)
        {
            connection.Open();
            command.CommandText = "CALL spGetSituacionalBuildById(@IdBuildSituacional);";
                command.Parameters.Add("@IdBuildSituacional", MySqlDbType.Int32).Value = idBuildSituacional;
                command.Connection = connection;
            var readSituacional = command.ExecuteReader();
            var tempSituacional = new Situacional();

            if (readSituacional.Read())
            {
                tempSituacional.item1 = new Item().getItemById(int.Parse(readSituacional["idItem1"].ToString()));
                tempSituacional.item2 = new Item().getItemById(int.Parse(readSituacional["idItem2"].ToString()));
                if (readSituacional["idItem3"] != DBNull.Value)
                {
                    tempSituacional.item3 = new Item().getItemById(int.Parse(readSituacional["idItem3"].ToString()));
                }
            };

            readSituacional.Close();
            connection.Close();

            return tempSituacional;
        }
    }
}