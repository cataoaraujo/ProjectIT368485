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

        public List<Document> documents { set; get; }

        public int views { set; get; }
        public int downloads { set; get; }

        public enum Situation {
            Available,
            Submitted,
            NotAvailable,
            Done
        }

        public Project() {
            committes = new List<Committee>();
            keywords = new List<string>();
        }

        public void addKeyword(string k) {
            keywords.Add(k);
        }

        public void addCommittee(Committee c) {
            committes.Add(c);
        }

        public List<Document> findDocuments() {
            documents = new List<Document>();
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "SELECT Documents.id, Documents.documentName, Documents.documentLink FROM Documents, ProjectSubmission WHERE project_id = @project_id AND Documents.id = ProjectSubmission.document_id";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("project_id", id);
                SqlDataReader result = command.ExecuteReader();
                while (result.Read()) {
                    Document d = new Document();
                    d.id = Convert.ToInt32(result["id"].ToString());
                    d.name = result["documentName"].ToString();
                    d.link = result["documentLink"].ToString();
                    documents.Add(d);
                }
            } catch (SqlException exception) {

            }
            return documents;
        }



        public Situation preliminaryStatus() {
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "SELECT * FROM ProjectSubmission WHERE project_id = @project_id AND type = @type";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("project_id", id);
                command.Parameters.AddWithValue("type", Submissions.Type.PreliminaryProposal.ToString());
                SqlDataReader result = command.ExecuteReader();
                if (result.Read()) {
                    if (Convert.ToBoolean(result["approved"])) {
                        return Situation.Done;
                    } else {
                        return Situation.Submitted;
                    }
                }
            } catch (SqlException exception) {

            }
            return Situation.Available;
        }

        public Situation finalStatus() {
            if (preliminaryStatus().Equals(Situation.Done)) {
                string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
                SqlConnection dbConnection = new SqlConnection(conf);
                try {
                    dbConnection.Open();
                    string SQLString = "SELECT * FROM ProjectSubmission WHERE project_id = @project_id AND type = @type";
                    SqlCommand command = new SqlCommand(SQLString, dbConnection);
                    command.Parameters.AddWithValue("project_id", id);
                    command.Parameters.AddWithValue("type", Submissions.Type.Final.ToString());
                    SqlDataReader result = command.ExecuteReader();
                    if (result.Read()) {
                        if (Convert.ToBoolean(result["approved"])) {
                            return Situation.Done;
                        } else {
                            return Situation.Submitted;
                        }
                    }
                } catch (SqlException exception) {

                }
                return Situation.Available;
            }
            return Situation.NotAvailable;
        }

        public Situation presentationStatus() {
            if (finalStatus().Equals(Situation.Done)) {
                string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
                SqlConnection dbConnection = new SqlConnection(conf);
                try {
                    dbConnection.Open();
                    string SQLString = "SELECT * FROM ProjectSubmission WHERE project_id = @project_id AND type = @type";
                    SqlCommand command = new SqlCommand(SQLString, dbConnection);
                    command.Parameters.AddWithValue("project_id", id);
                    command.Parameters.AddWithValue("type", Submissions.Type.PresentationScheduling.ToString());
                    SqlDataReader result = command.ExecuteReader();
                    if (result.Read()) {
                        if (Convert.ToBoolean(result["approved"])) {
                            return Situation.Done;
                        } else {
                            return Situation.Submitted;
                        }
                    }
                } catch (SqlException exception) {

                }
                return Situation.Available;
            }
            return Situation.NotAvailable;
        }

        

        public static Project findById(int id) {
            Project p = null;
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "SELECT * FROM Project WHERE id = @id";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("id", id);
                SqlDataReader result = command.ExecuteReader();
                if (result.Read()) {
                    p = new Project();
                    p.id = Convert.ToInt32(result["id"].ToString());
                    p.name = result["name"].ToString();
                    //p.user = User.;
                    p.courseNumber = result["courseNumber"].ToString();
                    p.liveLink = result["liveLink"].ToString();
                    p.projectAbstract = result["abstract"].ToString();
                    p.screencastLink = result["screencastLink"].ToString();
                    p.semester = result["semester"].ToString();
                    p.dateCreated = Convert.ToDateTime(result["dateCreated"].ToString());
                    p.highlighted = Convert.ToBoolean(result["highlighted"]);
                }
            } catch (SqlException exception) {

            }
            return p;
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
                    foreach (Committee committee in committes) {
                        committee.project = this;
                        committee.add();
                    }
                    addKeywordDB();
                }

                reader.Close();
            } catch (SqlException exception) {

            }
            return flag;
        }

        private int findKeywordID(string key) {
            int keywordID = -1;
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLSelect = "SELECT * FROM Keyword WHERE keyword = @keyword";
                SqlCommand selectCommand = new SqlCommand(SQLSelect, dbConnection);
                selectCommand.Parameters.AddWithValue("@keyword", key);
                SqlDataReader selectReader = selectCommand.ExecuteReader();
                if (selectReader.Read()) {
                    keywordID = Convert.ToInt32(selectReader["id"]);
                }
                selectReader.Close();
                selectCommand.Dispose();
            } catch (SqlException exception) {

            }
            return keywordID;
        }

        private int createKeyword(string key) {
            int keywordID = -1;
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLInsertKeyword = "INSERT INTO Keyword VALUES(@keyword); SELECT SCOPE_IDENTITY () As NewID;";
                SqlCommand insertCommand = new SqlCommand(SQLInsertKeyword, dbConnection);
                insertCommand.Parameters.AddWithValue("@keyword", key);
                SqlDataReader selectReader = insertCommand.ExecuteReader();
                if (selectReader.Read()) {
                    keywordID = Convert.ToInt32(selectReader["NewID"]);
                }
                selectReader.Close();
                insertCommand.Dispose();
            } catch (SqlException exception) {

            }
            return keywordID;
        }

        private void addKeywordDB() {
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();

                string SQLInsertProjectKeywords = "INSERT INTO ProjectKeywords VALUES(@keywordID, @projectID);";
                foreach (String keyword in keywords) {
                    int keywordID = findKeywordID(keyword);
                    if (keywordID == -1) {//If there is no keyword in the Database
                        keywordID = createKeyword(keyword);
                    }
                    SqlCommand insertProjectKeywordCommand = new SqlCommand(SQLInsertProjectKeywords, dbConnection);
                    insertProjectKeywordCommand.Parameters.AddWithValue("@keywordID", keywordID);
                    insertProjectKeywordCommand.Parameters.AddWithValue("@projectID", id);
                    insertProjectKeywordCommand.ExecuteNonQuery();
                    insertProjectKeywordCommand.Dispose();
                }
            } catch (SqlException exception) {

            }
        }


    }
}