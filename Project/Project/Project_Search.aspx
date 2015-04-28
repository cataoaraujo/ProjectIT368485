<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Project_Search.aspx.cs" Inherits="Project_search.Project_Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <script type="text/javascript">
        function ViewProjectDetails(PrjId) {
            window.open("Viewprojectdetails.aspx?PrjId=" + PrjId, "", "location=0,status=0,scrollbars=1,width=850,height=600,resizable=yes");

        }
        function EditProjectDetails(PrjId) {
            window.open("Editdetails.aspx?PrjId=" + PrjId, "", "location=0,status=0,scrollbars=1,width=850,height=600,resizable=yes");

        }
    </script>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h1>Search</h1>
        </div>
        <div class="panel-body">
            <div class="row">
                <strong>Enter Search term like keywords, coursenumber, abstract or semester</strong>
                <asp:TextBox ID="txtSrch" runat="server"></asp:TextBox>
                <asp:Button ID="BtnSearch" runat="server" Text="Search" OnClick="BtnSearch_Click" Width="85px" />
            </div>
            <br />
            <br />
            <div class="row">
                <ul class="thumbnails list-unstyled">
                    <asp:ListView ID="SearchResult" runat="server" RepeatDirection="Horizontal">
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
                                            <div class="col-md-12">
                                                <%--<a class="" href="Viewprojectdetails.aspx?PrjId=<%# Eval("id") %>" role="button"></a>--%>
                                                <asp:Button ID="btView" runat="server" Text="View" CssClass="btn btn-default btn-primary" CommandArgument='<%# Eval("id") %>' CommandName="View" OnCommand="btView_Click" />
                                                <asp:Button ID="btEdit" runat="server" Text="Edit" CssClass="btn btn-default btn-success" CommandArgument='<%# Eval("id") %>' CommandName="Edit" OnCommand="btView_Click" />
                                                <%--<asp:Button ID="btDwn" runat="server" Text="Download" CssClass="btn btn-default btn-success" OnClick="btView_Click"  CommandArgument="<%# Eval("id") %>" CommandName="download"/>--%>
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
    </div>

</asp:Content>
