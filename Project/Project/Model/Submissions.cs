﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;

namespace FinalProject.Model {
    public class Submissions {
        public int id { set; get; }
        public Project project { set; get; }
        public Document document { set; get; }
        public Type type { set; get; }
        public bool approved { set; get; }
        public DateTime dateSubmitted { set; get; }

        public enum Type {
            PreliminaryProposal,
            Final,
            PresentationScheduling
        }
        public static List<Committee> getCommitteeComments(int projectID, Type type) {
            List<Committee> committeeComments = new List<Committee>();
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "SELECT committeeName, committeeEmail, Committee.type as TYPE, committeeComment, Approval.approved as APPROVAL "+
                    "FROM Approval, Committee, ProjectSubmission  "+
                    "WHERE Approval.committee_id = Committee.commitee_id  AND Approval.submission_id = ProjectSubmission.submission_id AND ProjectSubmission.project_id = @project_id AND Committee.project_id = @project_id AND ProjectSubmission.type = @type";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("project_id", projectID);
                command.Parameters.AddWithValue("type", type.ToString());
                SqlDataReader result = command.ExecuteReader();
                while (result.Read()) {
                    Committee d = new Committee();
                    //d.id = Convert.ToInt32(result["Committee.commitee_id"]);
                    d.name = result["committeeName"].ToString();
                    d.email = result["committeeEmail"].ToString();
                    d.type = result["TYPE"].ToString();
                    d.comment = result["committeeComment"].ToString();
                    d.hasApproved = result["APPROVAL"].ToString();
                    committeeComments.Add(d);
                }
                result.Close();
                dbConnection.Close();
            } catch (SqlException exception) {

            }
            return committeeComments;
        }

        public static List<Committee> findCommittee(int projectID) {
            List<Committee> committee = new List<Committee>();
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "SELECT * " +
                    "FROM Committee " +
                    "WHERE project_id = @project_id";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("project_id", projectID);
                SqlDataReader result = command.ExecuteReader();
                while (result.Read()) {
                    Committee d = new Committee();
                    d.id = Convert.ToInt32(result["commitee_id"].ToString());
                    d.name = result["committeeName"].ToString();
                    d.email = result["committeeEmail"].ToString();
                    committee.Add(d);
                }
                result.Close();
                dbConnection.Close();
            } catch (SqlException exception) {

            }
            return committee;
        }

        public static bool approvalIsValid(int committeeID, int submissionID) {
            bool flag = false;
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "SELECT * FROM ProjectSubmission, Committee WHERE Committee.project_id = ProjectSubmission.project_id AND submission_id = @submission_id AND commitee_id = @committee_id";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("submission_id", submissionID);
                command.Parameters.AddWithValue("committee_id", committeeID);
                SqlDataReader result = command.ExecuteReader();
                if (result.Read()) {
                    flag = true;
                }
                result.Close();
                dbConnection.Close();
            } catch (SqlException exception) {

            }
            return flag;
        }
        public static bool isAdvisor(int committeeID, int submissionID) {
            bool flag = false;
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "SELECT * FROM Committee, ProjectSubmission WHERE ProjectSubmission.submission_id = @submission_id AND Committee.commitee_id = @committee_id AND Committee.project_id = ProjectSubmission.project_id AND Committee.type = 'Advisor'";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("submission_id", submissionID);
                command.Parameters.AddWithValue("committee_id", committeeID);
                SqlDataReader result = command.ExecuteReader();
                if (result.Read()) {
                    flag = true;
                }
                result.Close();
                dbConnection.Close();
            } catch (SqlException exception) {

            }
            return flag;
        }
        public static bool committeeApproval(int committeeID, int submissionID, bool approval, string comment="") {
            if (isAdvisor(committeeID, submissionID)) {
                updateSubmissionStatus(submissionID);
            }
            bool flag = false;
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "INSERT INTO Approval VALUES(@submission_id, @commmittee_id, @approved, @comment)";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("submission_id", submissionID);
                command.Parameters.AddWithValue("commmittee_id", committeeID);
                command.Parameters.AddWithValue("approved", approval);
                command.Parameters.AddWithValue("comment", comment);
                if (command.ExecuteNonQuery()>0) {
                    flag = true;
                }
                dbConnection.Close();
            } catch (SqlException exception) {

            }
            return flag;
        }

        public static bool updateSubmissionStatus(int submissionID) {
            bool flag = false;
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "UPDATE ProjectSubmission SET approved = 'True' WHERE submission_id = @submission_id";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("submission_id", submissionID);

                if (command.ExecuteNonQuery() > 0) {
                    flag = true;
                }

                dbConnection.Close();
            } catch (SqlException exception) {

            }
            return flag;
        }

        public bool submit() {
            bool flag = false;
            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conf);
            try {
                dbConnection.Open();
                string SQLString = "INSERT INTO ProjectSubmission VALUES(@project_id, @document_id, @type, @approved, @dateSubmitted); SELECT SCOPE_IDENTITY () As NewID;";
                SqlCommand command = new SqlCommand(SQLString, dbConnection);
                command.Parameters.AddWithValue("project_id", this.project.id);
                command.Parameters.AddWithValue("document_id", this.document.id);
                command.Parameters.AddWithValue("type", this.type.ToString());
                command.Parameters.AddWithValue("approved", "False");
                command.Parameters.AddWithValue("dateSubmitted", DateTime.Now);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows) {
                    reader.Read();
                    id = Convert.ToInt32(reader["NewID"]);
                    flag = true;
                }

                reader.Close();
                dbConnection.Close();
                sendEmailApproval();
            } catch (SqlException exception) {

            }
            return flag;
        }

        public bool sendEmailApproval() {
            bool flag = false;
            List<Committee> committees = Submissions.findCommittee(project.id);
            foreach (Committee c in committees) {
                sendEmail(this.project, this, c);
            }

            return flag;
        }

        private bool sendEmail(Project project, Submissions submission, Committee c) {
            try {
                MailMessage emailMessage = new MailMessage();
                emailMessage.From = new MailAddress("rcataoa@ilstu.edu", "Project IT368");
                emailMessage.To.Add(new MailAddress(c.email));
                emailMessage.Subject = "You are requested to Approve the Project: "+project.name;
                emailMessage.IsBodyHtml = true;

                string message = "Link to the project: http://iis.it.ilstu.edu/485spr15/it4850126/App1/Viewprojectdetails.aspx?PrjId=" + project.id + "<br /><br />";
                message += "Link to approve the project: http://iis.it.ilstu.edu/485spr15/it4850126/App1/Approval.aspx?cID=" + c.id + "&sID=" + submission.id + " <br />";
                emailMessage.Body = message;


                SmtpClient mailClient = new SmtpClient("smtp.ilstu.edu");
                mailClient.UseDefaultCredentials = true;// false;
                mailClient.Send(emailMessage);
            } catch (Exception e) {
                return false;
            }
            return true;
        }

    }
}
