using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class Unsubscribe : System.Web.UI.Page
    {
        SqlConnection dbConnection;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void deleteMe()
        {

            string conf = System.Configuration.ConfigurationManager.ConnectionStrings["database"].ConnectionString;

            try
            {
                dbConnection.Open();
                dbConnection = new SqlConnection(conf);
                cmd = new SqlCommand("delete FROM Subscribers where email= @email ", dbConnection);
                cmd.Parameters.AddWithValue("@email", email.Text);
                cmd.ExecuteNonQuery();
            }
            finally
            {
                dbConnection.Close();
            }
        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {

            if (this.Context.User.Identity.IsAuthenticated)
            {
                string conf = System.Configuration.ConfigurationManager.ConnectionStrings["database"].ConnectionString;

                try
                {
                    dbConnection.Open();
                    dbConnection = new SqlConnection(conf);
                    cmd = new SqlCommand("SELECT * FROM email_list where email= @email ", dbConnection);
                    cmd.Parameters.AddWithValue("@email", email.Text);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        deleteMe();
                        MultiView1.ActiveViewIndex = 1;
                    }
                    else
                    {
                        MultiView1.ActiveViewIndex = 2;
                        dbConnection.Close();
                    }
                    Response.AddHeader("REFRESH", "5;URL=Deafult.aspx");
                }
                finally
                {
                    dbConnection.Close();
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}