using FinalProject.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class Subscribe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool flag = true;
            String input = keyword.Text.ToString();
            List<String> keywordList = new List<string>();
            keywordList = input.Split(' ').ToList();
            Subscribers s = new Subscribers();
            s.email = email.Text.ToString();

            if (!s.verifyEmail())
            {
                flag = false;
                errorMsg.Text = "You have already subscribed!<br/>";
            }
            if(flag==true)
            {
                
                s.storeKeywords(keywordList);
                MultiView1.ActiveViewIndex = 1;
            }
        }
    }
}