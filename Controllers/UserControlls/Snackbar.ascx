<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Snackbar.ascx.cs" Inherits="UserControlls.Snackbar" %>

<style>
    :root {
        --tempo: 3s;
    }

    #snackbar {
        visibility: hidden;
        min-width: 250px;
        margin-left: -125px;
        background-color: #222e38;
        color: #fff;
        text-align: center;
        border-radius: 2px;
        padding: 16px;
        position: fixed;
        z-index: 1;
        left: 50%;
        bottom: 30px;
        font-size: 17px;
    }

    #snackbar.show {
        visibility: visible;
        -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
        animation: fadein 0.5s, fadeout 0.5s 2.5s;
    }

    @-webkit-keyframes fadein {
        from {bottom: 0; opacity: 0;} 
        to {bottom: 30px; opacity: 1;}
    }

    @keyframes fadein {
        from {bottom: 0; opacity: 0;}
        to {bottom: 30px; opacity: 1;}
    }

    @-webkit-keyframes fadeout {
        from {bottom: 30px; opacity: 1;} 
        to {bottom: 0; opacity: 0;}
    }

    @keyframes fadeout {
        from {bottom: 30px; opacity: 1;}
        to {bottom: 0; opacity: 0;}
    }
</style>

<script>
    function ShowSnackbar(tempo) {
        var bar = document.getElementById("snackbar");
        bar.className = "show";
        setTimeout(function () { bar.className = bar.className.replace("show", ""); }, tempo);
    }
    
    function SetSnackbarTime(tempo) {
        var css = document.querySelector(':root');
        tempo = (tempo / 1000) - 1;
        css.style.setProperty('--tempo', tempo);
    }
</script>

<div id="snackbar">
    <asp:Label ID="lblText" runat="server" width="100%" ></asp:Label>
</div>