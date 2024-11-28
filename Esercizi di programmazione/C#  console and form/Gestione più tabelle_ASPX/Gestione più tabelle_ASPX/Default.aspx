<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server" method="get" >
        <div>
        </div>
        Codice:  <asp:TextBox ID="Txt_Codice" runat="server"></asp:TextBox>
        <br />
        Nome:  <asp:TextBox ID="Txt_Nome" runat="server"></asp:TextBox>
        <br />
        Cognome:  <asp:TextBox ID="Txt_Cognome" runat="server"></asp:TextBox>
        <br />
        <br />
        Città: <asp:DropDownList ID="DDL_Città" runat="server"></asp:DropDownList>
        <%               
           bool temp = false;

           int ra = (int)Session["Rec_at"];
           System.Data.DataSet dati_1=(System.Data.DataSet) Session["D"];
           System.Data.SqlClient.SqlDataAdapter da = (System.Data.SqlClient.SqlDataAdapter)Session["da"];
           if (dati_1.Tables["Persona"].Rows.Count > 0)
           {
               da.SelectCommand.CommandText = "select ID_Hobby from Persona_Hobby where ID_Pers =" + dati_1.Tables["Persona"].Rows[ra][0] + ";";
               da.Fill(dati_1, "P_H");
               temp = true;
           }
           %>
        <br />
        <br />
        Hobbies:
                <% 
                    int i_P_H = 0;
                    for (int i = 0; i < dati_1.Tables["Hobby"].Rows.Count; i++)
                    {%>
                       <br />
                       <input id="Checkbox1" type="checkbox" name="Hobby" value="<%=dati_1.Tables["Hobby"].Rows[i][0] %>"
                           <%
                           if (temp == true)
                           {
                               if (i_P_H < dati_1.Tables["P_H"].Rows.Count)
                               {
                                   if ((int)dati_1.Tables["Hobby"].Rows[i][0] == (int)dati_1.Tables["P_H"].Rows[i_P_H][0])
                                   {
                                       Response.Write("checked");
                                       i_P_H++;
                                   }
                               }
                           }
                           %>
                           /><%=dati_1.Tables["Hobby"].Rows[i][1] %> <%}%>
        <br />
        <br />
        <asp:Button ID="Btn_Primo" runat="server" Text="Primo" OnClick="Btn_Primo_Click"/>
        <asp:Button ID="Btn_Indietro" runat="server" Text="Indietro" OnClick="Btn_Indietro_Click"/>
        <asp:Button ID="Btn_Avanti" runat="server" Text="Avanti" OnClick="Btn_Avanti_Click"/>
        <asp:Button ID="Btn_Ultimo" runat="server" Text="Ultimo" OnClick="Btn_Ultimo_Click"/>
        <br />
        <asp:Button ID="Btn_Inserisci" runat="server" Text="Inserisci" OnClick="Btn_Inserisci_Click"/>
        <asp:Button ID="Btn_Modifica" runat="server" Text="Modifica" OnClick="Btn_Modifica_Click"/>
        <asp:Button ID="Btn_Elimina" runat="server" Text="Elimina" OnClick="Btn_Elimina_Click"/>
        <p>
        <asp:Button ID="btn_elenco" runat="server" Text="Visualizza città" OnClick="btn_elenco_Click" Width="96px" />
            <asp:Button ID="btn_hobby" runat="server" OnClick="btn_hobby_Click" Text="Visualizza hobby" Width="115px" />
        </p>
    </form>
</body>
</html>
