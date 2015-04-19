using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject.js {
    public partial class Default : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected string getTabs() {
            string result = "";
            if (Session["user"] == null) { 
                result +="<li><a href='login.aspx'>Login</a></li>";
            }else {
                FinalProject.Model.User u = (FinalProject.Model.User)Session["user"];
                if (u.type.ToLower().Equals("admin")) {
                    result+="<li><a href='Dashboard.aspx'>Dashboard</a></li>";
                } 
                result+="<li><a href='Options.aspx'>Options</a></li>";
                result += "<li><a href='Logout.aspx'>Logout</a></li>";
            }
            return result;
        }
    }
}