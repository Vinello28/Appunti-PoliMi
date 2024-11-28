<%@ Page Language="C#" AutoEventWireup="true" CodeFile="elimina.aspx.cs" Inherits="elimina" %>

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
          cn.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\DBASE\BEPPE.mdf;Integrated Security=True;Connect Timeout=30";
          cn.Open();
          cm.CommandType = System.Data.CommandType.Text;
          cm.Connection = cn;
          cm.CommandText = "delete from Città where id_city="+Request.QueryString["id"];
          cm.ExecuteNonQuery();
          Response.Redirect("Default.aspx");
     %>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
