using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace LeagueOfYourLegends_API.Models
{
    public class Item
    {
        public string nomItem { get; set; }
        public string keyItem { get; set; }
        public string imgItem { get; set; }

        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);
        MySqlCommand command = new MySqlCommand();

        public Item getItemById(int idItem)
        {
            connection.Open();
            command.CommandText = "CALL spGetItemById(@IdItem);";
                command.Parameters.Add("@IdItem", MySqlDbType.Int32).Value = idItem;
                command.Connection = connection;
            var readItem = command.ExecuteReader();
            var tempItem = new Item();

            if (readItem.Read())
            {
                tempItem.nomItem = readItem["nomItem"].ToString();
                tempItem.keyItem = readItem["keyItem"].ToString();
                tempItem.imgItem = readItem["imgItem"].ToString();
            };

            readItem.Close();
            connection.Close();

            return tempItem;
        }
    }
}