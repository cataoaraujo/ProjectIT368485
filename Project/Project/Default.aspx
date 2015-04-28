<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FinalProject.Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="120000">
    </asp:Timer>


    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h1 style="text-align: center;">Highlights</h1>
            </div>
            <div class="panel-body">

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                    <ContentTemplate>
                        <div class="container-fluid">
                            <div class="row">
                                <ul class="thumbnails list-unstyled">
                                    <asp:ListView ID="ProjectList" runat="server" RepeatDirection="Horizontal">
                                        <ItemTemplate>
                                            <li class="col-md-3">
                                                <div class="thumbnail" style="padding: 0">
                                                    <div class="caption">
                                                        <h2><%# Eval("name") %></h2>
                                                        <p><%# Eval("projectAbstract") %></p>
                                                        <p><small><span class="glyphicon glyphicon-user"></span><%# Eval("user.firstName") %> <%# Eval("user.lastName") %></small></p>
                                                    </div>
                                                    <div class="modal-footer" style="text-align: left">
                                                        <div class="progress">
                                                            <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%# Eval("percentageDone") %>%;">
                                                                <span class=""><%# Eval("percentageDone") %>% Complete</span>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <a class="btn btn-default btn-success" href="Viewprojectdetails.aspx?PrjId=<%# Eval("id") %>" role="button">View details »</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </ul>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Timer1" />
                    </Triggers>

                </asp:UpdatePanel>

            </div>
        </div>
    </div>



</asp:Content>
