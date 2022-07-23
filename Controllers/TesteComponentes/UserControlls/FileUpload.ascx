<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FileUpload.ascx.cs" Inherits="ControllersTeste.UserControlls.FileUpload" %>

<style>
    .btnClearFiles {        
        border: 1px solid #333;
        padding: 10px;
        margin: 5px;
        background: #777;
        color: #fff;
    }
</style>
<script>
    function flClearSelection() {
        const input = document.querySelector('flFileUpload');
        input.value = null; 
    }
</script>
<div id="Uploadbox" OnClientClick="return flClearSelection(this);">
    <asp:FileUpload ID="flFileUpload" runat="server" AllowMultiple="True" width="80%" style="display: inline-block; border:none;" />
    <asp:Button ID="btnClearFiles" runat="server" OnClientClick="return flClearSelection(this);" class="btn btn-default" Text="Limpar" width="20%" Height="100%" style="display: inline-block;" />            
</div>