using FinalProject.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject {
    public partial class Approval : System.Web.UI.Page {
        int committeeID;
        int submissionID;
        protected void Page_Load(object sender, EventArgs e) {
            committeeID = Convert.ToInt32(Request.QueryString["cID"]);
            submissionID = Convert.ToInt32(Request.QueryString["sID"]);
            if (!Submissions.approvalIsValid(committeeID, submissionID)) {
                Response.Redirect("Default.aspx");
            }
        }

        protected void Approve_Click(object sender, EventArgs e) {
            if (Submissions.committeeApproval(committeeID, submissionID, true, Comments.Text)) {
                Response.Redirect("Default.aspx");
            }
            Response.Redirect("Error.aspx");
        }

        protected void Disapprove_Click(object sender, EventArgs e) {
            if (Submissions.committeeApproval(committeeID, submissionID, false, Comments.Text)) {
                Response.Redirect("Default.aspx");
            }
            Response.Redirect("Error.aspx");
        }
    }
}