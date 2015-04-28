using FinalProject.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject {
    public partial class ProjectDetail : System.Web.UI.Page {
        Project project;
        protected void Page_Load(object sender, EventArgs e) {
            if (Session["user"] == null) {
                Response.Redirect("Login.aspx");
            } else {
                
                int projectID = Convert.ToInt32(Request.QueryString["id"]);
                project = Project.findById(projectID);
                if (projectID == 0) {
                    Response.Redirect("Default.aspx");
                }
                DocumentList.DataSource = project.findDocuments();
                DocumentList.DataBind();
            }
        }
    }
}