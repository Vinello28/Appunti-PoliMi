<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ordine.aspx.cs" Inherits="Ordine" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    Confermi il seguente ordine?
    <%
        Response.Write(Session["Nome"] + " " + Session["Cognome"]);
        Response.Write("Pizza");
        switch (int.Parse((String)Session["BP"]))
        {
            case 1:
                {
                    Response.Write("Bianca");
                    break;
                }
            case 2:
                {
                    Response.Write("Rossa");
                    break;
                }
            case 3:
                {
                    Response.Write("Calzone");
                    break;
                }
        }
        String[] INGR = (String[]) Session["INGR"];
        for(int i=0;i<INGR.Length;i++)
            switch (INGR[i])
            {
                case "1":
                    {
                        Response.Write("Mozzarella");
                        break;
                    }
                case "2":
                    {
                        Response.Write("Crudo");
                        break;
                    }
                case "3":
                    {
                        Response.Write("Funghi");
                        break;
                    }
                case "4":
                    {
                        Response.Write("Pancetta");
                        break;
                    }
            }
        %>
    <form id="form1" runat="server">
        <div>
            <input id="Submit1" type="submit" value="Inoltra" /></div>
    </form>
</body>
</html>
