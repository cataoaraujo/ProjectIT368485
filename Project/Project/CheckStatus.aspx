<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="CheckStatus.aspx.cs" Inherits="FinalProject.CheckStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h1>Check Status</h1>
            </div>
            <div class="panel-body">
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
        </div>
    </div>
</asp:Content>
