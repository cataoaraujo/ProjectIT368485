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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="userID" DataSourceID="SqlDataSource2" 
            CellPadding="4" OnRowCommand="GridView1_SelectedIndexChanged" Height="153px" Width="421px" RowStyle-HorizontalAlign="Center"
            GridLines="Vertical" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ForeColor="Black">
            <Columns>
                <asp:BoundField DataField="userID" HeaderText="User ID" ReadOnly="True" SortExpression="userID" Visible="true" />
                <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
                <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
                <asp:BoundField DataField="accountReason" HeaderText="Reason to sign up" SortExpression="accountReason" />
                <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Approve?" ShowHeader="True" Text="Approve" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Database %>" SelectCommand="SELECT DISTINCT [userID], [firstName], [lastName], [accountReason] FROM [UserAccount] WHERE ([accountApproval] = @accountApproval)">
            <SelectParameters>
                <asp:Parameter DefaultValue="False" Name="accountApproval" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </div>

</asp:Content>
