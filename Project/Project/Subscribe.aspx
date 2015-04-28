<%@ Page Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Subscribe.aspx.cs" Inherits="FinalProject.Subscribe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="container well">
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <h3>Subscribe to mailing list</h3>
                <h4>Please provide the keyword(s), separating them by space, and your email address to subscribe to our mailing list</h4>


                <div class="form-horizontal">

                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">Keywords</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="keyword" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="keyword" runat="server" ErrorMessage="please enter keywords"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="email" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="emailValidator" runat="server" ErrorMessage="your email is not valid" ControlToValidate="email" ForeColor="Red" ValidationExpression="^[_\w\-]+(\.[_\w\-]+)*@[\w\-]+(\.[\w\-]+)*(\.[\D]{2,3})$"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="email" runat="server" ErrorMessage="pleaase enter your email"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <asp:Button ID="Button1" runat="server" Text="Subscribe Now!" OnClick="Button1_Click" CssClass="btn btn-default"/>
                        </div>
                    </div>

                    <asp:Label ID="errorMsg" runat="server"></asp:Label>
                </div>

            </asp:View>

            <asp:View ID="View2" runat="server">
                <h3>Subscribe to mailing list</h3>
                <h4>You have successfully subscribed to our mailing list!</h4>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
