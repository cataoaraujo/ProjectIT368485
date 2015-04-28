using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


namespace Project_search
{
    public partial class Viewprojectdetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["user"] == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}
            if (!IsPostBack)
            {
                if (Request.QueryString["PrjId"] != null)
                {
                    ViewState["ProjectId"] = Request.QueryString["PrjId"].ToString();
                }
            }
            SqlConnection Dbconnect = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
            String Project_ID = Request.QueryString["PrjId"];
            //Response.Write("Details of this project is given below : " + "</br>");
            String sqlcmd = "Select * from project where id=" + "'" + Project_ID + "'";
            try
            {
                Dbconnect.Open();
                SqlCommand CmdQ3 = new SqlCommand(sqlcmd, Dbconnect);
                SqlDataReader dataReader = CmdQ3.ExecuteReader();

                if (dataReader.Read())
                {
                    do
                    {
                        LblProjectId.Text = dataReader["id"].ToString();  
                        LblProjectName.Text = dataReader["name"].ToString();  
                        LblStudID.Text = dataReader["student_id"].ToString();  
                        LblCourName.Text = dataReader["courseNumber"].ToString();
                        string LinkURL =  dataReader["liveLink"].ToString();
                        lnkLiveLink.Attributes.Add("onclick", "javascript:window.open('" + LinkURL + "','','width=850,height=650,left=150,top=100,screenX=150,screenY=150,scrollbars=yes,resizable=yes,return=false');");

                        TextBox_Abstract.Text = dataReader["abstract"].ToString();  
                        LblSem.Text = dataReader["semester"].ToString(); 
                        LblSrnCast.Text = dataReader["screencastLink"].ToString();  
                        LblCreatedON.Text = dataReader["dateCreated"].ToString(); 
                        LblHlght.Text = dataReader["highlighted"].ToString(); 

                        //Response.Write("Project_ID is : " + "</br>" + dataReader["id"] + "</br>");
                        //Response.Write("ProjectName is :" + "</br>" + dataReader["name"] + "</br>");
                        //Response.Write("Student_Id is :" + "</br>" + dataReader["student_id"] + "</br>");
                        //Response.Write("CourseNumber is :" + "</br>" + dataReader["courseNumber"] + "</br>");
                        //Response.Write("LiveLink is :" + "</br>" + dataReader["liveLink"] + "</br>");
                        //Response.Write("Abstract is :" + "</br>" + dataReader["abstract"] + "</br>");
                        //Response.Write("Screencast is :" + "</br>" + dataReader["screencastLink"] + "</br>");
                        //Response.Write("Semester is : " + "</br>" + dataReader["semester"] + "</br>");
                        //Response.Write("Date Created is :" + "</br>" + dataReader["dateCreated"] + "</br>");
                        //Response.Write("Highlighted status is  :" + "</br>" + dataReader["highlighted"] + "</br>");

                    }
                    while (dataReader.Read());
                }
                else { Response.Write("your query do not have data"); }
                CmdQ3.Dispose();
                Dbconnect.Close();
            }
            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number
                    + ": " + exception.Message + "</p>");
            }
        }
    }
}