using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Project.Model;


namespace Project
{
    public partial class Highlight : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Model.Project p = new Model.Project();
            string h=p.highlightProject();
            Label1.Text = h;
       
        }
    }
}
