<%@ Page Language="C#" AutoEventWireup="true" CodeFile="City.aspx.cs" Inherits="City" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="Tabella" runat="server" OnRowCancelingEdit="Tabella_RowCancelingEdit" OnRowUpdating="Tabella_RowUpdating" OnRowCreated="Tabella_RowCreated">
                <Columns>
                    <asp:ButtonField ButtonType="Button" CommandName="Cancel" Text="Elimina" />
                    <asp:CommandField ButtonType="Button" ShowCancelButton="False" ShowEditButton="True" />
                    <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
                </Columns>
            </asp:GridView>
            <asp:Button ID="Chiudi" runat="server" OnClick="Chiudi_Click" Text="Chiudi" />
        </div>
    </form>
</body>
</html>
