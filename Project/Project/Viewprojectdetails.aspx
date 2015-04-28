<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Viewprojectdetails.aspx.cs" Inherits="Project_search.Viewprojectdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 133px;
        }

        .auto-style3 {
            width: 249px;
        }
    </style>
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h1><% Response.Write(project.name); %></h1>
            </div>
            <div class="panel-body">
                <p><b>Abstract: </b><% Response.Write(project.projectAbstract); %></p>
                <br />
                <div class="row">
                    <div class="col-md-4">
                        <p><b>Author:</b></p>
                        <p class="text-capitalize"><% Response.Write(project.user.firstName + " " + project.user.lastName); %></p>
                    </div>
                    <div class="col-md-4">
                        <p><b>Course Number / Semester:</b></p>
                        <p class="text-capitalize"><% Response.Write(project.courseNumber + " / " + project.semester); %></p>
                    </div>
                    <div class="col-md-4">
                        <p><b>Created at:</b></p>
                        <p class="text-capitalize"><% Response.Write(project.dateCreated); %></p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <p><b>Tools:</b></p>
                        <a href="<% Response.Write("http://" + project.liveLink.Replace("http://", "")); %>" class="btn btn-sm btn-default"><i class="glyphicon glyphicon-cloud"></i>Live Version</a> <a href="<% Response.Write("http://" + project.screencastLink.Replace("http://", "")); %>" class="btn btn-sm btn-default"><i class="glyphicon glyphicon-film"></i>Screencast</a>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-12">
                        <p><b>Documents:</b></p>
                        <asp:ListView ID="DocumentList" runat="server" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <a href="<%# Eval("link") %>" class="btn btn-sm btn-default"><i class="glyphicon glyphicon-paperclip"></i><%# Eval("name") %></a>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>
                <br />
                <br />
            </div>
            <div class="panel-heading">
                <h2>Similar Projects</h2>
            </div>
            <div class="panel-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="student_id" HeaderText="student_id" SortExpression="student_id" />
                        <asp:BoundField DataField="courseNumber" HeaderText="courseNumber" SortExpression="courseNumber" />
                        <asp:BoundField DataField="liveLink" HeaderText="liveLink" SortExpression="liveLink" />
                        <asp:BoundField DataField="abstract" HeaderText="abstract" SortExpression="abstract" />
                        <asp:BoundField DataField="screencastLink" HeaderText="screencastLink" SortExpression="screencastLink" />
                        <asp:BoundField DataField="semester" HeaderText="semester" SortExpression="semester" />
                        <asp:BoundField DataField="documentName" HeaderText="documentName" SortExpression="documentName" />
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Database %>" SelectCommand="SELECT P.id, P.name, P.student_id, P.courseNumber, P.liveLink, P.abstract, P.screencastLink, P.semester, P.dateCreated, P.highlighted, Ky.keyword, DS.documentName, DS.documentLink FROM Project AS P LEFT OUTER JOIN ProjectSubmission AS PD ON P.id = PD.project_id LEFT OUTER JOIN Documents AS DS ON DS.id = PD.document_id INNER JOIN ProjectKeywords AS PK ON P.id = PK.project_id INNER JOIN Keyword AS Ky ON Ky.id = PK.keyword_id WHERE (Ky.keyword IN (SELECT keyword FROM Keyword WHERE (id IN (SELECT keyword_id FROM ProjectKeywords WHERE (project_id = @PrjId)))))">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="PrjId" QueryStringField="PrjId" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>
    </div>


    </div>
</asp:Content>
