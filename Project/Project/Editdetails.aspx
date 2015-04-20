<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Editdetails.aspx.cs" Inherits="Project_search.Editdetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong>&nbsp;<table class="auto-style1">
            <tr>
                <td class="auto-style2">
    
        <strong>Project Id :&nbsp;</strong></td>
                <td class="auto-style3"><strong> <asp:TextBox ID="TextBox_PID" runat="server" Width="240px"></asp:TextBox>
    
                    </strong> </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Project Name</strong> :&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td class="auto-style3"> <asp:TextBox ID="TextBox_name" runat="server" Width="239px" style="margin-left: 0px"></asp:TextBox>
    
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
        <strong>Student_id&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
                <td class="auto-style3"><asp:TextBox ID="TextBox_Student_id" runat="server" Width="241px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
            <strong>CourseNumber&nbsp; </strong>&nbsp; </td>
                <td class="auto-style3">
            <asp:TextBox ID="TextBox_CourseNumber" runat="server" Width="239px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
            <strong>LiveLink&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></td>
                <td class="auto-style3">
            <asp:TextBox ID="TextBox_LiveLink" runat="server" Width="239px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
            <strong>Abstract&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
                </td>
                <td class="auto-style3">
            <asp:TextBox ID="TextBox_Abstract" runat="server" style="margin-left: 0px" Width="241px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
            <strong>Semester&nbsp;&nbsp; 

            </strong></td>
                <td class="auto-style3"><asp:TextBox ID="TextBox_Semester" runat="server" Width="242px" style="margin-left: 0px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
            <strong>ScreenCastLink</strong></td>
                <td class="auto-style3"><asp:TextBox ID="TextBox_ScreenCastLink" runat="server" Width="244px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>DateCreated&nbsp;&nbsp;&nbsp;&nbsp; 

            </strong></td>
                <td class="auto-style3">
            <asp:TextBox ID="TextBox_DateCreated" runat="server" Width="244px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
        <asp:Button ID="BtnUpdate_Click" runat="server" Height="34px" OnClick="BtnUpdate_Click1" style="margin-left: 61px" Text="Update" Width="114px" />
    
    
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
        <asp:Label ID="LblMsg" runat="server" Text="LblMsg"></asp:Label>
    
    
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
        <br />
    
    
    </form>

</body>
</html>
