using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FinalProject.Model;

namespace FinalProject {
    public partial class Dashboard2 : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (Session["user"] != null) {
                User u = (User)Session["user"];
                if (!u.type.ToLower().Equals("admin")) {
                    Response.Redirect("permissionDenied.aspx");
                }
            } else {
                Response.Redirect("Login.aspx");
            }

            UserList.DataSource = Model.User.findAll();
            UserList.DataBind();
        }

       
    }
}