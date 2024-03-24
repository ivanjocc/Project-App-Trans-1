<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="prjWebCsFriendBookIvan.dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <style type="text/css">
        body {
            font-family: 'Arial', sans-serif;
            background-color: #ffebee;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        form#formDashboard {
            width: 80%;
            max-width: 600px;
            margin-top: 20px;
        }

        div {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"], input[type="password"], select, .aspNetDisabled {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"], .button {
            background-color: #ff4081;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-weight: bold;
        }

        input[type="submit"]:hover, .button:hover {
            background-color: #f50057;
        }

        .error {
            color: #d32f2f;
            font-weight: bold;
        }

        a {
            text-decoration: none;
            color: #2196f3;
        }

        a:hover {
            text-decoration: underline;
        }

        .aspNetDisabled {
            background-color: #ececec;
            color: #a1a1a1;
            border-color: #dcdcdc;
        }

        .aspnetGridView {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .aspnetGridView th {
            background-color: #ff4081;
            color: white;
            padding: 10px;
            border: 1px solid #ff4081;
        }

        .aspnetGridView td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        #btnLogout {
            background-color: #2196f3;
            margin-top: 20px;
            font-weight: bold;
        }

        #btnLogout:hover {
            background-color: #1976d2; 
        }

        #gvMessages {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        #gvMessages th {
            background-color: #ff4081;
            color: white;
            padding: 10px;
            border: 1px solid #ff4081;
        }

        #gvMessages td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        #gvMessages a {
            color: #2196f3;
            text-decoration: none;
        }

        #gvMessages a:hover {
            text-decoration: underline;
        }

        #gvMembers {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        #gvMembers th {
            background-color: #5c6bc0; 
            color: white;
            padding: 10px;
            border: 1px solid #5c6bc0;
        }

        #gvMembers td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        #gvMembers a {
            color: #42a5f5;
            text-decoration: none;
        }

        #gvMembers a:hover {
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
    <form id="formDashboard" runat="server">
        <div>
            <asp:Label ID="lblUsername" runat="server" Text="Welcome"></asp:Label>
        </div>

        <div>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
        </div>

        <div>
            Gender:
            <asp:DropDownList ID="ddlSex" runat="server">
                <asp:ListItem Text="Male" Value="M" />
                <asp:ListItem Text="Woman" Value="W" />
            </asp:DropDownList><br />
            Age Category:
            <asp:DropDownList ID="ddlAgeCategory" runat="server">
                <asp:ListItem Text="Over 18" Value="Mayor" />
                <asp:ListItem Text="Under 18" Value="Menor" />
            </asp:DropDownList><br />
            Ethnic Group:
            <asp:DropDownList ID="ddlEthnicGroup" runat="server">
                <asp:ListItem Text="African American" Value="african" />
                <asp:ListItem Text="Asian" Value="asian" />
                <asp:ListItem Text="Hispanic or Latino" Value="latino" />
                <asp:ListItem Text="Native American" Value="american" />
                <asp:ListItem Text="Other" Value="other" />
            </asp:DropDownList><br />
            Reason for Searching:
            <asp:DropDownList ID="ddlSearchReason" runat="server">
                <asp:ListItem Text="Love" Value="love" />
                <asp:ListItem Text="Friendship" Value="friendship" />
                <asp:ListItem Text="Other Interests" Value="other" />
            </asp:DropDownList><br />
            <asp:Button ID="btnFilter" runat="server" Text="Filter" OnClick="btnFilter_Click" />
        </div>
        <div>
            <asp:Label ID="lblMessages" runat="server" Text="Received Messages:" Font-Bold="true"></asp:Label>
            <asp:GridView ID="gvMessages" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="FromUsername" HeaderText="From" />
                    <asp:BoundField DataField="Content" HeaderText="Message" />
                    <asp:BoundField DataField="SendDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
                    <asp:TemplateField HeaderText="Reply">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlReply" runat="server" NavigateUrl='<%# "createMessage.aspx?ToUserID=" + Eval("FromUserID") %>' Text="Reply"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
        <div>
            <asp:Label ID="lblResult" runat="server" Text="Search result:" Font-Bold="true"></asp:Label>
            <asp:GridView ID="gvMembers" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="UserID" HeaderText="UserID" Visible="false" />
                    <asp:BoundField DataField="Username" HeaderText="Username" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Sex" HeaderText="Sex" />
                    <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="EthnicGroup" HeaderText="Ethnic Group" />
                    <asp:BoundField DataField="SearchReason" HeaderText="Search Reason" />
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlSendMessage" runat="server" NavigateUrl='<%# "createMessage.aspx?ToUserID=" + Eval("UserID") %>' Text="Send message"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
