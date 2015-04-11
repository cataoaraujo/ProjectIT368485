using FinalProject.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace FinalProject {
    public partial class CreateProject : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (Session["user"] == null) {
                Response.Redirect("Login.aspx");
            }

        }

        protected void submit_Click(object sender, EventArgs e) {
            if (Session["user"] != null) {
                if (!CommitteeEmails_ServerValidate()) {
                    errorMsg.Text = "Committee can't be the same!";
                    return;
                }
                User u = (User)Session["user"];

                Project p = new Project();
                p.user = u;
                p.name = projectName.Text;
                p.projectAbstract = projectAbstract.Text;
                p.courseNumber = courseNumber.Text;
                p.semester = semester.Text;
                p.liveLink = liveLink.Text;
                p.screencastLink = screencastLink.Text;

                Committee chair = new Committee(committeChair.Text, committeChairEmail.Text, "Chair");

                Committee member1 = new Committee(committeMember1.Text, committeMember1Email.Text, "Member");

                Committee member2 = new Committee(committeMember2.Text, committeMember2Email.Text, "Member");

                Committee advisor = new Committee(committeAdvisor.Text, committeAdvisorEmail.Text, "Advisor");

                p.addCommittee(chair);
                p.addCommittee(member1);
                p.addCommittee(member2);
                p.addCommittee(advisor);
                p.keywords = keywords.Text.Split(' ').ToList();
                if (p.add()) {
                    Response.Redirect("Default.aspx");
                }
            } else {
                Response.Redirect("Login.aspx");
            }
        }

        protected bool CommitteeEmails_ServerValidate() {
            bool IsValid = true;
            if (committeChairEmail.Text.Equals(committeMember1Email.Text)) {
                IsValid = false;
            }
            if (committeChairEmail.Text.Equals(committeMember2Email.Text)) {
                IsValid = false;
            }
            if (committeChairEmail.Text.Equals(committeAdvisorEmail.Text)) {
                IsValid = false;
            }
            if (committeMember1Email.Text.Equals(committeMember2Email.Text)) {
                IsValid = false;
            }
            if (committeMember1Email.Text.Equals(committeAdvisorEmail.Text)) {
                IsValid = false;
            }
            if (committeMember2Email.Text.Equals(committeAdvisorEmail.Text)) {
                IsValid = false;
            }
            return IsValid;
        }
    }
}