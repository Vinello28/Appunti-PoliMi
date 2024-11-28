<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Elimina.aspx.cs" Inherits="Elimina" %>

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

        CN.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Utente\Documents\Prova.mdf;Integrated Security=True;Connect Timeout=30";
        CN.Open();
        CM.Connection = CN;
        CM.CommandType = System.Data.CommandType.Text;
        CM.CommandText = "DELETE FROM Città WHERE id =" + Request.QueryString["i"] + ";";
        CM.ExecuteNonQuery();
        DA.SelectCommand = CM;

        Response.Redirect("Default.aspx");
   %>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
