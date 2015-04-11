<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Approval.aspx.cs" Inherits="FinalProject.Approval" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <br />
    <br />
    <br />
    <div class="container well">
        <div class="form-group">
                <label for="Comments">Comments:</label>
                <asp:TextBox ID="Comments" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control"></asp:TextBox>
            </div>
        <br />

        <asp:Button ID="Approve" runat="server" Text="Approve" CssClass="btn btn-success btn-lg" OnClick="Approve_Click" />
        <asp:Button ID="Disapprove" runat="server" Text="Disapprove" CssClass="btn btn-danger btn-lg" OnClick="Disapprove_Click"/>
    </div>
</asp:Content>
