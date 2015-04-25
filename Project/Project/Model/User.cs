using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FinalProject.Model {
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

        public List<Project> projects { set; get; }
        public User() {
            projects = new List<Project>();
        }

        public static User findById(int id) {
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "SELECT * FROM UserAccount WHERE id = @id";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("id", id);
                SqlDataReader result = command.ExecuteReader();
                while (result.Read()) {
                    User u = new User();
                    u.id = Convert.ToInt32(result["id"].ToString());
                    u.firstName = result["firstName"].ToString();
                    u.lastName = result["lastName"].ToString();
                    u.userID = result["userID"].ToString();
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
        public bool projectIsMine(int projectID) {
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "SELECT * FROM Project WHERE id = @projectID AND student_id = @student_id";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("projectID", projectID);
                command.Parameters.AddWithValue("student_id", id);
                SqlDataReader result = command.ExecuteReader();
                if (result.Read()) {
                    return true;
                }
            } catch (SqlException exception) {

            }
            return false;
        }

        public List<Project> getProjects() {
            projects = new List<Project>();
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "SELECT * FROM Project WHERE student_id = @student_id";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("student_id", id);
                SqlDataReader result = command.ExecuteReader();
                while (result.Read()) {
                    Project p = new Project();
                    p.id = Convert.ToInt32(result["id"].ToString());
                    p.name = result["name"].ToString();
                    p.user = this;
                    p.courseNumber = result["courseNumber"].ToString();
                    p.liveLink = result["liveLink"].ToString();
                    p.projectAbstract = result["abstract"].ToString();
                    p.screencastLink = result["screencastLink"].ToString();
                    p.semester = result["semester"].ToString();
                    p.dateCreated = Convert.ToDateTime(result["dateCreated"].ToString());
                    p.highlighted = Convert.ToBoolean(result["highlighted"]);
                    string date = result["presentationDate"].ToString();
                    if (result.IsDBNull(9)) {
                        p.presentationDate = Convert.ToDateTime(date);
                    }
                    p.presentationPlace = result["presentationPlace"].ToString();
                    projects.Add(p);
                }
            } catch (SqlException exception) {

            }
            return projects;
        }

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
            bool flag = false;
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "INSERT INTO UserAccount VALUES(@firstName, @lastName, @userID, @password, @email, @securityQuestion, @securityAnswer, @accountReason, @type, @approval); SELECT SCOPE_IDENTITY () As NewID;";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("firstName", firstName);
                command.Parameters.AddWithValue("lastName", lastName);
                command.Parameters.AddWithValue("userID", userID);
                command.Parameters.AddWithValue("password", password);
                command.Parameters.AddWithValue("email", email);
                command.Parameters.AddWithValue("securityQuestion", securityQuestion);
                command.Parameters.AddWithValue("securityAnswer", securityAnswer);
                command.Parameters.AddWithValue("accountReason", accountReason);
                command.Parameters.AddWithValue("type", "user");
                command.Parameters.AddWithValue("approval", "False");
                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows) {
                    reader.Read();
                    id = Convert.ToInt32(reader["NewID"]);
                    flag = true;
                };

                reader.Close();
            } catch (SqlException exception) {

            }
            return flag;
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

        public bool approveAccount(string userID) {
            string sqlString = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(sqlString);

            string SQLString = "UPDATE UserAccount SET accountApproval ='True' WHERE userID = @userID";
            SqlCommand command = new SqlCommand(SQLString, dbConnection);
            command.Parameters.AddWithValue("@userID", userID);
            try {
                dbConnection.Open();

                if (command.ExecuteNonQuery() == 1) {
                    return true;
                }
            } catch (SqlException exception) {

            }
            return false;
        }

        public bool verifyUserID(String userID) {
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "SELECT * FROM UserAccount WHERE userID = @userID";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("userID", userID);
                SqlDataReader result = command.ExecuteReader();
                if (result.Read()) {
                    return true;
                }
            } catch (SqlException exception) {

            }
            return false;
        }

        public string getQuestion(String userID) {
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "SELECT securityQuestion FROM UserAccount WHERE userID = @userID";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("userID", userID);
                SqlDataReader result = command.ExecuteReader();
                if (result.Read()) {
                    return result[0].ToString();
                }
            } catch (SqlException exception) {

            }
            return null;
        }

        public bool checkAnswer(String userID, String securityAnswer) {
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "SELECT * FROM UserAccount WHERE userID = @userID and securityAnswer = @securityAnswer ";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("userID", userID);
                command.Parameters.AddWithValue("securityAnswer", securityAnswer);
                SqlDataReader result = command.ExecuteReader();
                if (result.Read()) {
                    return true;
                }
            } catch (SqlException exception) {

            }
            return false;
        }

        public bool updatePwd(String userID, String password) {
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            bool updated = false;
            try {
                dbConnection.Open();
                string SQLString = "Update UserAccount set password = @password where userID=@userID ";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("userID", userID);
                command.Parameters.AddWithValue("password", password);
                SqlDataReader result = command.ExecuteReader();
                if (result.Read()) {
                    updated = true;
                }

            } catch (SqlException exception) {

            }
            return true;
        }
    }
}
