<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="AccountApproval.aspx.cs" Inherits="FinalProject.AccountApproval" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <ul class="nav nav-sidebar">
                    <li><a href="Dashboard.aspx">Overview</a></li>
                    <li><a href="Reports.aspx">Reports</a></li>
                    <li class="active"><a href="AccountApproval.aspx">Account Approval</a></li>
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
                <h1 class="page-header">Approve an Account</h1>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"
                    CellPadding="5" OnRowCommand="GridView1_SelectedIndexChanged" Height="153px" Width="503px" RowStyle-HorizontalAlign="Center"
                    GridLines="Vertical" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ForeColor="Black">
                    <Columns>
                        <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" Visible="true" />
                        <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
                        <asp:BoundField DataField="userID" HeaderText="User ID" SortExpression="userID" />
                        <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
                        <asp:BoundField DataField="accountReason" HeaderText="Reason to sign up" SortExpression="accountReason" />
                        <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Approve this account?" ShowHeader="True" Text="Approve" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Database %>" SelectCommand="SELECT DISTINCT [firstName], [lastName], [userID], [type], [accountReason] FROM [UserAccount] WHERE ([accountApproval] = 'False')"></asp:SqlDataSource>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </div>
        </div>
    </div>


</asp:Content>
