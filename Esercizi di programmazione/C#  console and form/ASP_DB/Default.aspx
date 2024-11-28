<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <%
        System.Data.SqlClient.SqlConnection cn=new System.Data.SqlClient.SqlConnection();
        System.Data.SqlClient.SqlCommand cm = new System.Data.SqlClient.SqlCommand();
        System.Data.SqlClient.SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter();
        System.Data.DataSet dati = new System.Data.DataSet();
        cn.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Utente\Documents\Prova.mdf;Integrated Security=True;Connect Timeout=30";
        cn.Open();
        cm.CommandType = System.Data.CommandType.Text;
        cm.Connection = cn;
        cm.CommandText = "select * from Città";
        da.SelectCommand = cm;
        da.Fill(dati, "City");
        Context.Items.Add("Dati", dati);
        %>
    <table>

    <%
/*        for (int i = 0; i < dati.Tables["City"].Rows.Count; i++)
        {%>
        <tr>
            <td><%=dati.Tables["City"].Rows[i][0]%></td>
            <td><%=dati.Tables["City"].Rows[i][1]%></td>
            <td><a href="elimina.aspx?id=<%=dati.Tables["City"].Rows[i][0]%>">ELIMINA</a></td>
        </tr>
        <%}
*/            %>
    <form id="form1" runat="server" method="get">
        <div>
    <%
        System.Data.DataSet dati = (System.Data.DataSet)Context.Items["Dati"];
        for (int i = 0; i < dati.Tables["City"].Rows.Count; i++)
        {%>
        <tr>
            <td><%=dati.Tables["City"].Rows[i][0]%></td>
            <td><%=dati.Tables["City"].Rows[i][1]%></td>
            <td><input id="Submit1" type="submit" name="Elimina" value="Elimina_<%=dati.Tables["City"].Rows[i][0]%>" /></td>

        </tr>
        <%}
            %>

        </div>
    </form>
    </table>
    <p>
        &nbsp;</p>
</body>
</html>
