<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Options.aspx.cs" Inherits="FinalProject.Options" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <br />
    <br />
    <br />
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3 well">
                <div class="list-group">
                    <a href="#" class="list-group-item">Edit User Information</a>
                    <a href="CreateProject.aspx" class="list-group-item">Create New Project</a>
                    <a href="#" class="list-group-item">Something...</a>
                    <a href="#" class="list-group-item">Something...</a>
                </div>
            </div>
            <div class="col-md-8 col-sm-offset-1 well">
                <h1>User Projects</h1>

                <table class="table table-striped">
                    <tr>
                        <th>Project Name</th>
                        <th>Preliminary Proposal</th>
                        <th>Final</th>
                        <th>Presentation Scheduling</th>
                    </tr>
                    <asp:ListView ID="ProjectList" runat="server" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <tr>
                                <td><a href="Viewprojectdetails.aspx?PrjId=<%# Eval("id") %>"><b><%# Eval("name") %></b></a></td>
                                <td>
                                    <label><%# preliminaryStatus(Convert.ToInt32(Eval("id"))) %></label></td>
                                <td>
                                    <label><%# finalStatus(Convert.ToInt32(Eval("id"))) %></label></td>
                                <td>
                                    <label><%# presentationStatus(Convert.ToInt32(Eval("id"))) %></td>
                                <td>
                                    <label><%# exportToXML(Convert.ToInt32(Eval("id"))) %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </table>

                <a href="CreateProject.aspx" class="btn btn-primary">Create New Project</a>
            </div>
        </div>
    </div>
</asp:Content>
