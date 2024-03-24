<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="prjWebCsFriendBookIvan.dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="formDashboard" runat="server">
        <div>
            <asp:Label ID="lblUsername" runat="server" Text="Bienvenido"></asp:Label>
        </div>

        <div>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
        </div>

        <div>
            Sexo:
            <asp:DropDownList ID="ddlSex" runat="server">
                <asp:ListItem Text="Male" Value="M" />
                <asp:ListItem Text="Woman" Value="W" />
            </asp:DropDownList><br />
            Categoría de Edad:
            <asp:DropDownList ID="ddlAgeCategory" runat="server">
                <asp:ListItem Text="Mayor de 18" Value="Mayor" />
                <asp:ListItem Text="Menor de 18" Value="Menor" />
            </asp:DropDownList><br />
            Grupo Étnico:
            <asp:DropDownList ID="ddlEthnicGroup" runat="server">
                <asp:ListItem Text="African American" Value="african" />
                <asp:ListItem Text="Asian" Value="asian" />
                <asp:ListItem Text="Hispanic or Latino" Value="latino" />
                <asp:ListItem Text="Native American" Value="american" />
                <asp:ListItem Text="Other" Value="other" />
            </asp:DropDownList><br />
            Razón:
            <asp:DropDownList ID="ddlSearchReason" runat="server">
                <asp:ListItem Text="Love" Value="love" />
                <asp:ListItem Text="Friendship" Value="friendship" />
                <asp:ListItem Text="Other Interests" Value="other" />
            </asp:DropDownList><br />
            <asp:Button ID="btnFilter" runat="server" Text="Filtrar" OnClick="btnFilter_Click" />
        </div>
        <div>
            <asp:Label ID="lblMessages" runat="server" Text="Mensajes Recibidos:" Font-Bold="true"></asp:Label>
            <asp:GridView ID="gvMessages" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="FromUsername" HeaderText="De" />
                    <asp:BoundField DataField="Content" HeaderText="Mensaje" />
                    <asp:BoundField DataField="SendDate" HeaderText="Fecha de Envío" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
                    <asp:TemplateField HeaderText="Responder">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlReply" runat="server" NavigateUrl='<%# "createMessage.aspx?ToUserID=" + Eval("FromUserID") %>' Text="Responder"></asp:HyperLink>
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
                    <asp:TemplateField HeaderText="Acción">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlSendMessage" runat="server" NavigateUrl='<%# "createMessage.aspx?ToUserID=" + Eval("UserID") %>' Text="Enviar Mensaje"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
