﻿using FinalProject.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject {
    public partial class Default2 : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            Model.Project p = new Model.Project();
            List<Project> projects = p.showHighlights();
            ProjectList.DataSource = projects;
            ProjectList.DataBind();
            //Label1.Text = h;
        }
        protected void Timer1_Tick(object sender, EventArgs e) {
            Model.Project p = new Model.Project();
            List<Project> projects = p.showHighlights();
            ProjectList.DataSource = projects;
            ProjectList.DataBind();
            //Label1.Text = h;
        }

    }
}