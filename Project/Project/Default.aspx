<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FinalProject.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <br />
    <br />
    <br />
    <form id="form1" runat="server">
    <div class="jumbotron">
      <h1>Thesis/Project</h1>
      <p>This is a piece of the summary</p>
      <p><h3> Highlights</h3></p>
            
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
      <p><a class="btn btn-primary btn-lg" href="#" role="button">See More</a></p>
    </div>
    </form>
</asp:Content>
