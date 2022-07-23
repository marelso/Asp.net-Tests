<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Controllers._Default" %>
<%@ Register src="UserControlls/Snackbar.ascx" TagName="Snackbar" TagPrefix="Controlls" %>
<%@ Register src="UserControlls/FileUpload.ascx" TagName="FileUpload" TagPrefix="Controlls" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <Controlls:Snackbar ID="Snackbar" runat="server" />

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
            <p>
                <div class="btn btn-default">
                    <%--<asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="True" width="80%" style="display: inline-block;" />
                    <asp:Button ID="Button1" class="btn btn-default" runat="server" Text="Button" width="20%" Height="100%" style="display: inline-block;" />--%>
                    <Controlls:FileUpload ID="Snackbar1" runat="server" />
                </div>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
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
