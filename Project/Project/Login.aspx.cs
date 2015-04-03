using Project.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            User u = new User();
            u = u.login(userID.Text, password.Text);
            if (u != null) {
                Session["user"] = u;
                Response.Redirect("Default.aspx");
            } else {
                errorMsg.Text = "User or Password is wrong, or maybe you were not approved to use the system yet.";
            }
        }
    }
}