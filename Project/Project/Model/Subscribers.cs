using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FinalProject.Model {
    public class Subscribers {
        public int id { set; get; }
        public string email { set; get; }

        public Subscribers() {
        }
        public Subscribers(string email) {
            this.email = email;
        }

        public void storeKeywords(List<String> keywords) {
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLSelect = "SELECT * FROM Keyword WHERE keyword = @keyword";
                string SQLString1 = "INSERT INTO Keyword VALUES(@keyword); SELECT SCOPE_IDENTITY () As NewID;";
                string SQLString2 = "INSERT INTO Subscribers VALUES(@keywordID, @email);";
                for (int i = 0; i < keywords.Count; i++) {
                    SqlCommand selectCommand = new SqlCommand(SQLSelect, dbConnection);
                    selectCommand.Parameters.AddWithValue("@keyword", keywords.ElementAt(i));

                    using (SqlDataReader selectReader = selectCommand.ExecuteReader()) {
                        if (selectReader.Read()) {
                            id = Convert.ToInt32(selectReader["id"]);
                            selectReader.Close();
                            selectCommand.Dispose();
                            using (SqlCommand command2 = new SqlCommand(SQLString2, dbConnection)) {
                                command2.Parameters.AddWithValue("@keywordID", id);
                                command2.Parameters.AddWithValue("@email", email);
                                command2.ExecuteNonQuery();
                                command2.Dispose();
                            }
                        } else {
                            selectReader.Close();
                            selectCommand.Dispose();
                            using (SqlCommand command1 = new SqlCommand(SQLString1, dbConnection)) {
                                command1.Parameters.AddWithValue("@keyword", keywords.ElementAt(i));
                                SqlDataReader reader = command1.ExecuteReader();
                                if (reader.Read()) {
                                    id = Convert.ToInt32(reader["NewID"]);
                                    reader.Close();
                                    command1.Dispose();
                                    using (SqlCommand command2 = new SqlCommand(SQLString2, dbConnection)) {
                                        command2.Parameters.AddWithValue("@keywordID", id);
                                        command2.Parameters.AddWithValue("@email", email);
                                        command2.ExecuteNonQuery();
                                        command2.Dispose();
                                    }
                                } else {
                                    command1.Dispose();
                                    reader.Close();
                                }
                            }
                        }
                    }
                }
                dbConnection.Close();
            } catch (SqlException exception) {

            }
        }
        public bool unsubscribe() {
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);

            try {
                dbConnection.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Subscribers WHERE email= @email ", dbConnection);
                cmd.Parameters.AddWithValue("@email", email);
                if (cmd.ExecuteNonQuery() > 0) {
                    return true;
                }
            } finally {
                dbConnection.Close();
            }
            return false;
        }
        public bool verifyEmail() {
            bool flag = true;
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "SELECT * FROM Subscribers WHERE email = @email";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("@email", email);
                SqlDataReader result = command.ExecuteReader();
                if (result.Read()) {
                    flag = false;
                }
                result.Close();
                dbConnection.Close();
            } catch (SqlException exception) {

            }
            return flag;
        }

        public void sendEmail() {

        }
    }
}