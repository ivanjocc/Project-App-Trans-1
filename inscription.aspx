<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inscription.aspx.cs" Inherits="prjWebCsFriendBookIvan.inscription" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inscription</title>
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Username: <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox><br />
            Password: <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox><br />
            Email: <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><br />
            Sex: <asp:DropDownList ID="ddlSex" runat="server">
                 </asp:DropDownList><br />
            Birth Date: <asp:TextBox ID="txtBirthDate" runat="server"></asp:TextBox><br />
            Ethnic Group: <asp:TextBox ID="txtEthnicGroup" runat="server"></asp:TextBox><br />
            Search Reason: <asp:TextBox ID="txtSearchReason" runat="server"></asp:TextBox><br />
            <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" />
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
