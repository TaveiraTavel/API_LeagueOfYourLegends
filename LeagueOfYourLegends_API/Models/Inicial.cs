using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace LeagueOfYourLegends_API.Models
{
    public class Inicial
    {
        public Item item1 { get; set; }
        public Item item2 { get; set; }
        public Item item3 { get; set; }

        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);
        MySqlCommand command = new MySqlCommand();

        public Inicial getInicialBuildById(int idBuildInicial)
        {
            connection.Open();
            command.CommandText = "CALL spGetInicialBuildById(@IdBuildInicial);";
                command.Parameters.Add("@IdBuildInicial", MySqlDbType.Int32).Value = idBuildInicial;
                command.Connection = connection;
            var readInicial = command.ExecuteReader();
            var tempInicial = new Inicial();

            if (readInicial.Read())
            {
                tempInicial.item1 = new Item().getItemById(int.Parse(readInicial["idItem1"].ToString()));
                if (readInicial["idItem2"] != DBNull.Value)
                {
                    tempInicial.item2 = new Item().getItemById(int.Parse(readInicial["idItem2"].ToString()));
                }
                if (readInicial["idItem3"] != DBNull.Value)
                {
                    tempInicial.item3 = new Item().getItemById(int.Parse(readInicial["idItem3"].ToString()));
                }
            };

            readInicial.Close();
            connection.Close();

            return tempInicial;
        }
    }
}