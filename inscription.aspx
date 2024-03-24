<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inscription.aspx.cs" Inherits="prjWebCsFriendBookIvan.inscription" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inscription</title>
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <style type="text/css">
        body {
            font-family: 'Arial', sans-serif;
            background-color: #ffe0b2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form#formRegister {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.2);
            width: 400px;
        }

        div {
            margin-bottom: 20px;
        }

        label, a {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"], input[type="password"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .button, input[type="submit"] {
            background-color: #ff7043;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        .button:hover, input[type="submit"]:hover {
            background-color: #f4511e;
        }

        .error {
            color: #d32f2f;
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
    <form id="formRegister" runat="server">
        <div>
            Username: <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox><br />
            Password: <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox><br />
            Email: <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><br />
            Sex: <asp:DropDownList ID="ddlSex" runat="server">
                 </asp:DropDownList><br />
            Birth Date: <asp:TextBox ID="txtBirthDate" runat="server"></asp:TextBox><br />
            Ethnic Group: <asp:DropDownList ID="ddlEthnicGroup" runat="server"></asp:DropDownList><br />
            Search Reason: <asp:DropDownList ID="ddlSearchReason" runat="server"></asp:DropDownList><br />
            <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" /><br />

            <asp:Label ID="lblError" runat="server" CssClass="error"></asp:Label><br />

            <a href="login.aspx">Already have an account?</a>
        </div>
    </form>

    <script type="text/javascript">
        $(function () {
            $("#<%= txtBirthDate.ClientID %>").datepicker({
            changeMonth: true,
            changeYear: true,
            yearRange: "-100:+0",
            dateFormat: "yy-mm-dd"
        });
    });
</script>

</body>
</html>
