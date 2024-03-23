<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createMessage.aspx.cs" Inherits="prjWebCsFriendBookIvan.createMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .error {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="formCreateMessage" runat="server">
        <div>
            <asp:Label ID="lblToUserID" runat="server" Text="ID del Destinatario:" />
            <asp:TextBox ID="txtToUserID" runat="server" />
        </div>
        <div>
            <asp:Label ID="lblContent" runat="server" Text="Contenido del Mensaje:" /><br />
            <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Rows="5" Columns="50" />
        </div>
        <div>
            <asp:Button ID="btnSend" runat="server" Text="Enviar" OnClick="btnSend_Click" /><br />
            <asp:Label ID="lblMessage" runat="server" CssClass="error" />
        </div>
    </form>
</body>
</html>
