using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class PrintFlyer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            stdLabel.Text = stdName.Text;
            titleLabel.Text = prjTitle.Text;
            timeLabel.Text = schTime.Text;
            locLabel.Text = loc.Text;
        }
    }
}