<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Options.aspx.cs" Inherits="FinalProject.Projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <br />
    <br />
    <br />
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3 well">
                <div class="list-group">
                    <a href="#" class="list-group-item">Edit User Information</a>
                    <a href="CreateProject.aspx" class="list-group-item">Create New Project</a>
                    <a href="#" class="list-group-item">Something...</a>
                    <a href="#" class="list-group-item">Something...</a>
                </div>
            </div>
            <div class="col-md-8 col-sm-offset-1 well">
                <h1>User Projects</h1>
                <p>List of projects... And the link to open the details of the project, (this will have the option to submit the files [PreliminaryProjectProposal, FinalProjectProposal, ProjectPresentationScheduling] )</p>
                <a href="CreateProject.aspx" class="btn btn-primary">Create New Project</a>
            </div>
        </div>
    </div>
</asp:Content>
