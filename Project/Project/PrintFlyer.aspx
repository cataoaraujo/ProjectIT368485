<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="PrintFlyer.aspx.cs" Inherits="FinalProject.PrintFlyer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }

        @page {
            size: auto; /* auto is the current printer page size */
            margin: 0mm; /* this affects the margin in the printer settings */
            
        }

        body {
            background-color: #FFFFFF;
            text-align: center;
            vertical-align:central;
            margin: 0px; /* the margin on the content before printing */
        }
        h3 {
            font-family:Arial Black;
        }
        #DetailsView1 {
            color:#333333;
            
        }
        .footer {
            display:none;
        }

        @media print {
            .no-print, .no-print * {
                display: none !important;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div>
        <br />
        <br />
        <br />
        <asp:MultiView ID="MultiView1" ActiveViewIndex="0" runat="server">
            <asp:View ID="View1" runat="server">
                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="name" OnRowCommand="GridView1_SelectedIndexChanged"
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="5" ForeColor="Black" GridLines="Horizontal"
                    RowStyle-HorizontalAlign="left" RowStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" Height="200px" Width="400px"
                    RowStyle-Height="30" HeaderStyle-Height="30">
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="Project" SortExpression="name" />
                        <asp:BoundField DataField="presentationDate" HeaderText="Date" SortExpression="presentationDate" />
                        <asp:BoundField DataField="presentationPlace" HeaderText="Place" SortExpression="presentationPlace" />
                        <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Flyer" ShowHeader="True" Text="Generate Flyer" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:it368485_FinalProjectConnectionString %>"
                    SelectCommand="SELECT [name], [presentationDate], [presentationPlace] FROM [Project]"></asp:SqlDataSource>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <table>
                    <tr>
                         <td colspan="2" align="center">
                            <h3>Presentation</h3>
                        </td>
                    </tr>
                    <tr>
                        <td align ="center">
                            <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="SqlDataSource2" CellPadding="4" CellSpacing="5" ForeColor="#333333" GridLines="None" Height="143px" Width="417px" 
                                AutoGenerateRows="False" HorizontalAlign="Center" RowStyle-HorizontalAlign="Center">
                                <AlternatingRowStyle BackColor="White" />
                                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                                <EditRowStyle BackColor="#2461BF" />
                                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                                <Fields>
                                    <asp:TemplateField HeaderText="Student Name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("firstName") + " " + Eval("lastName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" Visible="false" />
                                    <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" Visible="false" />
                                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                    <asp:BoundField DataField="presentationDate" HeaderText="Date" SortExpression="presentationDate" />
                                    <asp:BoundField DataField="presentationPlace" HeaderText="presentationPlace" SortExpression="presentationPlace" />
                                </Fields>
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                            </asp:DetailsView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:it368485_FinalProjectConnectionString %>"
                                SelectCommand="SELECT UserAccount.firstName, UserAccount.lastName, Project.name, Project.presentationDate, Project.presentationPlace FROM Project INNER JOIN UserAccount ON Project.student_id = UserAccount.id INNER JOIN Committee ON Project.id = Committee.project_id WHERE (Project.name = @name)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridView1" DefaultValue="GridView1.name" Name="name" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                   </tr>
                   <tr>
                        <td align="right">
                            <asp:Button ID="Button1" runat="server" Text="Print" OnClientClick="javascript:window.print()"  class='no-print' />
                        </td>
                   </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
