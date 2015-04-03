using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Project.Model {
    public class User {
        public int id { set; get; }
        public string firstName { set; get; }
        public string lastName { set; get; }
        public string userID { set; get; }
        public string password { set; get; }
        public string email { set; get; }
        public string securityQuestion { set; get; }
        public string securityAnswer { set; get; }
        public string accountReason { set; get; }
        public string type { set; get; }
        public bool accountApproval { set; get; }

        public bool verifyUserID() {
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "SELECT * FROM UserAccount WHERE userID = @userID";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("userID", userID);
                SqlDataReader result = command.ExecuteReader();
                if (result.Read()) {
                    return false;
                }
            } catch (SqlException exception) {

            }
            return true;
        }
        public bool add() {
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "INSERT INTO UserAccount VALUES(@firstName, @lastName, @userID, @password, @email, @securityQuestion, @securityAnswer, @accountReason, @type, @approval)";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("firstName",firstName);
                command.Parameters.AddWithValue("lastName",lastName);
                command.Parameters.AddWithValue("userID",userID);
                command.Parameters.AddWithValue("password",password);
                command.Parameters.AddWithValue("email",email);
                command.Parameters.AddWithValue("securityQuestion",securityQuestion);
                command.Parameters.AddWithValue("securityAnswer",securityAnswer);
                command.Parameters.AddWithValue("accountReason",accountReason);
                command.Parameters.AddWithValue("type","user");
                command.Parameters.AddWithValue("approval","False");
                if (command.ExecuteNonQuery() == 1) {
                    return true;
                }
            } catch (SqlException exception) {
                
            }
            return false;
        }

        public bool update() {
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "UPDATE UserAccount SET firstName = @firstName, lastName = @lastName, password = @password, email = @email, securityQuestion = @securityQuestion, securityAnswer = @securityAnswer, accountReason = @accountReason, accountApproval = @approval WHERE userID = @userID";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("firstName", firstName);
                command.Parameters.AddWithValue("lastName", lastName);
                command.Parameters.AddWithValue("password", password);
                command.Parameters.AddWithValue("email", email);
                command.Parameters.AddWithValue("securityQuestion", securityQuestion);
                command.Parameters.AddWithValue("securityAnswer", securityAnswer);
                command.Parameters.AddWithValue("accountReason", accountReason);
                command.Parameters.AddWithValue("approval", accountApproval);
                command.Parameters.AddWithValue("userID", userID);
                if (command.ExecuteNonQuery() == 1) {
                    return true;
                }
            } catch (SqlException exception) {

            }
            return false;
        }

        public User login(string userID, string password) {
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "SELECT * FROM UserAccount WHERE userID = @userID AND password = @password AND accountApproval = @accountApproval";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("userID", userID);
                command.Parameters.AddWithValue("password", password);
                command.Parameters.AddWithValue("accountApproval", "True");
                SqlDataReader result = command.ExecuteReader();
                while (result.Read()) {
                    User u = new User();
                    u.id = Convert.ToInt32(result["id"].ToString());
                    u.firstName = result["firstName"].ToString();
                    u.lastName = result["lastName"].ToString();
                    u.userID = result["userID"].ToString();
                    u.password = result["password"].ToString();
                    u.email = result["email"].ToString();
                    u.securityQuestion = result["securityQuestion"].ToString();
                    u.securityAnswer = result["securityAnswer"].ToString();
                    u.accountReason = result["accountReason"].ToString();
                    u.type = result["type"].ToString();
                    u.accountApproval = true;
                    return u;
                }
            } catch (SqlException exception) {
                throw exception;
            }
            return null;
        }

        public bool approveAccount() {
            accountApproval = true;
            return update();
        }
    }
}