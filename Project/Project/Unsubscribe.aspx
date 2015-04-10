<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Unsubscribe.aspx.cs" Inherits="FinalProject.Unsubscribe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <br />
    <br />
    <br />
    <div>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">

                <h3>Unsubscribe from Mailing List</h3>
                <h4>Are you sure you want to unsubscribe from our mailing list? Please enter your email that you used to subscribe.</h4>
                <br />
                Email: <asp:TextBox ID="email" runat="server"></asp:TextBox>
                <br /><br />
                <asp:Button ID="Button1" runat="server" Text="Yes" OnClick="Button1_Click" Width="100" />

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="Button2" runat="server" Text="No" OnClick="Button2_Click" Width="100" />
            </asp:View>

            <asp:View ID="View2" runat="server">
                <h3>Unsubscribe from Mailing List</h3>
                <h4>Your email has been removed from our mailing list. Redirecting you back to the main page.</h4>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <h3>Unsubscribe from Mailing List</h3>
                <h4>Your didn't subscribe to our service. Redirecting you back to the main page.</h4>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>