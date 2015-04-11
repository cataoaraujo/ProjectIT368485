using FinalProject.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject {
    public partial class Options : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (Session["user"] == null) {
                Response.Redirect("Login.aspx");
            }else{
                User u = (User)Session["user"];

                ProjectList.DataSource = u.getProjects();
                ProjectList.DataBind();
            }
        }

        public String preliminaryStatus(int projectID) {
            Project p = new Project();
            p.id = projectID;
            switch(p.preliminaryStatus()){
                case Project.Situation.Available:
                    return "<a href='SubmissionPreliminary.aspx?id="+projectID+"'>Submit now!</a>";
                case Project.Situation.Submitted:
                    return "<a href='CheckStatus.aspx?id=" + projectID + "&type=preliminary'>Check Status</a>";
                case Project.Situation.Done:
                    return "You are done!";
                default:
                    return "Not Available!";
            }
           
        }

        public String finalStatus(int projectID) {
            Project p = new Project();
            p.id = projectID;
            switch (p.finalStatus()) {
                case Project.Situation.Available:
                    return "<a href='SubmissionFinal.aspx?id=" + projectID + "'>Submit now!</a>";
                case Project.Situation.Submitted:
                    return "<a href='CheckStatus.aspx?id=" + projectID + "&type=final'>Check Status</a>";
                case Project.Situation.Done:
                    return "You are done!";
                default:
                    return "Not Available!";
            }
            
        }

        public String presentationStatus(int projectID) {
            Project p = new Project();
            p.id = projectID;
            switch (p.presentationStatus()) {
                case Project.Situation.Available:
                    return "<a href='SubmissionPresentation.aspx?id=" + projectID + "'>Submit now!</a>";
                case Project.Situation.Submitted:
                    return "<a href='CheckStatus.aspx?id=" + projectID + "&type=presentation'>Check Status</a>";
                case Project.Situation.Done:
                    return "You are done!";
                default:
                    return "Not Available!";
            }
        }

    }
}