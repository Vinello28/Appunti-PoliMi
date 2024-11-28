<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #Reset1 {
            width: 50px;
        }
    </style>
</head>
<body>

    <%
        //vettore degli ingredienti
        String[] ING = { "Mozzarella", "Crudo", "Funghi", "Pancetta", "Patate", "Carciofini"};
        Context.Items.Add("ING", ING);

        if (IsPostBack)
        {
            Session.Add("Nome", Request.Form["Nome"]);
            Session.Add("Cognome", Request.Form["Cognome"]);
            Session.Add("BP", Request.Form["BP"]);

            String[] INGR = Request.Form["INGR"].Split(',');

            Session.Add("INGR", INGR);
            Response.Redirect("Ordine.aspx");
        }
        else
        {
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
            
                    <%
                        
                        String[] ING1 = (String[])Context.Items["ING"];
                        for(int i = 0; i < ING1.Length; i++)
                        {
                           %> 
                    
                            <input id="Checkbox<% = i+1 %>" name="INGR" type="checkbox" value="<% = i %>" /> <% =ING1[i] %><br />

                            <%
                        }
                        %>
            
            
                    <br />
                    <input id="Submit1" name="Azione" type="submit" value="Ordina" />
                    <input id="Reset1" type="reset" value="Pulisci" />

                </div>
            </form>
    <%  } %>
    <p>
        &nbsp;</p>
</body>
</html>
