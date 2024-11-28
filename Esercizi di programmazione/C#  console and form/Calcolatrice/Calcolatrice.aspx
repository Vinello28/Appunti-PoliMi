<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Calcolatrice.aspx.cs" Inherits="Calcolatrice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 142px;
        }
        .auto-style2 {
            width: 135px;
            height: 39px;
        }
        .auto-style3 {
            width: 131px;
            height: 37px;
        }
        .auto-style4 {
            width: 183px;
            height: 37px;
        }
    </style>
</head>
<body>
     <form id="form1" runat="server" method ="get">
    <%
            //Quando la pagina è già stata postata (è stato premuto uno dei bottoni submit almeno una volta).
            if (IsPostBack)
            {
            
            //Acquisizione dei valori scritti dall'utente nelle textbox.
            int n = int.Parse(Request.QueryString["TBX_n"]);
            int n2 = int.Parse(Request.QueryString["TBX_n2"]);
     %>
            Risultato <br />
    <%
            //Caso in cui viene premuto il bottone submit relativo alla tavola pitagorica.
            if (Request.QueryString["Azione"].CompareTo("Tavola pitagorica") == 0)
            {
            
    %>
                <table border="1">
                    <%
                        //Creazione della tavola pitagoricacon tabella.
                        Boolean B = true;
                        for (int i = 1; i <= n; i++)
                        {  
                    %>
                            <tr >
                                 <%

                            for(int j=1; j<= n2; j++)
                            {
                                 %>
                                 <td width="25%">
                                      <% 

                                 if(B)
                                 {
                                      %><b><%Response.Write((i * j).ToString());%></b><%
                                 }
                                 else
                                 {
                                     %><%Response.Write((i * j).ToString());%> <%
                                 }
                                 B = !B;
                                                  %>
                                 </td>
                                 <td>&nbsp;</td>
                                 <%  
                             }
                                 %>
                            </tr>
                            <%
                        }
                            %>
                </table>
    <p>
        <br />
    </p>
    <%
            }//Fine calcolatrice  

            //Caso in cui viene premuto il bottone submit relativo alla somma dei due valori.
            if (Request.QueryString["Azione"].CompareTo("Somma") == 0)
            {
                Response.Write((n + n2).ToString());
            }

            //Caso in cui viene premuto il bottone submit relativo alla differenza dei due valori.
            if (Request.QueryString["Azione"].CompareTo("Differenza") == 0)
            {
                Response.Write((n - n2).ToString());
            }

            //Caso in cui viene premuto il bottone submit relativo alla moltiplicazione dei due valori.
            if (Request.QueryString["Azione"].CompareTo("Moltiplicazione") == 0)
            {
                Response.Write((n * n2).ToString());
            }

            //Caso in cui viene premuto il bottone submit relativo alla divisione dei due valori.
            if (Request.QueryString["Azione"].CompareTo("Divisione") == 0)
            {
                Response.Write((n / n2).ToString());
            }

            //Caso in cui viene premuto il bottone submit relativo all'elevamento a potenza
            if (Request.QueryString["Azione"].CompareTo("Elevamento a potenza") == 0)
            {
                Response.Write((Math.Pow(n,n2)).ToString());
            }

            //Caso in cui viene premuto il bottone submit relativo alfattoriale del primo dei due valori.
            if (Request.QueryString["Azione"].CompareTo("Fattoriale") == 0)
            {
                if(n<1)
                {
                    Response.Write("Il fattoriale di un numero negativo non può essere eseguito");
                }

                int risultato = 1;
                while(n>0)
                {
                    risultato = risultato * n;
                    n--;                                   
                }
            }
        }//Fine IsPostBack
    %>   
    
    <p>
        Primo valore
        <input id="Text1" name="TBX_n" type="text" class="auto-style1" /></p>
    <p>
        Secondo valore
        <input id="Text2" name="TBX_n2" type="text" /></p>
    <p>
        Scegli l'azione
        <br /><br />
        <input id="Submit1" class="auto-style2" name="Azione" type="submit" value="Tavola pitagorica" /></p>
    <p>
        <input id="Submit2" type="submit" value="Somma" class="auto-style3" name="Azione" /></p>
    <p>
        <input id="Submit3" type="submit" value="Differenza" class="auto-style3" name="Azione" /></p>
    <p>
        <input id="Submit6" type="submit" value="Moltiplicazione" class="auto-style3" name="Azione" /></p>
    <p>
        <input id="Submit7" type="submit" value="Divisione" class="auto-style3" name="Azione" /></p>
    <p>
        <input id="Submit8" type="submit" value="Elevamento a potenza" class="auto-style4" name="Azione" /></p>
    <p>
        <input id="Submit9" type="submit" value="Fattoriale" class="auto-style3" name="Azione" /></p>
</form>
</body>
</html>
