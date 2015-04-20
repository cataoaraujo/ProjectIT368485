<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Viewprojectdetails.aspx.cs" Inherits="Project_search.Viewprojectdetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>view project details</title>
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
    
       <table class="auto-style1">
            <tr>
                <td class="auto-style2">
    
       Project Id :&nbsp;</td>
               
                <td>
                    <asp:Label ID="LblProjectId" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"> Project Name :&nbsp;&nbsp;&nbsp;&nbsp;</td>
                 
                <td>
    
       
                    <asp:Label ID="LblProjectName" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
       Student_id&nbsp;&nbsp;&nbsp;&nbsp;</td>
                
                <td>
    
       
                    <asp:Label ID="LblStudID" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
           CourseNumber&nbsp; &nbsp; </td>
               
                <td>
    
       
                    <asp:Label ID="LblCourName" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
           LiveLink&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                
                <td>
                    <a href="#" id="lnkLiveLink"  runat="server" style="color:#0000FF">View </a>

                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
           Abstract&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                </td>
                 
                <td>
    
       
            <asp:TextBox ID="TextBox_Abstract" runat="server" style="margin-left: 0px" Width="294px" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
           Semester&nbsp;&nbsp; 

            </td>
                
                <td>
    
       
                    <asp:Label ID="LblSem" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
           ScreenCastLink</td>
                
                <td>
    
       
                    <asp:Label ID="LblSrnCast" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"> DateCreated&nbsp;&nbsp;&nbsp;&nbsp; 

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
                    &nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
     
    </form>
</body>
</html>
