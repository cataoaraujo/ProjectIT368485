using FinalProject.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject {
    public partial class RetrievePassword : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void Button1_Click(object sender, EventArgs e) {
            String userID = userId.Text;
            User u = new User();
            bool exists;
            exists = u.verifyUserID(userID);
            if (exists == true) {
                MultiView1.ActiveViewIndex = 1;
                secQuestion.Text = u.getQuestion(userID);
            } else {
                errorMsg.Text = "User Id not found. Please try again";
            }
            //
        }

        protected void Button2_Click(object sender, EventArgs e) {
            String userID = userId.Text;
            User u = new User();
            bool check = u.checkAnswer(userID, secAnswer.Text);
            if (check == true) {
                MultiView1.ActiveViewIndex = 2;
            } else {
                errorLbl.Text = " Answer do not match";
            }
        }

        protected void changePwd_Click(object sender, EventArgs e) {
            String userID = userId.Text;
            User u = new User();
            bool check = u.updatePwd(userID, Password.Text);
            if (check == true) {
                //this.form1.Visible = false;
                msg.Text = "Password Changed. Please Login Again";
            } else {
                //this.form1.Visible = false;
                msg.Text = "There was an error.Password cannot be changed";
            }

        }
    }
}