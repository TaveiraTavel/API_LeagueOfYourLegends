using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace LeagueOfYourLegends_API.Models
{
    public class Build
    {
        public Inicial inicialBuild { get; set; }
        public Geral geralBuild { get; set; }
        public Situacional situacionalBuild { get; set; }

        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);
        MySqlCommand command = new MySqlCommand();

        public Build getBuildByChampionKey(string keyChampion)
        {
            connection.Open();
            command.CommandText = "CALL spGetBuildByChampionKey(@KeyChampion);";
                command.Parameters.Add("@KeyChampion", MySqlDbType.VarChar).Value = keyChampion;
                command.Connection = connection;
            var readBuild = command.ExecuteReader();
            var tempBuild = new Build();

            if (readBuild.Read())
            {
                tempBuild.inicialBuild = new Inicial().getInicialBuildById(int.Parse(readBuild["idBuildInicial"].ToString()));
                tempBuild.geralBuild = new Geral().getGeralBuildById(int.Parse(readBuild["idBuildGeral"].ToString()));
                tempBuild.situacionalBuild = new Situacional().getSituacionalBuildById(int.Parse(readBuild["idBuildSituacional"].ToString()));
            };

            readBuild.Close();
            connection.Close();

            return tempBuild;
        }
    }
}