<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pizzeria.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <%
        if (IsPostBack)
        {
            Session.Add("Nome", Request.Form["Nome"]);
            Session.Add("Cognome", Request.Form["Cognome"]);
            Session.Add("BP", Request.Form["BP"]);
            String[] INGR = Request.Form["INGR"].Split(',');
            Session.Add("INGR", INGR);
            Response.Redirect("Ordine.aspx");
        }
        %>
    <form id="form1" runat="server">
        <div>
            NOME
            <input id="Text1" name="Nome" type="text" /><br />
            COGNOME
            <input id="Text2" name="Cognome" type="text" /><br />
            Scegli la base pizza:<br />
            <input id="Radio1" name="BP" type="radio" value="1" /> BIANCA
            <input id="Radio3" name="BP" type="radio" value="2" /> ROSSA
            <input id="Radio2" name="BP" type="radio" value="3" /> CALZONE<br />
            Ingredienti<br />
            <input id="Checkbox1" name="INGR" type="checkbox" value="1" /> Mozzarella<br />
            <input id="Checkbox5" name="INGR" type="checkbox" value="2" /> Crudo<br />
            <input id="Checkbox6" name="INGR" type="checkbox" value="3" /> Funghi<br />
            <input id="Checkbox2" name="INGR" type="checkbox" value="4" /> Pancetta<br />
            <input id="Checkbox3" name="INGR" type="checkbox" value="4" /> Patate<br />
            <input id="Checkbox4" name="INGR" type="checkbox" value="5" /> Carciofini<br />
            <input id="Submit1" name="Azione" type="submit" value="Ordina" /><input id="Reset1" type="reset" value="Pulisci" /></div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
