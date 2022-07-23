<asp:BulletedList ID="BulletedList1" runat="server"></asp:BulletedList>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FileControl.ascx.cs" Inherits="UserControlls.FileControl" %>
<style>
    .FileContainer {
        width: 100%;
        padding: 5px 5px 5px 5px;
        margin-bottom: 10px;
        border: 1px solid  #cacecc;
        border-radius: 8px;
        text-align:center;
    }
    .FileContainer:hover {
        border-color: #abb4b5;
    }

    .FileController {
        padding-top: 0px;
        width:75%;
        height:100%;
    }
    input {
        display:inline;
    }

    .ClearBtn {
        padding-right:2px;
        text-align:center;
        width:35px;
        height:25px;
        cursor: pointer;
        border: 1px solid #3b4a50;
        margin: 0px 0px 0px 0px;
        background: #abb4b5;
        color: #fff;
        font-weight: bolder;
        border-radius:8px;
        transition: 0.5s;
    }
    .ClearBtn:hover {
        background: #e24c44;   
    }

    .UploadBtn {
        text-align:center;
        width:35px;
        height:25px;
        cursor: pointer;
        border: 1px solid #3b4a50;
        margin: 0px 0px 0px 0px;
        background: #abb4b5;
        color: #fff;
        font-weight: bolder;
        border-radius:8px;
        transition: 0.5s;
    }
    .UploadBtn:hover {
        background: #a5bf5c;  
    }
</style>
<script>
    function flClearSelection() {
        var input = document.querySelector('flFileUpload');
        var hidden = document.getElementById('<%=hfSerializado.ClientID%>');
        var check = document.getElementById('<%=CheckList.ClientID%>');
        hidden.value = null;
        input.value = null;
        check.innerHTML = "";
    }
    $(function () {
        $("[id*=btnClearFiles]").bind("click", function () {
            $("[id*=CheckList] option").remove();
            return false;
        });
    });
</script>
<div ID="uploadbox" class="FileContainer" >
    <asp:FileUpload ID="flFileUpload" class="FileController" runat="server" ClientIDMode="Static" AllowMultiple="true" EnableTheming="True" /> 
    <asp:Button ID="btnUpload" class="UploadBtn" runat="server" Text="➕" OnClick="btnUpload_Click" ToolTip="Fazer upload." /> 
    <asp:Button ID="btnClearFiles" class="ClearBtn" runat="server" Text="✖️ " OnClientClick="return flClearSelection(this);" ToolTip="Limpar arquivos." />
</div>
<asp:ListBox ID="CheckList" runat="server" ClientIDMode="Static" Width="100%" Rows="3"></asp:ListBox>

<asp:RegularExpressionValidator ID="revFiles" runat="server" ControlToValidate="flFileUpload" ErrorMessage="" ValidationExpression="" ></asp:RegularExpressionValidator>
<asp:HiddenField ID="hfSerializado" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hfExt" runat="server" />