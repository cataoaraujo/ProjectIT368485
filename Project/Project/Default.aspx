<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FinalProject.Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="120000">
    </asp:Timer>

    <h1 style="text-align: center;">Highlights</h1>
    <div class="container well">

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>
                <div class="row">
                    <asp:ListView ID="ProjectList" runat="server" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <h3></h3>
                            <p></p>

                            <div class="col-md-4">
                                <h2><%# Eval("name") %></h2>
                                <p><%# Eval("projectAbstract") %></p>
                                <p><a class="btn btn-default" href="Viewprojectdetails.aspx?PrjId=<%# Eval("id") %>" role="button">View details »</a></p>
                            </div>

                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" />
            </Triggers>

        </asp:UpdatePanel>

    </div>



</asp:Content>
