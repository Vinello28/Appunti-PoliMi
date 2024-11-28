<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Prima prova ASP</title>
</head>
<body>
    <%
        if (IsPostBack)
        {
            int n = int.Parse(Request.QueryString["Alfa"]);
            for (int i = 0; i < n; i++)
            {
                if (i % 2 == 0)
                    Response.Write("<B>Ciao a tutti</B>");
                else
                    Response.Write("Ciao a tutti");
            %>
    <br />
    <%
            }
        }
        else
            Response.Write("Ripeti");
        %>
    <form id="form1" runat="server" method="get">
        <div>
            <input id="Text1" name="Alfa" type="text" /><br />
            <input id="Submit1" type="submit" value="submit" /></div>
    </form>
</body>
</html>
