<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="CheckStatus.aspx.cs" Inherits="FinalProject.CheckStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <br />
    <br />
    <br />
    <div class="container well">
        <table class="table table-striped">
            <tr>
                <th>Name</th>
                <th>Type</th>
                <th>Status</th>
                <th>Comments</th>
            </tr>
            <asp:ListView ID="StatusList" runat="server" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("name") %></td>
                        <td><%# Eval("type") %></td>
                        <td><%# Eval("hasApproved") %></td>
                        <td><%# Eval("comment") %></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </table>
    </div>
</asp:Content>
