<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createMessage.aspx.cs" Inherits="prjWebCsFriendBookIvan.createMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            font-family: 'Arial', sans-serif;
            background-color: #ffebee;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        form#formCreateMessage {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 500px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        input[type="text"], textarea, .aspNetDisabled {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .button, input[type="submit"] {
            background-color: #ff4081;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            text-transform: uppercase;
            font-weight: bold;
        }

        .button:hover, input[type="submit"]:hover {
            background-color: #e91e63;
        }

        .error {
            color: #d32f2f;
            font-weight: bold;
            margin-top: -15px;
            margin-bottom: 15px;
        }

        a {
            text-decoration: none;
            color: #2196f3;
            font-weight: bold;
            display: inline-block;
            margin-top: 20px;
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
    <form id="formCreateMessage" runat="server">
        <div>
            <asp:Label ID="lblToUserID" runat="server" Text="Recipient ID: " />
            <asp:TextBox ID="txtToUserID" runat="server" />
        </div>
        <div>
            <asp:Label ID="lblContent" runat="server" Text="Message Content:" /><br />
            <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Rows="5" Columns="50" />
        </div>
        <div>
            <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" /><br />
            <asp:Label ID="lblMessage" runat="server" CssClass="error" />
        </div>
        <a href="dashboard.aspx">Return to Dashboard</a>
    </form>
</body>
</html>
