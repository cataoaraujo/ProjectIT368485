<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <br />
    <br />
    <br />
    <form runat="server">
        <div class="container well">
             <div>
                <asp:Label ID="errorMsg" runat="server" Text=""></asp:Label>
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1">User ID</label>
                <asp:TextBox ID="userID" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <asp:TextBox ID="password" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <asp:Button ID="submit" CssClass="btn btn-default" runat="server" Text="Sign in" OnClick="submit_Click" />
        </div>
    </form>
</asp:Content>
