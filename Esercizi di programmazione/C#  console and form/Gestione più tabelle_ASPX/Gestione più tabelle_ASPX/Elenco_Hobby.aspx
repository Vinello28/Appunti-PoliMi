<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Elenco_Hobby.aspx.cs" Inherits="Elenco_Hobby" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="dgw_hobby" runat="server">
            </asp:GridView>
            <br />
            <br />
            <asp:Button ID="btn_chiudi" runat="server" Text="Chiudi" OnClick="btn_chiudi_Click" />
        </div>
    </form>
</body>
</html>
