<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="FinalProject.Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <ul class="nav nav-sidebar">
                    <li><a href="Dashboard.aspx">Overview</a></li>
                    <li class="active"><a href="Reports.aspx">Reports</a></li>
                    <li><a href="AccountApproval.aspx">Account Approval</a></li>
                    <li><a href="PrintFlyer.aspx">Print Flyer</a></li>
                </ul>
                <%--<ul class="nav nav-sidebar">
                    <li><a href="">Nav item</a></li>
                    <li><a href="">Nav item again</a></li>
                    <li><a href="">One more nav</a></li>
                    <li><a href="">Another nav item</a></li>
                    <li><a href="">More navigation</a></li>
                </ul>
                <ul class="nav nav-sidebar">
                    <li><a href="">Nav item again</a></li>
                    <li><a href="">One more nav</a></li>
                    <li><a href="">Another nav item</a></li>
                </ul>--%>
            </div>
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h1 class="page-header">Reports</h1>
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">

                    <asp:View ID="View1" runat="server">
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
        </div>
    </div>

</asp:Content>
