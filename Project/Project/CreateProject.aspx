<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="CreateProject.aspx.cs" Inherits="FinalProject.CreateProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <br />
    <br />
    <br />

        <div class="container well">
            <h1>Create new Project/Thesis</h1>
            <div>
                <asp:Label ID="errorMsg" runat="server" Text=""></asp:Label>
                <asp:ValidationSummary ID="ValidationSummary1"
                    HeaderText="You must enter a value in the following fields:"
                    DisplayMode="BulletList"
                    EnableClientScript="true"
                    runat="server" />
            </div>
            <div class="form-group">
                <label for="projectName">Project Name:</label>
                <asp:TextBox ID="projectName" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Project Name is missing!" ControlToValidate="projectName" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="projectAbstract">Abstract:</label>
                <asp:TextBox ID="projectAbstract" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Abstract is missing!" ControlToValidate="projectAbstract" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="courseNumber">Course Number:</label>
                <asp:TextBox ID="courseNumber" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Course Number is missing!" ControlToValidate="courseNumber" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="semester">Semester:</label>
                <asp:TextBox ID="semester" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Semester is missing!" ControlToValidate="semester" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="liveLink">Live Link:</label>
                <asp:TextBox ID="liveLink" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="screencastLink">Screencast Link:</label>
                <asp:TextBox ID="screencastLink" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="keywords">Project Keywords: </label>
                <asp:TextBox ID="keywords" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <hr />

            <div class="form-group">
                <label for="committeChair">Committee Chair:</label>
                <asp:TextBox ID="committeChair" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Committee Chair is missing!" ControlToValidate="committeChair" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="committeChairEmail">Committee Chair Email:</label>
                <asp:TextBox ID="committeChairEmail" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Committee Chair Email is missing!" ControlToValidate="committeChairEmail" Display="None"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="committeMember1">Committee Member 1:</label>
                <asp:TextBox ID="committeMember1" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Committee Member 1 is missing!" ControlToValidate="committeMember1" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="committeMember1Email">Committee Member 1 Email:</label>
                <asp:TextBox ID="committeMember1Email" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Committee Member 1 Email is missing!" ControlToValidate="committeMember1Email" Display="None"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="committeMember2">Committee Member 2:</label>
                <asp:TextBox ID="committeMember2" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Committee Member 2 is missing!" ControlToValidate="committeMember2" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="committeMember2Email">Committee Member 2 Email:</label>
                <asp:TextBox ID="committeMember2Email" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Committee Member 2 Email is missing!" ControlToValidate="committeMember2Email" Display="None"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="committeAdvisor">Committee Advisor:</label>
                <asp:TextBox ID="committeAdvisor" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Committee Advisor is missing!" ControlToValidate="committeAdvisor" Display="None"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="committeAdvisorEmail">Committee Advisor Email:</label>
                <asp:TextBox ID="committeAdvisorEmail" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Committee Advisor Email is missing!" ControlToValidate="committeAdvisorEmail" Display="None"></asp:RequiredFieldValidator>
            </div>
            <asp:Button ID="submit" CssClass="btn btn-default" runat="server" Text="Create Project" OnClick="submit_Click" />
        </div>

</asp:Content>
