<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="FinalProject.signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h1>Sign Up</h1>
            </div>
            <div class="panel-body">
                <div>
                    <asp:Label ID="errorMsg" runat="server" Text=""></asp:Label>
                    <asp:ValidationSummary ID="ValidationSummary1"
                        HeaderText="You must enter a value in the following fields:"
                        DisplayMode="BulletList"
                        EnableClientScript="true"
                        runat="server" />
                </div>
                <div class="form-group">
                    <label for="firstName">First Name:</label>
                    <asp:TextBox ID="firstName" CssClass="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name is missing!" ControlToValidate="firstName" Display="None"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name:</label>
                    <asp:TextBox ID="lastName" CssClass="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name is missing!" ControlToValidate="lastName" Display="None"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="userID">User ID:</label>
                    <asp:TextBox ID="userID" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="UserID is missing!" ControlToValidate="userID" Display="None"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <asp:TextBox ID="password" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Password is missing!" ControlToValidate="password" Display="None"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Both field must be have the same value! " ControlToCompare="password" ControlToValidate="confirmPassword" Operator="Equal" Display="None"></asp:CompareValidator>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password:</label>
                    <asp:TextBox ID="confirmPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <asp:TextBox ID="email" CssClass="form-control" TextMode="Email" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Email is missing!" ControlToValidate="email" Display="None"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="securityQuestion">Security Question:</label>
                    <asp:TextBox ID="securityQuestion" CssClass="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Security Question is missing!" ControlToValidate="securityQuestion" Display="None"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="securityAnswer">Security Answer:</label>
                    <asp:TextBox ID="securityAnswer" CssClass="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Security Answer is missing!" ControlToValidate="securityAnswer" Display="None"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="accountReason">Account Reason:</label>
                    <asp:TextBox TextMode="MultiLine" Rows="4" ID="accountReason" CssClass="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Account Reason is missing!" ControlToValidate="accountReason" Display="None"></asp:RequiredFieldValidator>
                </div>
                <asp:Button ID="submit" CssClass="btn btn-default" runat="server" Text="Sign up" OnClick="submit_Click" />
            </div>
        </div>
    </div>

</asp:Content>
