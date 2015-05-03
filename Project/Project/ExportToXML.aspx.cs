using FinalProject.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace FinalProject
{
    public partial class ExportToXML : System.Web.UI.Page
    {
        Project project;
        string prjName;
        string prjAbstract;
        string courseNum;
        string semester;
        string liveLink;
        string screencast;
        string keywords;
        string comChair;
        string comChairEmail;
        string com1;
        string com1Email;
        string com2;
        string com2Email;
        string comAdvisor;
        string comAdvisorEmail;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                User user = (User)Session["user"];
                int projectID = Convert.ToInt32(Request.QueryString["id"]);
                if (!user.projectIsMine(projectID))
                {
                    Response.Redirect("Options.aspx");
                }
                project = Project.findById(projectID);
                

                string strCon = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);
                con.Open();
                string info = "select * from Project p JOIN Committee c ON p.id=c.project_id JOIN ProjectKeywords pk ON p.id=pk.project_id JOIN keyword k ON pk.keyword_id=k.id WHERE p.id=@projectID";

                SqlCommand sqlCommand = new SqlCommand(info, con);
                sqlCommand.Parameters.AddWithValue("@projectID", projectID);
                SqlDataReader infoRecords = sqlCommand.ExecuteReader();
                int i = 0;
                while (infoRecords.Read())
                {
                    prjName = infoRecords["name"].ToString();
                    prjAbstract = infoRecords["abstract"].ToString();
                    courseNum = infoRecords["courseNumber"].ToString();
                    semester = infoRecords["semester"].ToString();
                    liveLink = infoRecords["liveLink"].ToString();
                    screencast = infoRecords["screencastLink"].ToString();
                    keywords = infoRecords["keyword"].ToString();

                    string type = infoRecords["type"].ToString();
                    if (type.Equals("Chair"))
                    {
                        comChair = infoRecords["committeeName"].ToString();
                        comChairEmail = infoRecords["committeeEmail"].ToString();
                    }
                    else if (type.Equals("Advisor"))
                    {
                        comAdvisor = infoRecords["committeeName"].ToString();
                        comAdvisorEmail = infoRecords["committeeEmail"].ToString();
                    }
                    else
                    {
                        if (i == 0)
                        {
                            com1 = infoRecords["committeeName"].ToString();
                            com1Email = infoRecords["committeeEmail"].ToString();
                            i++;
                        }
                        else
                        {
                            com2 = infoRecords["committeeName"].ToString();
                            com2Email = infoRecords["committeeEmail"].ToString();
                        }
                    }
                }
                sqlCommand.Cancel();
                infoRecords.Close();
                con.Close();
                XmlDocument doc = new XmlDocument();
                XmlNode docNode = doc.CreateXmlDeclaration("1.0", "UTF-8", null);
                doc.AppendChild(docNode);

                XmlNode productsNode = doc.CreateElement("Projects");
                doc.AppendChild(productsNode);

                XmlNode productNode = doc.CreateElement("Project");
                XmlAttribute productAttribute = doc.CreateAttribute("id");
                productAttribute.Value = "01";
                productNode.Attributes.Append(productAttribute);
                productsNode.AppendChild(productNode);
                XmlNode nameNode = doc.CreateElement("ProjectName");
                nameNode.AppendChild(doc.CreateTextNode(prjName));
                productNode.AppendChild(nameNode);
                XmlNode abstractNode = doc.CreateElement("ProjectAbstract");
                abstractNode.AppendChild(doc.CreateTextNode(prjAbstract));
                productNode.AppendChild(abstractNode);
                XmlNode courseNode = doc.CreateElement("CourseNumber");
                courseNode.AppendChild(doc.CreateTextNode(courseNum));
                productNode.AppendChild(courseNode);
                XmlNode semNode = doc.CreateElement("Semester");
                semNode.AppendChild(doc.CreateTextNode(semester));
                productNode.AppendChild(semNode);
                XmlNode liveNode = doc.CreateElement("LiveLink");
                liveNode.AppendChild(doc.CreateTextNode(liveLink));
                productNode.AppendChild(liveNode);
                XmlNode screencastNode = doc.CreateElement("Screencasst");
                screencastNode.AppendChild(doc.CreateTextNode(screencast));
                productNode.AppendChild(screencastNode);
                XmlNode keywordNode = doc.CreateElement("Keyword");
                keywordNode.AppendChild(doc.CreateTextNode(keywords));
                productNode.AppendChild(keywordNode);
                XmlNode chairNode = doc.CreateElement("CommitteeChair");
                chairNode.AppendChild(doc.CreateTextNode(comChair));
                productNode.AppendChild(chairNode);
                XmlNode chairEmNode = doc.CreateElement("CommitteeChairEmail");
                chairEmNode.AppendChild(doc.CreateTextNode(comChairEmail));
                productNode.AppendChild(chairEmNode);
                XmlNode com1Node = doc.CreateElement("CommitteeMember1");
                com1Node.AppendChild(doc.CreateTextNode(com1));
                productNode.AppendChild(com1Node);
                XmlNode com1EmNode = doc.CreateElement("CommitteeMemeber1Email");
                com1EmNode.AppendChild(doc.CreateTextNode(com1Email));
                productNode.AppendChild(com1EmNode);
                XmlNode com2Node = doc.CreateElement("CommitteeMember2");
                com2Node.AppendChild(doc.CreateTextNode(com2));
                productNode.AppendChild(com2Node);
                XmlNode com2EmNode = doc.CreateElement("CommitteeMemeber2Email");
                com2EmNode.AppendChild(doc.CreateTextNode(com2Email));
                productNode.AppendChild(com2EmNode);
                XmlNode comAdNode = doc.CreateElement("CommitteeAdvisor");
                comAdNode.AppendChild(doc.CreateTextNode(comAdvisor));
                productNode.AppendChild(comAdNode);
                XmlNode comAdEmNode = doc.CreateElement("CommitteeAdvisorEmail");
                comAdEmNode.AppendChild(doc.CreateTextNode(comAdvisorEmail));
                productNode.AppendChild(comAdEmNode);

                doc.Save(Server.MapPath("./xml_data.xml"));

                Label1.Text = "<h3>File Exported! Redirecting you to the File.</h3>";

                Response.AddHeader("REFRESH", "5;URL=xml_data.xml");
            }
            
        }
    }
}