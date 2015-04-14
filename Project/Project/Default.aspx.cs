using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Project.Model;


namespace FinalProject {
    public partial class Default : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            protected void Page_Load(object sender, EventArgs e) 
        {
            Model.Project p = new Model.Project();
            string h = p.showHighlights();
            Label1.Text = h;
        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Model.Project p = new Model.Project();
            string h = p.showHighlights();
            Label1.Text = h;
        }
            
        }
    }
}
