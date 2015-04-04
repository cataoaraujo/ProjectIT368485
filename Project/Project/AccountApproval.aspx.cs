using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.Model
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
            if (e.CommandName == "Select")
            {
                approval = u.accountApproval;

                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                string uID = row.Cells[0].Text;
                
                Label1.Text = "Account for " + uID + " is approved.";
            }
        }
    }
}