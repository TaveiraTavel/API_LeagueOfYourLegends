using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace LeagueOfYourLegends_API.Models
{
    public class SecTree
    {
        public Tree treePrimTree { get; set; }
        public Rune rune1 { get; set; }
        public Rune rune2 { get; set; }

        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);
        MySqlCommand command = new MySqlCommand();

        public SecTree getSecTreeById(int idSecTree)
        {
            connection.Open();
            command.CommandText = "CALL spGetSecTreeById(@IdSecTree);";
                command.Parameters.Add("@IdSecTree", MySqlDbType.Int32).Value = idSecTree;
                command.Connection = connection;
            var readSecTree = command.ExecuteReader();
            var tempSecTree = new SecTree();

            if (readSecTree.Read())
            {
                tempSecTree.treePrimTree = new Tree().getTreeById(int.Parse(readSecTree["idTree"].ToString()));
                tempSecTree.rune1 = new Rune().getRuneById(int.Parse(readSecTree["idRunePrim"].ToString()));
                tempSecTree.rune2 = new Rune().getRuneById(int.Parse(readSecTree["idRuneSec"].ToString()));
            };

            readSecTree.Close();
            connection.Close();

            return tempSecTree;
        }
    }
}