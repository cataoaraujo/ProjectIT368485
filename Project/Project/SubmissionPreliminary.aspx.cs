using FinalProject.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject {
    public partial class SubmissionPreliminary : System.Web.UI.Page {

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
            }
        }

        protected void UploadButton_Click(object sender, EventArgs e) {
            if (FileUploadControl.HasFile) {
                try {
                    Submissions submission = new Submissions();
                    submission.project = project;
                    submission.type = Submissions.Type.PreliminaryProposal;

                    Document document = new Document();

                    string filename = Path.GetFileName(FileUploadControl.FileName);
                    FileUploadControl.SaveAs(Server.MapPath("~/Documents/") + filename);

                    document.name = filename;
                    document.link = "/Documents/" + filename;
                    if (document.add()) {
                        submission.document = document;
                        if (submission.submit()) {
                            StatusLabel.Text += "Submission Completed!";
                        }
                    }

                    //StatusLabel.Text += "Upload status: File uploaded!";
                } catch (Exception ex) {
                    StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
        }
    }
}