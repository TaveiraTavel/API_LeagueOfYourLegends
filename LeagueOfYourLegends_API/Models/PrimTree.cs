using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace LeagueOfYourLegends_API.Models
{
    public class PrimTree
    {
        public Tree treePrimTree { get; set; }
        public Rune rune1 { get; set; }
        public Rune rune2 { get; set; }
        public Rune rune3 { get; set; }
        public Rune rune4 { get; set; }

        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);
        MySqlCommand command = new MySqlCommand();

        public PrimTree getPrimTreeById(int idPrimTree)
        {
            connection.Open();
            command.CommandText = "CALL spGetPrimTreeById(@IdPrimTree);";
                command.Parameters.Add("@IdPrimTree", MySqlDbType.Int32).Value = idPrimTree;
                command.Connection = connection;
            var readPrimTree = command.ExecuteReader();
            var tempPrimTree = new PrimTree();

            if (readPrimTree.Read())
            {
                tempPrimTree.treePrimTree = new Tree().getTreeById(int.Parse(readPrimTree["idTree"].ToString()));
                tempPrimTree.rune1 = new Rune().getRuneById(int.Parse(readPrimTree["idRunePrincipal"].ToString()));
                tempPrimTree.rune2 = new Rune().getRuneById(int.Parse(readPrimTree["idRunePrim"].ToString()));
                tempPrimTree.rune3 = new Rune().getRuneById(int.Parse(readPrimTree["idRuneSec"].ToString()));
                tempPrimTree.rune4 = new Rune().getRuneById(int.Parse(readPrimTree["idRuneTerc"].ToString()));
            };

            readPrimTree.Close();
            connection.Close();

            return tempPrimTree;
        }
    }
}