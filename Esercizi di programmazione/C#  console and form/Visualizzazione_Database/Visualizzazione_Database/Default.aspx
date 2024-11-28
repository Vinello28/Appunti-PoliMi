<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <%
        System.Data.SqlClient.SqlConnection CN = new System.Data.SqlClient.SqlConnection();
        System.Data.SqlClient.SqlCommand CM = new System.Data.SqlClient.SqlCommand();
        System.Data.SqlClient.SqlDataAdapter DA = new System.Data.SqlClient.SqlDataAdapter();
        System.Data.DataSet dati = new System.Data.DataSet();

        CN.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Utente\Documents\Prova.mdf;Integrated Security=True;Connect Timeout=30";
        CN.Open();
        CM.CommandType = System.Data.CommandType.Text;
        CM.Connection = CN;

        if (IsPostBack)
        {
            String[] id = Request.QueryString["ELIMINA"].Split('_');
            CM.CommandText = "DELETE FROM Città WHERE id_city = " + id[1] + ";";
            CM.ExecuteNonQuery();
            Response.Redirect("Default.aspx");
        }

        CM.CommandText = "select * from Città";
        DA.SelectCommand = CM;
        DA.Fill(dati, "City");
        Context.Items.Add("Dati", dati);


    %>
    
    <form id="form1" runat="server" method="get">
        <div>
            <table>
            <%
                System.Data.DataSet dati = (System.Data.DataSet)Context.Items["Dati"];
                for (int i = 0; i < dati.Tables["City"].Rows.Count; i++)
                {
                    %>
                    <tr>

                        <td><%=dati.Tables["City"].Rows[i][0]%></td>
                        <td><%=dati.Tables["City"].Rows[i][1]%></td>
                        <td><input id="Submit1" type="submit" name="ELIMINA" value="Elimina_<%=dati.Tables["City"].Rows[i][0]%>" /></td>

                    </tr>
        <%      }
            %>
            </table>
        </div>
    </form>
    
    <p>
        &nbsp;</p>
</body>
</html>