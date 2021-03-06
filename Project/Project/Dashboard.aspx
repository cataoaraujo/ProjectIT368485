﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="FinalProject.Dashboard2" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .hero-widget {
            text-align: center;
            padding-top: 20px;
            padding-bottom: 20px;
        }

            .hero-widget .icon {
                display: block;
                font-size: 96px;
                line-height: 96px;
                margin-bottom: 10px;
                text-align: center;
            }

            .hero-widget var {
                display: block;
                height: 64px;
                font-size: 64px;
                line-height: 64px;
                font-style: normal;
            }

            .hero-widget label {
                font-size: 17px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <ul class="nav nav-sidebar">
                    <li class="active"><a href="Dashboard.aspx">Overview</a></li>
                    <li><a href="Reports.aspx">Reports</a></li>
                    <li><a href="AccountApproval.aspx">Account Approval</a></li>
                    <li><a href="PrintFlyer.aspx">Print Flyer</a></li>
                </ul>
            </div>
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h1>Dashboard</h1>
                    </div>
                    <div class="panel-body">
                        <div class="col-sm-3">
                            <div class="hero-widget">
                                <div class="icon">
                                    <i class="glyphicon glyphicon-user"></i>
                                </div>
                                <div class="text">
                                    <var><% Response.Write(FinalProject.Model.User.countUsers()); %></var>
                                    <label class="text-muted">Users</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="hero-widget">
                                <div class="icon">
                                    <i class="glyphicon glyphicon-file"></i>
                                </div>
                                <div class="text">
                                    <var><% Response.Write(FinalProject.Model.Project.countProjects()); %></var>
                                    <label class="text-muted">Theses</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="hero-widget">
                                <div class="icon">
                                    <i class="glyphicon glyphicon-download-alt"></i>
                                </div>
                                <div class="text">
                                    <var><% Response.Write(FinalProject.Model.Project.countTotalDownloads()); %></var>
                                    <label class="text-muted">Downloads</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="hero-widget ">
                                <div class="icon">
                                    <i class="glyphicon glyphicon-stats"></i>
                                </div>
                                <div class="text">
                                    <var><% Response.Write(FinalProject.Model.Project.countTotalViews()); %></var>
                                    <label class="text-muted">Views</label>
                                </div>
                            </div>
                        </div>
                        </div>
                        <div class="panel-heading">
                            <h1>Users</h1>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>UserID</th>
                                            <th>Email</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="UserList" runat="server" RepeatDirection="Horizontal">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("id") %></td>
                                                    <td><%# Eval("firstName") %></td>
                                                    <td><%# Eval("lastName") %></td>
                                                    <td><%# Eval("userid") %></td>
                                                    <td><%# Eval("email") %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%-- <div class="container well">
        
            <div>
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    
                    <asp:View ID="View1" runat="server">
                        <a class="btn btn-primary btn-lg" href="AccountApproval.aspx">Account Approval</a>
                        <br />
                        <p>List Thesis/Projects by:</p>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                            <asp:ListItem Text="No. of Views"></asp:ListItem>
                            <asp:ListItem Text="No. of Downloads"></asp:ListItem>
                        </asp:RadioButtonList>
                        <br />
                        <p>Chart Type:</p>
                        <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                            <asp:ListItem Text="Bar Chart"></asp:ListItem>
                            <asp:ListItem Text="Pie Chart"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:Button ID="Button1" runat="server" Text="OK" OnClick="Button1_Click" />
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
                            <Series>
                                <asp:Series Name="Series1" XValueMember="project_id" YValueMembers="views">
                                </asp:Series>
                            </Series>
                            <ChartAreas>

                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Database %>" SelectCommand="SELECT [project_id], [views] FROM [ProjectStatistics]"></asp:SqlDataSource>


                        <br />
                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="project_id" DataSourceID="SqlDataSource8">
                            <Columns>
                                <asp:BoundField DataField="project_id" HeaderText="project_id" ReadOnly="True" SortExpression="project_id" />
                                <asp:BoundField DataField="views" HeaderText="views" SortExpression="views" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:Database %>" SelectCommand="SELECT [project_id], [views] FROM [ProjectStatistics]"></asp:SqlDataSource>


                    </asp:View>

                    <asp:View ID="View3" runat="server">

                        <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2">
                            <Series>
                                <asp:Series ChartType="Pie" Name="Series1" XValueMember="project_id" YValueMembers="views">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Database %>" SelectCommand="SELECT [project_id], [views] FROM [ProjectStatistics]"></asp:SqlDataSource>

                        <br />
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="project_id" DataSourceID="SqlDataSource7">
                            <Columns>
                                <asp:BoundField DataField="project_id" HeaderText="project_id" ReadOnly="True" SortExpression="project_id" />
                                <asp:BoundField DataField="views" HeaderText="views" SortExpression="views" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:Database %>" SelectCommand="SELECT [project_id], [views] FROM [ProjectStatistics]"></asp:SqlDataSource>

                    </asp:View>
                    <asp:View ID="View4" runat="server">

                        <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource3">
                            <Series>
                                <asp:Series Name="Series1" XValueMember="project_id" YValueMembers="downloads">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Database %>" SelectCommand="SELECT [project_id], [downloads] FROM [ProjectStatistics] ORDER BY [downloads] DESC"></asp:SqlDataSource>

                        <br />
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="project_id" DataSourceID="SqlDataSource6">
                            <Columns>
                                <asp:BoundField DataField="project_id" HeaderText="project_id" ReadOnly="True" SortExpression="project_id" />
                                <asp:BoundField DataField="downloads" HeaderText="downloads" SortExpression="downloads" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Database %>" SelectCommand="SELECT [project_id], [downloads] FROM [ProjectStatistics] ORDER BY [downloads] DESC"></asp:SqlDataSource>

                    </asp:View>
                    <asp:View ID="View5" runat="server">

                        <asp:Chart ID="Chart4" runat="server" DataSourceID="SqlDataSource4">
                            <Series>
                                <asp:Series ChartType="Pie" Name="Series1" XValueMember="project_id" YValueMembers="downloads">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Database %>" SelectCommand="SELECT [project_id], [downloads] FROM [ProjectStatistics] ORDER BY [downloads] DESC"></asp:SqlDataSource>

                        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="project_id" DataSourceID="SqlDataSource5">
                            <Columns>
                                <asp:BoundField DataField="project_id" HeaderText="project_id" ReadOnly="True" SortExpression="project_id" />
                                <asp:BoundField DataField="downloads" HeaderText="downloads" SortExpression="downloads" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Database %>" SelectCommand="SELECT [project_id], [downloads] FROM [ProjectStatistics]"></asp:SqlDataSource>
                    </asp:View>

                </asp:MultiView>




            </div>
        
    </div>--%>
</asp:Content>
