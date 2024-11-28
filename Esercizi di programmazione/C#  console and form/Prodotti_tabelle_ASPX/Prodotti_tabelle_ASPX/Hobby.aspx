<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Hobby.aspx.cs" Inherits="Hobby" %>

<!DOCTYPE html>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="dgw_hobby" runat="server" OnRowDeleting="dgw_hobby_RowDeleting">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                    <asp:CommandField ButtonType="Button" ShowCancelButton="False" ShowEditButton="True" />
                    <asp:CommandField ButtonType="Button" ShowCancelButton="False" ShowInsertButton="True" />
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <asp:Button ID="btn_chiudi" runat="server" Text="Chiudi" OnClick="btn_chiudi_Click" />
        </div>
    </form>
</body>
</html>

