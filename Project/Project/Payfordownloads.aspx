<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payfordownloads.aspx.cs" Inherits="Project_search.Payfordownloads" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 201px;
        }
        .auto-style3 {
            width: 238px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1> Enter your valid credit card details </h1>

        <table class="auto-style1">
            <tr>
                <td class="auto-style2" >Choose your  Credit Card type :&nbsp;</td>
                <td class="auto-style3">&nbsp;<asp:DropDownList  ID="CardType" runat="server">
                                    <asp:Listitem>Choose</asp:Listitem>
                                    <asp:Listitem>AmericanExpress</asp:Listitem>  
                                    <asp:Listitem>MasterCard</asp:Listitem>
                                    <asp:Listitem>Visa</asp:Listitem>
                                    </asp:DropDownList> </td>
                <td><asp:Label ID="Label_VC" runat="server" Text="<b>RESULT:</b>"></asp:Label></td>
                <td>&nbsp;</td>
            </tr>
           
             <tr>
                <td class="auto-style2" >&nbsp;CreditCard Number</td>
                <td class="auto-style3">&nbsp;<asp:Textbox ID="Text_CCnum" runat="server" Text=""> </asp:Textbox> </td>
                <td>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                 </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;Email</td>
                <td class="auto-style3">&nbsp;<asp:Textbox ID="Text_Email" runat="server" Text=""> </asp:Textbox></td>
                <td>
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;Customer Number</td>
                <td class="auto-style3">&nbsp;<asp:Textbox ID="Text_Custnum" runat="server" Text=""> </asp:Textbox></td>
                <td>
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
             <tr>
                <td class="auto-style2">&nbsp;Zip Code</td>
                <td class="auto-style3">&nbsp;<asp:Textbox ID="Text_Zip" runat="server" Text=""> </asp:Textbox></td>
                <td>
                    <asp:Label ID="Label4" runat="server"></asp:Label>
                 </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;<asp:Button ID="Button1" runat="server" Text="Submit" /></td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>



    </div>
    </form>
    </body>
