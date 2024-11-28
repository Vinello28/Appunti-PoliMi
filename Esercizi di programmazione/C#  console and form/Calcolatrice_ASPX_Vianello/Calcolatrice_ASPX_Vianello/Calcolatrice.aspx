<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Calcolatrice.aspx.cs" Inherits="Calcolatrice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server" method="post">
        <div>
            
            Inserire primo numero <asp:TextBox ID="txb_n1" runat="server"></asp:TextBox>
            <br />
            Inserire secondo numero<asp:TextBox ID="txb_n2" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            Selezionare l'operazione
            <br />
            <br />
            somma: <asp:RadioButton ID="rb_sm" runat="server" />
            <br />
            sottrazione: <asp:RadioButton ID="rb_st" runat="server" />
            <br />
            prodotto: <asp:RadioButton ID="rb_pr" runat="server" />
            <br />
            divisione: <asp:RadioButton ID="rb_dv" runat="server" />
            <br />
            <br />
            <asp:Button ID="btn_calc" runat="server" Text="Calcola" OnClick="btn_calc_Click" />

        </div>
        <p>
            RISULTATO: <asp:Label ID="lbl_r" runat="server" Text="......"></asp:Label>
        </p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
