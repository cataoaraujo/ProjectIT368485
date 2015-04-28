<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="SubmissionFinal.aspx.cs" Inherits="FinalProject.SubmissionFinal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h1>Submission of Final Proposal</h1>
            </div>
            <div class="panel-body">

                <div class="form-group">
                    <label for="FileUploadControl">Select File:</label>
                    <asp:FileUpload ID="FileUploadControl" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="You need to select a File!" ControlToValidate="FileUploadControl"></asp:RequiredFieldValidator>
                </div>
                <asp:Label runat="server" ID="StatusLabel" Text="Upload status: " /><br />
                <asp:Button runat="server" CssClass="btn btn-default" ID="UploadButton" Text="Upload" OnClick="UploadButton_Click" />
            </div>
        </div>
    </div>
</asp:Content>
