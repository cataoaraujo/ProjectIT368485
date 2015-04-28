using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace FinalProject.Model {
    public class Committee {
        public int id { set; get; }
        public Project project { set; get; }
        public string name { set; get; }
        public string email { set; get; }
        public string type { set; get; }

        public string comment { set; get; }
        public string hasApproved { set; get; }


        public Committee() {

        }
        public Committee(string name, string email, string type) {
            this.name = name;
            this.email = email;
            this.type = type;
        }

        public bool add() {
            bool flag = false;
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "INSERT INTO Committee VALUES(@project_id, @committeeName, @committeeEmail, @type); SELECT SCOPE_IDENTITY () As NewID;";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("project_id", project.id);
                command.Parameters.AddWithValue("committeeName", name);
                command.Parameters.AddWithValue("committeeEmail", email);
                command.Parameters.AddWithValue("type", type);

                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows) {
                    reader.Read();
                    id = Convert.ToInt32(reader["NewID"]);
                    flag = true;
                }

                reader.Close();
                dbConnection.Close();
            } catch (SqlException exception) {

            }
            return flag;
        }
    }
}
