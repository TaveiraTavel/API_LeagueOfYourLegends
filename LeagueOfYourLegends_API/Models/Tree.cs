using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace LeagueOfYourLegends_API.Models
{
    public class Tree
    {
        public string nomTree { get; set; }
        public string keyTree { get; set; }

        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);
        MySqlCommand command = new MySqlCommand();

        public Tree getTreeById(int idTree)
        {
            connection.Open();
            command.CommandText = "CALL spGetTreeById(@IdTree);";
                command.Parameters.Add("@IdTree", MySqlDbType.Int32).Value = idTree;
                command.Connection = connection;
            var readTree = command.ExecuteReader();
            var tempTree = new Tree();

            if (readTree.Read())
            {
                tempTree.nomTree = readTree["nomTree"].ToString();
                tempTree.keyTree = readTree["keyTree"].ToString();
            };

            readTree.Close();
            connection.Close();

            return tempTree;
        }
    }
}