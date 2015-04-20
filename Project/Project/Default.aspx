<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FinalProject.Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <br />
    <br />
    <br />

    <div class="jumbotron">
        <p><a class="btn btn-primary btn-lg" href="Project_Search.aspx" role="button">Search Projects</a> <a class="btn btn-success btn-lg" href="Subscribe.aspx" role="button">Subscribe</a> <a class="btn btn-danger btn-lg" href="Unsubscribe.aspx" role="button">Unubscribe</a></p>
        <p></p>

        <h1>Thesis/Project</h1>
        <p>This is a piece of the summary</p>
        <p>
            <h3>Highlights</h3>
        </p>

        <p>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </p>
        <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="120000">
        </asp:Timer>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>
                <asp:Label ID="Label1" runat="server" TypeMode="MultiLine"></asp:Label>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" />
            </Triggers>

        </asp:UpdatePanel>

    </div>

</asp:Content>
