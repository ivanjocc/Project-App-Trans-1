<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="prjWebCsFriendBookIvan.login" %>

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
    <form id="formLogin" runat="server">
        <div>
            <asp:Label runat="server" AssociatedControlID="txtUsername" Text="Username:" />
            <asp:TextBox ID="txtUsername" runat="server" />
        </div>
        <div>
            <asp:Label runat="server" AssociatedControlID="txtPassword" Text="Password:" />
            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" />
        </div>
        <div>
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        </div>
        <div>
            <asp:Label ID="lblError" runat="server" Text="" CssClass="error"></asp:Label>
        </div>
        <div>
            <a href="inscription.aspx">Register?</a>
        </div>
    </form>
</body>
</html>
