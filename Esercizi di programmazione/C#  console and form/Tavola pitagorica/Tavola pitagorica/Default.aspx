<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Tavola Pitagorica</title>
</head>
<body>
    <form id="form1" runat="server" method ="get">
        <div>
                <% 

                    if (IsPostBack)
                    {
                         %>  
                               
                                <table style="width:50%;">

                         <%

                        int n = int.Parse(Request.QueryString["Alfa"]);
                        for (int i = 0; i <= n; i++)
                        {
                            %>  
                               
                                <tr>

                            <%
                            for (int j = 0; j <= n; j++)
                            {
                                %>  
                                
                                 <td> <% Response.Write(i * j); %> </td>

                                <%
                            }
                            
                            %>  
                                
                                </tr>

                            <%

                        }
                        %>  
                                
                                </table>

                        <%
                    }

                %>
        </div>
        <div>
            <input id="Text1" name="Alfa" type="text" /><br />
            <input id="Submit1" type="submit" value="submit" /></div>
    </form>
</body>
</html>
