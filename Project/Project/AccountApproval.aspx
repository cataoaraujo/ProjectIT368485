<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="AccountApproval.aspx.cs" Inherits="FinalProject.AccountApproval" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <br />
    <br />
    <br />

    <div>
        <h3>Approve an Account</h3>
        <br />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:it368485_FinalProjectConnectionString %>" SelectCommand="SELECT DISTINCT [firstName], [lastName], [userID], [type], [accountReason] FROM [UserAccount] WHERE ([accountApproval] IS NULL)">
        </asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </div>

</asp:Content>
