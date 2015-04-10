using FinalProject.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject {
    public partial class Unsubscribe : System.Web.UI.Page {
        

        protected void Page_Load(object sender, EventArgs e) {

        }


        protected void Button1_Click(object sender, EventArgs e) {
            Subscribers s = new Subscribers(email.Text);
            s.unsubscribe();

            MultiView1.ActiveViewIndex = 1;
            Response.AddHeader("REFRESH", "5;URL=Default.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e) {
            MultiView1.ActiveViewIndex = 2;
            Response.Redirect("Default.aspx");
        }
    }
}