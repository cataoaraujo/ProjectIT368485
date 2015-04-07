using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FinalProject.Model;

namespace FinalProject
{
    public partial class AccountApproval : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null) {
                User u = (User)Session["user"];
                if (!u.type.ToLower().Equals("admin")) {
                    Response.Redirect("permissionDenied.aspx");
                }
            } else {
                Response.Redirect("Login.aspx");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, GridViewCommandEventArgs e)
        {
            User u = new User();
            bool approval = false;
            string userID;

            if (e.CommandName == "Select")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                userID = row.Cells[0].Text;
                
                approval = u.approveAccount(userID);
                
                Label1.Text = "Account for " + userID + " is approved.";
            }
        }
    }
}