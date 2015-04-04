<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountApproval.aspx.cs" Inherits="Project.Model.AccountApproval" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>Approve an Account</h3>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="userID" DataSourceID="SqlDataSource2" 
            CellPadding="5" OnRowCommand="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="userID" HeaderText="User ID" ReadOnly="True" SortExpression="userID" Visible="true" />
                <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
                <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
                <asp:BoundField DataField="accountReason" HeaderText="Reason to sign up" SortExpression="accountReason" />
                <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Approve?" ShowHeader="True" Text="Approve" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:it368485_FinalProjectConnectionString %>" SelectCommand="SELECT [userID], [firstName], [lastName], [accountReason] FROM [UserAccount]"></asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
