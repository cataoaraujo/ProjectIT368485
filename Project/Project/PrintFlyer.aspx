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
            text-align:center;
            margin: 0px; /* the margin on the content before printing */
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
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <h3>Enter the following information to generate a flyer</h3>
                <p>
                    &nbsp;</p>
                <asp:Table ID="Table1" runat="server" HorizontalAlign="Center" BackColor="#CCFFFF" BorderWidth="2px" Height="240px" Width="526px">
                    <asp:TableRow>
                        <asp:TableCell>Student Name:</asp:TableCell>
                        <asp:TableCell><asp:TextBox ID="stdName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="stdName" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Thesis/Project Title:</asp:TableCell>
                        <asp:TableCell><asp:TextBox ID="prjTitle" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="prjTitle" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Schedule Time:</asp:TableCell>
                        <asp:TableCell><asp:TextBox ID="schTime" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="schTime" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Location:</asp:TableCell>
                        <asp:TableCell><asp:TextBox ID="loc" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="stdName" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                
                <br />
                
                <asp:Button ID="Button2" runat="server" Text="Generate Flyer" OnClick="Button2_Click" />
            </asp:View>
            <asp:View ID="View2" runat="server">

                <h3>Thesis/Project Presentation</h3>
                <br />
                <br />
                <table>
                    <tr>
                        <td>Student Name:</td>
                        <td>
                            <asp:Label ID="stdLabel" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Thesis/Project Title:</td>
                        <td>
                            <asp:Label ID="titleLabel" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Schedule Time:</td>
                        <td>
                            <asp:Label ID="timeLabel" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Location:</td>
                        <td>
                            <asp:Label ID="locLabel" runat="server"></asp:Label></td>
                    </tr>
                </table>
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" Text="Print Flyer" OnClientClick="javascript:window.print()" class='no-print' />
            </asp:View>
            <asp:View ID="View3" runat="server">
            </asp:View>
        </asp:MultiView>
        <asp:Panel ID="Panel1" runat="server" Visible="false">






        </asp:Panel>


    </div>
</asp:Content>
