<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Snackbar.ascx.cs" Inherits="ControllersTeste.UserControlls.Snackbar" %>

<style>
    :root {
      --tempo: #1e90ff;
    }
    #snackbar {
      visibility: hidden;
      min-width: 250px;
      margin-left: -125px;
      background-color: #333;
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
      -webkit-animation: fadein 1.5s, fadeout 0.5s var(--tempo)s;
      animation: fadein 1.5s, fadeout 0.5s var(--tempo)s;
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

<div id="snackbar">
    <asp:Label ID="lblText" runat="server" width="100%" />
</div>

<script>
    var r = document.querySelector(':root');

    function ShowSnackbar(tempo) {

        var x = document.getElementById("snackbar");
        x.className = "show";
        
        setTimeout(function () { x.className = x.className.replace("show", ""); }, (tempo));
    }
    function SetSnackbarTime(tempo) {
        tempo = (tempo / 1000) - 1;
        console.log(tempo);
        r.style.setProperty('--tempo', tempo);
    }
</script>