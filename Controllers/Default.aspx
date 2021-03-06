<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Controllers._Default" %>
<%@ Register src="UserControlls/Snackbar.ascx" TagName="Snackbar" TagPrefix="Marelso" %>
<%@ Register src="UserControlls/FileControl.ascx" TagName="FileUpload" TagPrefix="Marelso" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <Marelso:Snackbar ID="Snackbar" runat="server" />

    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div>
            
        </div>
        <div class="col-md-4">
            <h2>Snackbar</h2>
            <p>
                Pressione o botão para exibir a snackbar.
            </p>
            <p Onclick="btnSnackbar_Click">
                <asp:Button ID="btnSnackbar" class="btn btn-default" runat="server" Text="Show Snackbar &raquo;" Onclick="btnSnackbar_Click" />
            </p>
        </div>
        <div class="col-md-4">
            <h2>File upload</h2>
            <p>
                Faça a importação de algum arquivo no botão abaixo.
            </p>
            
            <Marelso:FileUpload ID="flFiles" class="test" runat="server" Extensions=".xml"></Marelso:FileUpload>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
