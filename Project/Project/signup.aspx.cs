using FinalProject.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject {
    public partial class signup : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void submit_Click(object sender, EventArgs e) {
            bool flag = true;
            User u = new User();
            u.firstName = firstName.Text;
            u.lastName = lastName.Text;
            u.userID = userID.Text;
            u.password = password.Text;
            u.email = email.Text;
            u.securityQuestion = securityQuestion.Text;
            u.securityAnswer = securityAnswer.Text;
            u.accountReason = accountReason.Text;
            if (!u.verifyUserID()) {
                flag = false;
                errorMsg.Text = "UserID already exists!<br/>";
            }
            if (!u.email.EndsWith("@ilstu.edu")) {
                flag = false;
                errorMsg.Text += "Email is not from Illinois State University!";
            }
            if (flag == true) {
                if (u.add()) {
                    Response.Redirect("Default.aspx");
                } else {
                    errorMsg.Text += "<br/> Something really bad happened! Please contact the admin!";
                }
            }
            //Response.Redirect("error.aspx");
        }

    }
}