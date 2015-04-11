using FinalProject.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject {
    public partial class CheckStatus : System.Web.UI.Page {
        Project project;
        protected void Page_Load(object sender, EventArgs e) {
            if (Session["user"] == null) {
                Response.Redirect("Login.aspx");
            } else {
                User user = (User)Session["user"];
                int projectID = Convert.ToInt32(Request.QueryString["id"]);
                if (!user.projectIsMine(projectID)) {
                    Response.Redirect("Options.aspx");
                }
                project = Project.findById(projectID);
                switch(Request.QueryString["type"]){
                    case "preliminary":
                        StatusList.DataSource = Submissions.getCommitteeComments(projectID, Submissions.Type.PreliminaryProposal);
                        break;
                    case "final":
                        StatusList.DataSource = Submissions.getCommitteeComments(projectID, Submissions.Type.Final);
                        break;
                    case "presentation":
                        StatusList.DataSource = Submissions.getCommitteeComments(projectID, Submissions.Type.PresentationScheduling);
                        break;
                    default:
                        Response.Redirect("Default.aspx");
                        break;
                }
                StatusList.DataBind();
            }
        }
    }
}