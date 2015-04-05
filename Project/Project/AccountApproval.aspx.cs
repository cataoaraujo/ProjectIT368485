using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Project.Model;

namespace Project
{
    public partial class AccountApproval : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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