<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="prjWebCsFriendBookIvan.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Log In</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form#formLogin {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 300px;
        }

        div {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"], input[type="password"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        input[type="submit"], .button {
            background-color: #5cb85c;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        input[type="submit"]:hover, .button:hover {
            background-color: #449d44;
        }

        .error {
            color: red;
            font-weight: bold;
            margin-top: -10px;
            margin-bottom: 10px;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        body {
            cursor: url('/assets/cursor.cur'), default;
        }

        body:active {
            cursor: url('/assets/cursor-active.cur'), default;
        }

        input {
            cursor: url('/assets/cursor.cur'), default;
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
            <a href="inscription.aspx">Don't have an account?</a>
        </div>
    </form>
</body>
</html>
