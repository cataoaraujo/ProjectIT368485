using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class PrintFlyer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                MultiView1.ActiveViewIndex = 1;

                
            }
        }

    }
}