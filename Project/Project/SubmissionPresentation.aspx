<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="SubmissionPresentation.aspx.cs" Inherits="FinalProject.SubmissionPresentation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="container well">
        <h1>Submission of Presentation Scheduling</h1>
        <div class="form-group">
            <label for="FileUploadControl">Select File:</label>
            <asp:FileUpload ID="FileUploadControl" CssClass="form-control" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="You need to select a File!" ControlToValidate="FileUploadControl"></asp:RequiredFieldValidator>
        </div>
        <asp:Label runat="server" ID="StatusLabel" Text="Upload status: " /><br />
        <asp:Button runat="server" CssClass="btn btn-default" ID="UploadButton" Text="Upload" OnClick="UploadButton_Click" />
    </div>
</asp:Content>
