using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace FinalProject.Model {
    public class Document {
        public int id { set; get; }
        public string name { set; get; }
        public string link { set; get; }

        public bool add() {
            bool flag = false;
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "INSERT INTO Documents VALUES(@documentName, @documentLink); SELECT SCOPE_IDENTITY () As NewID;";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("documentName", this.name);
                command.Parameters.AddWithValue("documentLink", this.link);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows) {
                    reader.Read();
                    id = Convert.ToInt32(reader["NewID"]);
                    flag = true;
                }

                reader.Close();
            } catch (SqlException exception) {

            }
            return flag;
        }
    }
}
