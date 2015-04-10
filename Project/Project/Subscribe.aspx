<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Subscribe.aspx.cs" Inherits="FinalProject.Subscribe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <br />
    <br />
    <br />
    <div>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <h3>Subscribe to mailing list</h3>
                <h4>Please provide the keyword(s), separating them by space, and your email address to subscribe to our mailing list</h4>
                <table>
                    <tr>
                        <td>Keywords:</td>
                        <td>
                            <asp:TextBox ID="keyword" runat="server"></asp:TextBox></td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red"
                            ControlToValidate="keyword" runat="server" ErrorMessage="please enter keywords"></asp:RequiredFieldValidator>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td>
                            <asp:TextBox ID="email" runat="server"></asp:TextBox></td>
                        <asp:RegularExpressionValidator ID="emailValidator" runat="server" ErrorMessage="your email is not valid"
                            ControlToValidate="email" ForeColor="Red" ValidationExpression="^[_\w\-]+(\.[_\w\-]+)*@[\w\-]+(\.[\w\-]+)*(\.[\D]{2,3})$">
                        </asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red"
                            ControlToValidate="email" runat="server" ErrorMessage="pleaase enter your email"></asp:RequiredFieldValidator>
                    </tr>
                    <tr><td><asp:Label ID="errorMsg" runat="server"></asp:Label></td></tr>
                </table>
                <br />
                <asp:Button ID="Button1" runat="server" Text="Subscribe" OnClick="Button1_Click" />
            </asp:View>

            <asp:View ID="View2" runat="server">
                <h3>Subscribe to mailing list</h3>
                <h4>You have successfully subscribed to our mailing list!</h4>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
