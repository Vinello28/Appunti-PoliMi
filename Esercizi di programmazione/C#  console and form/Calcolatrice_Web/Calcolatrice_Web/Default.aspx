<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server" method ="get">  
         <%
             if (IsPostBack)
             {
                 //Caso in cui viene premuto il bottone submit relativo alla tavola pitagorica.
                 if (Request.QueryString["Azione"].CompareTo("Tavola pitagorica") == 0)
                 {
                     int n = int.Parse(Request.QueryString["TBX_n"]);
                     int x = n;
                     for(int i = 0; i < 777; i++)
                     {
                         x = x + i;
                     }
                     Response.Write(x.ToString());
                 }

                 //Caso in cui viene premuto il bottone submit relativo alla somma dei due valori.
                 if (Request.QueryString["Azione"].CompareTo("Somma") == 0)
                 {
                     int n = int.Parse(Request.QueryString["TBX_n"]);
                     int n2 = int.Parse(Request.QueryString["TBX_n2"]);
                     Response.Write((n + n2).ToString());
                 }

                 //Caso in cui viene premuto il bottone submit relativo alla differenza dei due valori.
                 if (Request.QueryString["Azione"].CompareTo("Differenza") == 0)
                 {
                     int n = int.Parse(Request.QueryString["TBX_n"]);
                     int n2 = int.Parse(Request.QueryString["TBX_n2"]);
                     Response.Write((n - n2).ToString());
                 }

                 //Caso in cui viene premuto il bottone submit relativo alla moltiplicazione dei due valori.
                 if (Request.QueryString["Azione"].CompareTo("Moltiplicazione") == 0)
                 {
                     int n = int.Parse(Request.QueryString["TBX_n"]);
                     int n2 = int.Parse(Request.QueryString["TBX_n2"]);
                     Response.Write((n * n2).ToString());
                 }

                 //Caso in cui viene premuto il bottone submit relativo alla divisione dei due valori.
                 if (Request.QueryString["Azione"].CompareTo("Divisione") == 0)
                 {
                     int n = int.Parse(Request.QueryString["TBX_n"]);
                     int n2 = int.Parse(Request.QueryString["TBX_n2"]);
                     Response.Write((n / n2).ToString());
                 }

                 //Caso in cui viene premuto il bottone submit relativo all'elevamento a potenza
                 if (Request.QueryString["Azione"].CompareTo("Elevamento a potenza") == 0)
                 {
                     int n = int.Parse(Request.QueryString["TBX_n"]);
                     int n2 = int.Parse(Request.QueryString["TBX_n2"]);
                     Response.Write((Math.Pow(n,n2)).ToString());
                 }

                 //Caso in cui viene premuto il bottone submit relativo alfattoriale del primo dei due valori.
                 if (Request.QueryString["Azione"].CompareTo("Fattoriale") == 0)
                 {
                     int n = int.Parse(Request.QueryString["TBX_n"]);
                     int n2 = int.Parse(Request.QueryString["TBX_n2"]);

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
             }
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
       
        <div>
        </div>
    </form>
</body>
</html>
