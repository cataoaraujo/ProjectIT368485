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
    public partial class Editdetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["user"] == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}
            if (Request.QueryString["PrjId"] != null)
            {
                ViewState["ProjectId"] = Request.QueryString["PrjId"].ToString();
            }
            if (!IsPostBack)
            {


                SqlConnection Dbconnect = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
                String Project_ID = Request.QueryString["PrjId"];
                Response.Write("Details of this project is given below : " + "</br>");
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
                            TextBox_PID.Text = dataReader["id"].ToString(); TextBox_PID.Enabled = false;
                            TextBox_name.Text = dataReader["name"].ToString();
                            TextBox_Student_id.Text = dataReader["student_id"].ToString(); TextBox_Student_id.Enabled = false;
                            TextBox_CourseNumber.Text = dataReader["courseNumber"].ToString();
                            TextBox_LiveLink.Text = dataReader["liveLink"].ToString();
                            TextBox_Abstract.Text = dataReader["abstract"].ToString();
                            TextBox_Semester.Text = dataReader["semester"].ToString();
                            TextBox_ScreenCastLink.Text = dataReader["screencastLink"].ToString();
                            TextBox_DateCreated.Text = dataReader["dateCreated"].ToString(); TextBox_DateCreated.Enabled = false;

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

        //public int UpdateProjectDetails(int ProjectID, string name, string student_id, string courseNumber, string liveLink, string abstractData, string semester, string screencastLink)
        //{
        //    SqlConnection connAppSave = new SqlConnection("Data Source=itksqlexp8;Initial Catalog=it368485_FinalProject;Integrated Security=True");
        //    try
        //    {

        //        SqlCommand cmdAppSave;
        //        connAppSave.Open();

        //        cmdAppSave = new SqlCommand("UpdateProjectDetails", connAppSave);
        //        cmdAppSave.CommandType = CommandType.StoredProcedure;
        //        cmdAppSave.Parameters.AddWithValue("@ProjectID",ProjectID);
        //        cmdAppSave.Parameters.AddWithValue("@name",name);
        //        cmdAppSave.Parameters.AddWithValue("@student_id",student_id);
        //        cmdAppSave.Parameters.AddWithValue("@courseNumber",courseNumber);
        //        cmdAppSave.Parameters.AddWithValue("@liveLink",liveLink);
        //        cmdAppSave.Parameters.AddWithValue("@abstract",abstractData);
        //        cmdAppSave.Parameters.AddWithValue("@semester",semester);
        //        cmdAppSave.Parameters.AddWithValue("@screencastLink",screencastLink);
        //       // cmdAppSave.Parameters.AddWithValue("@dateCreated",dateCreated);
        //        return cmdAppSave.ExecuteNonQuery();
        //        //connAppSave.Close();

        //    }
        //    //catch (Exception ex)
        //    //{
        //    //    ExceptionUtility.LogException(ex, "AppCode_Goals");
        //    //    throw ex;
        //    //}
        //    catch (SqlException exception)
        //    {
        //        Response.Write("<p>Error code " + ": " + exception + "</p>");
        //        Response.Write("<p>Error code " + ": " + exception.Message + "</p>");
        //    }
        //    finally
        //    {
        //        connAppSave.Close();
        //    }
        //}

        protected void BtnUpdate_Click1(object sender, EventArgs e)
        {
            //int i = UpdateProjectDetails(Convert.ToInt32(TextBox_PID.Text), TextBox_name.Text, TextBox_Student_id.Text, TextBox_CourseNumber.Text, TextBox_LiveLink.Text, TextBox_Abstract.Text, TextBox_Semester.Text, TextBox_ScreenCastLink.Text);
            //if (i > 0)
            //{
            //    // display success msg.
            //    Response.Write("Updated successfully");
            //}


            this.form1.Visible = false;
            int ProjectID = Convert.ToInt32(TextBox_PID.Text);
            string name = TextBox_name.Text;
            string courseNumber = TextBox_CourseNumber.Text;
            string liveLink = TextBox_LiveLink.Text;
            string abstractData = TextBox_Abstract.Text;
            string student_id = TextBox_Student_id.Text;
            string semester = TextBox_Semester.Text;
            string screencastLink = TextBox_ScreenCastLink.Text;

            SqlConnection dbConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString);

            dbConnection.Open();
            string UpdateProjectDetails = "UPDATE Project set name= '" + name + "',courseNumber= '" + courseNumber + "',liveLink ='" + liveLink + "',abstract= '" + abstractData + "', student_id= '" + student_id + "',semester='" + semester + "',screencastLink='" + screencastLink + "' WHERE  id = '" + ProjectID + "';";
            try
            {

                //string updateInformation = "UPDATE User_Data SET First_Name = '" + firstName + "',Last_Name = '"+lastName+"',Password='"+userPassword+"',Email='"+emailId+"',Security_Question = '"+question+"', Security_Answer='"+answer+"' WHERE  Username = '"+name+"';";
                SqlCommand updateData = new SqlCommand(UpdateProjectDetails, dbConnection);
                updateData.ExecuteNonQuery();
                int rows = updateData.ExecuteNonQuery();

                if ((updateData.ExecuteNonQuery() == 0))
                    Response.Write("No rows updated");
                else
                    Response.Write(TextBox_Student_id.Text + ", Your Information is now Updated");

            }
            catch (Exception exception)
            {
                Response.Write("<p>Error code " + ": " + exception + "</p>");
                Response.Write("<p>Error code " + ": " + exception.Message + "</p>");
            }
        }
    }
}