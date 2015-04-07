using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FinalProject.Model {
    public class Project {
        public int id { set; get; }
        public string name { set; get; }
        public User user { set; get; }
        public string courseNumber { set; get; }
        public string liveLink { set; get; }
        public string projectAbstract { set; get; }
        public string screencastLink { set; get; }
        public string semester { set; get; }
        public DateTime dateCreated { set; get; }
        public bool highlighted { set; get; }


       // public List<Submissions> subms { set; get; }
        public List<Committee> committes { set; get; }

        public List<String> keywords { set; get; }

        public int views { set; get; }
        public int downloads { set; get; }

        public Project() {
            committes = new List<Committee>();
            keywords = new List<string>();
        }

        public bool add() {
            bool flag = false;
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "INSERT INTO Project VALUES(@name, @student_id, @courseNumber, @liveLink, @abstract, @screencastLink, @semester, @dateCreated, 'False'); SELECT SCOPE_IDENTITY () As NewID;";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("name", name);
                command.Parameters.AddWithValue("student_id", user.id);
                command.Parameters.AddWithValue("courseNumber", courseNumber);
                command.Parameters.AddWithValue("liveLink", liveLink);
                command.Parameters.AddWithValue("abstract", projectAbstract);
                command.Parameters.AddWithValue("screencastLink", screencastLink);
                command.Parameters.AddWithValue("semester", semester);
                command.Parameters.AddWithValue("dateCreated", DateTime.Now);

                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows) {
                    reader.Read();
                    id = Convert.ToInt32(reader["NewID"]);
                    flag = true;
                    foreach(Committee committee in committes){
                        committee.project = this;
                        committee.add();
                    }
                }

                reader.Close();
            } catch (SqlException exception) {

            }
            return flag;
        }

        public void addCommittee(Committee c) {
            committes.Add(c);
        }
    }
}