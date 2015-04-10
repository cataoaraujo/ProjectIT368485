using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FinalProject.Model
{
    public class Subscribers
    {
        public int id { set; get; }
        public string email { set; get; }

        public void storeKeywords(List<String> keywords)
        {
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try
            {
                dbConnection.Open();
                string SQLString1 = "INSERT INTO Keyword VALUES(@keyword); SELECT SCOPE_IDENTITY () As NewID;";
                string SQLString2 = "INSERT INTO Subscribers VALUES(@keywordID, @email);";
                SqlCommand command1 = new SqlCommand(SQLString1, dbConnection);
                SqlCommand command2 = new SqlCommand(SQLString2, dbConnection);


                SqlDataReader reader = command1.ExecuteReader();

                if (reader.Read())
                {

                    for (int i = 0; i < keywords.Count; i++)
                    {
                        id = Convert.ToInt32(reader["NewID"]);
                        command1.Parameters.AddWithValue("@keyword", keywords.ElementAt(i));
                        command2.Parameters.AddWithValue("@keywordID", id);
                        command2.Parameters.AddWithValue("@email", email);

                        
                    }
                    command1.ExecuteNonQuery();
                    command2.ExecuteNonQuery();

                }

                reader.Close();
            }
            catch (SqlException exception)
            {

            }
        }

        public bool verifyEmail()
        {
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try
            {
                dbConnection.Open();
                string SQLString = "SELECT * FROM Subscribers WHERE email = @email";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("@email", email);
                SqlDataReader result = command.ExecuteReader();
                if (result.Read())
                {
                    return false;
                }
            }
            catch (SqlException exception)
            {

            }
            return true;
        }

        public void sendEmail()
        {

        }
    }
}