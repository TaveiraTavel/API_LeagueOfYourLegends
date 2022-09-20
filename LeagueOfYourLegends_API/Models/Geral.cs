using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace LeagueOfYourLegends_API.Models
{
    public class Geral
    {
        public Item item1 { get; set; }
        public Item item2 { get; set; }
        public Item item3 { get; set; }
        public Item item4 { get; set; }
        public Item item5 { get; set; }
        public Item item6 { get; set; }

        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);
        MySqlCommand command = new MySqlCommand();

        public Geral getGeralBuildById(int idBuildGeral)
        {
            connection.Open();
            command.CommandText = "CALL spGetGeralBuildById(@IdBuildGeral);";
                command.Parameters.Add("@IdBuildGeral", MySqlDbType.Int32).Value = idBuildGeral;
                command.Connection = connection;
            var readGeral = command.ExecuteReader();
            var tempGeral = new Geral();

            if (readGeral.Read())
            {
                tempGeral.item1 = new Item().getItemById(int.Parse(readGeral["idItem1"].ToString()));
                tempGeral.item2 = new Item().getItemById(int.Parse(readGeral["idItem2"].ToString()));
                tempGeral.item3 = new Item().getItemById(int.Parse(readGeral["idItem3"].ToString()));
                tempGeral.item4 = new Item().getItemById(int.Parse(readGeral["idItem4"].ToString()));
                tempGeral.item5 = new Item().getItemById(int.Parse(readGeral["idItem5"].ToString()));
                tempGeral.item6 = new Item().getItemById(int.Parse(readGeral["idItem6"].ToString()));
            };

            readGeral.Close();
            connection.Close();

            return tempGeral;
        }
    }
}