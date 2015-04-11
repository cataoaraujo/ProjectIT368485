<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="RetrievePassword.aspx.cs" Inherits="FinalProject.RetrievePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <br />
    <br />
    <br />
    <div class="container well">

        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <p>Please provide your User Id to proceed further</p>
                <asp:Label ID="errorMsg" runat="server"></asp:Label><br />
                User Id:
                <asp:TextBox ID="userId" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
            </asp:View>


            <asp:View ID="View2" runat="server">
                <p>You need to answer this question to be able to change your password</p>
                <asp:Label ID="errorLbl" runat="server"></asp:Label>
                <br />
                Security Question:
                <asp:Label ID="secQuestion" runat="server"></asp:Label>
                <br />
                Security Answer:&nbsp;
                <asp:TextBox ID="secAnswer" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="Button2" runat="server" Text="Submit" OnClick="Button2_Click" />
                <br />

            </asp:View>

            <asp:View ID="View3" runat="server">
                <p>You can now change your password</p>
                <table>
                    <tr>
                        <td>New Password: </td>
                        <td>
                            <asp:TextBox ID="Password" TextMode="Password" runat="server"></asp:TextBox></td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is a Required Field" ControlToValidate="Password"></asp:RequiredFieldValidator>
                    </tr>
                    <tr>

                        <td>Confirm Password:</td>
                        <td>
                            <asp:TextBox ID="confirmPwd" TextMode="Password" runat="server"></asp:TextBox></td>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords do not match" ControlToCompare="Password" ControlToValidate="confirmPwd"></asp:CompareValidator>

                    </tr>
                </table>
                <asp:Button ID="changePwd" runat="server" Text="Ok" OnClick="changePwd_Click" />

            </asp:View>
        </asp:MultiView>
    </div>

    <asp:Label ID="msg" runat="server"></asp:Label>
    <asp:Label ID="msg2" runat="server"></asp:Label>
</asp:Content>


