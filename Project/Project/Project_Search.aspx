<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Project_Search.aspx.cs" Inherits="Project_search.Project_Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <script language="javascript" type="text/javascript">


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

            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;<strong>Enter Search term like keywords, coursenumber, abstract or semester</strong>
                        <asp:TextBox ID="txtSrch" runat="server"></asp:TextBox>
                        <asp:Button ID="BtnSearch" runat="server" Text="Search" OnClick="BtnSearch_Click" Width="85px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="GridView1" runat="server" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                            Visible="False" AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:BoundField DataField="name" HeaderText="Projectname" />
                                <asp:BoundField DataField="courseNumber" HeaderText="courseNumber" />
                                <asp:BoundField DataField="liveLink" HeaderText="liveLink" />
                                <asp:BoundField DataField="abstract" HeaderText="abstract" />
                                <asp:BoundField DataField="keyword" HeaderText="Keyword" />
                                <asp:BoundField DataField="dateCreated" HeaderText="Date Created" />
                                <asp:BoundField DataField="semester" HeaderText="Semester" />
                                <asp:TemplateField HeaderText="project_id" ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:Label ID="Lblprojectid" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="documentName" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LbldocumentName" runat="server" Text='<%# Eval("documentName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="documentLink" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LbldocumentLink" runat="server" Text='<%# Eval("documentLink") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="student_id" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="Lblstudentid" runat="server" Text='<%# Eval("student_id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Actions" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LnlEdit" runat="server" Text="Edit"></asp:LinkButton>
                                        &nbsp; &nbsp; &nbsp; 
                                    <asp:LinkButton ID="LnlView" runat="server" Text="View" CommandName="View"></asp:LinkButton>
                                        &nbsp; &nbsp; &nbsp; 
                            &nbsp; &nbsp; &nbsp; 
                                    <li><a href="<%# Eval("documentLink") %>"><%# Eval("documentName") %>Download</a></li>
                                        <asp:LinkButton ID="LnlDwn" runat="server" CommandName="download" Visible="false">Download</asp:LinkButton>

                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </div>

</asp:Content>
