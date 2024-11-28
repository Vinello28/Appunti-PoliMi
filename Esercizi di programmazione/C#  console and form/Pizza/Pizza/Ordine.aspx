<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ordine.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    Confermi il seguente ordine?
    <%
        double conto = 0;
        String sourceimage;

        Response.Write(Session["Nome"] + " " + Session["Cognome"]);
        Response.Write("Pizza");
        switch (int.Parse((String)Session["BP"]))
        {
            case 1:
                {
                    Response.Write("Bianca");
                    conto = conto + 2.00;
                    sourceimage = "'@bianca.png'";
                    break;
                }
            case 2:
                {
                    Response.Write("Rossa");
                    conto = conto + 3.00;
                    sourceimage = "'@rossa.png'";
                    break;
                }
            case 3:
                {
                    Response.Write("Calzone");
                    conto = conto + 3.50;
                    sourceimage = "'@calzone.jpg'";
                    break;
                }
        }

        String[] INGR = (String[]) Session["INGR"];

        for (int i = 0; i <= INGR.Length; i++)
        {
            if (i < INGR.Length)
            {
                switch (INGR[i])
                {
                    case "1":
                        {
                            Response.Write(" Mozzarella ");
                            conto = conto + 0.50;
                            break;
                        }
                    case "2":
                        {
                            Response.Write(" Crudo ");
                            conto = conto + 2.00;
                            break;
                        }
                    case "3":
                        {
                            Response.Write(" Funghi ");
                            conto = conto + 1.00;
                            break;
                        }
                    case "4":
                        {
                            Response.Write(" Pancetta ");
                            conto = conto + 0.75;
                            break;
                        }
                    case "5":
                        {
                            Response.Write(" Patate ");
                            conto = conto + 0.50;
                            break;
                        }
                    case "6":
                        {
                            Response.Write(" Carciofini ");
                            conto = conto + 0.80;
                            break;
                        }
                }
            }
            else
            {
                Response.Write(" " + conto + " ");
            }
        }
        %>
    <form id="form1" runat="server">
        <div>
            <input id="Submit1" type="submit" value="Inoltra" /></div>
    </form>
    <p>
        <img alt="" src= "sourceimage" style="height: 243px; width: 286px" /></p>
</body>
</html>
