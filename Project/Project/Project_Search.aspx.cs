using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FinalProject.Model;

namespace Project_search {
    public partial class Project_Search : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            //if (Session["user"] == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}

        }

        private void SeachProject() {
            List<Project> projects = Project.findByKeyword(txtSrch.Text);
            SearchResult.DataSource = projects;
            SearchResult.DataBind();

            //SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString);

            //SqlCommand cmd = new SqlCommand();
            ////string conf = System.Configuration.ConfigurationManager.ConnectionStrings["it368485_FinalProject"].ConnectionString;
            //// SqlConnection conn = new SqlConnection(conf);


            //// SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["PMSConnString"].ToString());
            //cmd.Connection = conn;
            //SqlDataAdapter da = new SqlDataAdapter();
            //DataTable dt = new DataTable();
            //conn.Open();
            //try {

            //    cmd.CommandType = CommandType.StoredProcedure;
            //    cmd.CommandText = "SearchProject";
            //    cmd.Parameters.Clear();
            //    cmd.Parameters.AddWithValue("@KeyWord", txtSrch.Text.Trim());
            //    da = new SqlDataAdapter(cmd);
            //    dt.Clear();
            //    da.Fill(dt);
            //    if (dt != null) {
            //        if (dt.Rows.Count > 0) {
            //            GridView1.Visible = true;
            //            GridView1.DataSource = dt;
            //            GridView1.DataBind();
            //        } else {
            //            GridView1.Visible = false;
            //            GridView1.DataSource = null;
            //            GridView1.DataBind();

            //        }
            //    } else {
            //        GridView1.DataSource = null;
            //        GridView1.DataBind();

            //    }
            //} catch (Exception ex) {
            //    throw ex;
            //}
        }

        protected void BtnSearch_Click(object sender, EventArgs e) {
            SeachProject();
        }

        //protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e) {
        //    Project p = new Project();
        //    if (e.CommandName == "View") {
        //        GridViewRow gvRow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
        //        int rowind = gvRow.RowIndex;
        //        Label Lblprojectid = (Label)gvRow.FindControl("Lblprojectid");
        //        int ProjectId = Convert.ToInt32(Lblprojectid.Text.Trim());
        //        Insert_ProjectStatistics(ProjectId, "View");
        //        p.highlightProject();
        //    }

        //    if (e.CommandName == "download") {

        //        GridViewRow gvRow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
        //        int rowind = gvRow.RowIndex;
        //        Label Lblprojectid = (Label)gvRow.FindControl("Lblprojectid");
        //        Label LbldocumentLink = (Label)gvRow.FindControl("LbldocumentLink");
        //        Label LbldocumentName = (Label)gvRow.FindControl("LbldocumentName");

        //        int ProjectId = Convert.ToInt32(Lblprojectid.Text.Trim());
        //        Insert_ProjectStatistics(ProjectId, "DownLoad");
        //        p.highlightProject();

        //        string fileName = "test.txt";
        //        // string fileName = LbldocumentName.Text;

        //        // make sure filePath  contains file path like 'Uploads/Scheme/test.pdf'   
        //        string FileSource = LbldocumentLink.Text.Trim();
        //        // USE FileSource TO GET FILE FILE AND PUT IN BELOW LINE AS  UR SOURCE FOLDER SOURCE FOR FILE
        //        string filePath = Server.MapPath(@"~\TextFile.txt");
        //        Response.Clear();
        //        Response.Buffer = true;

        //        // Read the original file from disk
        //        FileStream myFileStream = new FileStream(filePath, FileMode.Open);
        //        long FileSize = myFileStream.Length;
        //        byte[] Buffer = new byte[Convert.ToInt32(FileSize)];
        //        myFileStream.Read(Buffer, 0, Convert.ToInt32(FileSize));
        //        myFileStream.Close();
        //        // Tell the browse stuff about the file
        //        Response.AddHeader("Content-Length", FileSize.ToString());
        //        //Response.AddHeader("Content-Disposition", "inline; filename=" & fileneme.Replace(" ", "_"))
        //        Response.AddHeader("Content-Disposition", "attachment; filename=" + fileName + ";");
        //        //Response.TransmitFile(fileneme)
        //        //Response.ContentType = getMimeType(sExtention, oConnection)

        //        // Send the data to the browser
        //        Response.BinaryWrite(Buffer);
        //        Response.End();
        //    }
        //    //do something with the link here


        //}

        //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e) {
        //    if (e.Row.RowType == DataControlRowType.DataRow) {
        //        Label Lblprojectid = (Label)e.Row.FindControl("Lblprojectid");
        //        Label Lblstudentid = (Label)e.Row.FindControl("Lblstudentid");

        //        LinkButton LnlEdit = (LinkButton)e.Row.FindControl("LnlEdit");
        //        LinkButton LnlView = (LinkButton)e.Row.FindControl("LnlView");
        //        //User u = new User();
        //        //u = (User)Session["user"];
        //        //int userid = u.id;
        //        //if userid== Convert.int32(Lblstudentid.text);
        //        Session["MyChk"] = "Hi";
        //        if (Session["MyChk"].ToString() == "Hi") {
        //            LnlEdit.Visible = true;
        //            LnlEdit.Attributes.Add("onclick", "javascript:EditProjectDetails(" + Lblprojectid.Text + ");");
        //        } else {
        //            LnlEdit.Visible = false;
        //        }
        //        LnlView.Attributes.Add("onclick", "javascript:ViewProjectDetails(" + Lblprojectid.Text + ");");

        //    }
        //}

        public void Insert_ProjectStatistics(int ProjectId, string Tpye) {
            try {
                SqlConnection connAppSave = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
                // SqlConnection connAppSave = new SqlConnection(ConfigurationManager.AppSettings["PMSConnString"].ToString());
                SqlCommand cmdAppSave;
                connAppSave.Open();

                cmdAppSave = new SqlCommand("InsertProjectStatistics", connAppSave);
                cmdAppSave.CommandType = CommandType.StoredProcedure;
                cmdAppSave.Parameters.AddWithValue("@projectid", ProjectId);
                cmdAppSave.Parameters.AddWithValue("@Type", Tpye);
                int i = cmdAppSave.ExecuteNonQuery();
                if (i > 0) {
                    connAppSave.Close();
                }
            } catch (Exception ex) {
                throw ex;
            }
        }

        protected void btView_Click(object sender, EventArgs e) {
            Button btn = (Button)sender;
            int ProjectId = Convert.ToInt32(btn.CommandArgument.ToString());
            switch (btn.CommandName) {
                case "View":
                    Project p = new Project();
                    Insert_ProjectStatistics(ProjectId, "View");
                    p.highlightProject();
                    Response.Redirect("Viewprojectdetails.aspx?PrjId=" + ProjectId);
                    break;
                case "Edit":
                    Response.Redirect("Editdetails.aspx?PrjId=" + ProjectId);
                    break;
            }
        }





    }
}
