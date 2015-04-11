<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ProjectDetail.aspx.cs" Inherits="FinalProject.ProjectDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <br />
    <br />
    <br />
    Show Details of the project! (get the project from the id sent by the METHOD="GET"

    <ul>
        <asp:ListView ID="DocumentList" runat="server" RepeatDirection="Horizontal">
            <ItemTemplate>
                <li><a href="<%# Eval("link") %>"><%# Eval("name") %></a></li>
            </ItemTemplate>
        </asp:ListView>
    </ul>
</asp:Content>
