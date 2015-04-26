using FinalProject.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject {
    public partial class Reports : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (Session["user"] != null) {
                User u = (User)Session["user"];
                if (!u.type.ToLower().Equals("admin")) {
                    Response.Redirect("permissionDenied.aspx");
                }
            } else {
                Response.Redirect("Login.aspx");
            }
        }
        protected void Button1_Click(object sender, EventArgs e) {
            if (RadioButtonList1.SelectedItem.Text == "No. of Views") {
                if (RadioButtonList2.SelectedItem.Text == "Bar Chart")
                    MultiView1.ActiveViewIndex = 1;
                else if (RadioButtonList2.SelectedItem.Text == "Pie Chart")
                    MultiView1.ActiveViewIndex = 2;
                else
                    Console.Write("Please select the chart type");
            } else if (RadioButtonList1.SelectedItem.Text == "No. of Downloads") {
                if (RadioButtonList2.SelectedItem.Text == "Bar Chart")
                    MultiView1.ActiveViewIndex = 3;
                else if (RadioButtonList2.SelectedItem.Text == "Pie Chart")
                    MultiView1.ActiveViewIndex = 4;
                else
                    Label1.Text = "Please select the chart type";
            } else if (RadioButtonList1.SelectedItem.Text == "null")
                Console.Write("Please select how you want to view thesis/project");
        }
    }
}