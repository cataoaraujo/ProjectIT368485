<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Viewprojectdetails.aspx.cs" Inherits="Project_search.Viewprojectdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 133px;
        }

        .auto-style3 {
            width: 249px;
        }
    </style>
    <div class="container well">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Project Id :&nbsp;</td>

                <td>
                    <asp:Label ID="LblProjectId" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Project Name :&nbsp;&nbsp;&nbsp;&nbsp;</td>

                <td>


                    <asp:Label ID="LblProjectName" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Student_id&nbsp;&nbsp;&nbsp;&nbsp;</td>

                <td>


                    <asp:Label ID="LblStudID" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">CourseNumber&nbsp; &nbsp; </td>

                <td>


                    <asp:Label ID="LblCourName" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">LiveLink&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>

                <td>
                    <a href="#" id="lnkLiveLink" runat="server" style="color: #0000FF">View </a>

                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Abstract&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                </td>

                <td>


                    <asp:TextBox ID="TextBox_Abstract" runat="server" Style="margin-left: 0px" Width="294px" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Semester&nbsp;&nbsp; 

                </td>

                <td>


                    <asp:Label ID="LblSem" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">ScreenCastLink</td>

                <td>


                    <asp:Label ID="LblSrnCast" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">DateCreated&nbsp;&nbsp;&nbsp;&nbsp; 

                </td>

                <td>


                    <asp:Label ID="LblCreatedON" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Highlighted</td>

                <td>


                    <asp:Label ID="LblHlght" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <%--<asp:Button ID="BtnUpdate_Click" runat="server" Height="34px" OnClick="Button1_Click" style="margin-left: 61px" Text="Update" Width="114px" />--%>
    
    
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <strong>Similar Projects </strong></td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>


        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="334px" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="student_id" HeaderText="student_id" SortExpression="student_id" />
                <asp:BoundField DataField="courseNumber" HeaderText="courseNumber" SortExpression="courseNumber" />
                <asp:BoundField DataField="liveLink" HeaderText="liveLink" SortExpression="liveLink" />
                <asp:BoundField DataField="abstract" HeaderText="abstract" SortExpression="abstract" />
                <asp:BoundField DataField="screencastLink" HeaderText="screencastLink" SortExpression="screencastLink" />
                <asp:BoundField DataField="semester" HeaderText="semester" SortExpression="semester" />
                <asp:BoundField DataField="dateCreated" HeaderText="dateCreated" SortExpression="dateCreated" />
                <asp:CheckBoxField DataField="highlighted" HeaderText="highlighted" SortExpression="highlighted" />
                <asp:BoundField DataField="keyword" HeaderText="keyword" SortExpression="keyword" />
                <asp:BoundField DataField="documentName" HeaderText="documentName" SortExpression="documentName" />
                <asp:BoundField DataField="documentLink" HeaderText="documentLink" SortExpression="documentLink" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Database %>" SelectCommand="SELECT P.id, P.name, P.student_id, P.courseNumber, P.liveLink, P.abstract, P.screencastLink, P.semester, P.dateCreated, P.highlighted, Ky.keyword, DS.documentName, DS.documentLink FROM Project AS P LEFT OUTER JOIN ProjectSubmission AS PD ON P.id = PD.project_id LEFT OUTER JOIN Documents AS DS ON DS.id = PD.document_id INNER JOIN ProjectKeywords AS PK ON P.id = PK.project_id INNER JOIN Keyword AS Ky ON Ky.id = PK.keyword_id WHERE (Ky.keyword IN (SELECT keyword FROM Keyword WHERE (id IN (SELECT keyword_id FROM ProjectKeywords WHERE (project_id = @PrjId)))))">
            <SelectParameters>
                <asp:QueryStringParameter Name="PrjId" QueryStringField="PrjId" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
