<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Prodotti.aspx.cs" Inherits="Prodotti" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <% 
        int prod_index=0;

        System.Data.SqlClient.SqlConnection CN = new System.Data.SqlClient.SqlConnection();
        System.Data.SqlClient.SqlCommand CM = new System.Data.SqlClient.SqlCommand();
        System.Data.SqlClient.SqlDataAdapter DA = new System.Data.SqlClient.SqlDataAdapter();
        System.Data.DataSet dati = new System.Data.DataSet();

        CN.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Utente\Documents\Prova.mdf;Integrated Security=True;Connect Timeout=30";
        CN.Open();
        CM.CommandType = System.Data.CommandType.Text;
        CM.Connection = CN;
        CM.CommandText = "SELECT * FROM Prodotti";
        DA.SelectCommand = CM;
        DA.Fill(dati, "Prodotti");

        if (IsPostBack)
        {
            prod_index = (int)Session["att"];

            string n = Request.QueryString["ACT"];

            if (n == "Primo")
            {

                prod_index = 0;
                
            }
            else
            {
                if (n == "Indietro")
                {
                    if (prod_index > 0)
                    {
                        prod_index--;
                    }
                    else
                    {
                        //
                    }
                }
                else
                {
                    if (n == "Avanti")
                    {
                        int x = dati.Tables["Prodotti"].Rows.Count - 1;
                        if(prod_index < x)
                        {
                            prod_index++;
                        }
                    }
                    else
                    {
                        if (n == "Ultimo")
                        {
                            prod_index = dati.Tables["Prodotti"].Rows.Count - 1;
                        }
                        else
                        {
                            if (n == "Inserisci")
                            {
                                CM.CommandText = "INSERT INTO Prodotti (descr, prezzo, qt) VALUES ('" + Request.QueryString["DES"] + "', '" + float.Parse(Request.QueryString["PRZ"]) + "', '" + int.Parse(Request.QueryString["QTA"]) +"');";
                                CM.ExecuteNonQuery();
                            }
                            else
                            {
                                if (n == "Modifica")
                                {
                                    CM.CommandText = "UPDATE Prodotti SET descr = '" + Request.QueryString["DES"] + "' WHERE id_pr = " + prod_index + ";";
                                    CM.ExecuteNonQuery();
                                    CM.CommandText = "UPDATE Prodotti SET prezzo = '" + float.Parse(Request.QueryString["PRZ"]) + "' WHERE id_pr = " + prod_index + ";";
                                    CM.ExecuteNonQuery();
                                    CM.CommandText = "UPDATE Prodotti SET qt = '" + int.Parse(Request.QueryString["QTA"]) + "' WHERE id_pr = " + prod_index + ";";
                                    CM.ExecuteNonQuery();
                                }
                                else
                                {
                                    if (n == "Cancella")
                                    {
                                        CM.CommandText = "DELETE FROM Prodotti WHERE id_pr = " + prod_index + ";";
                                        CM.ExecuteNonQuery();
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        Context.Items.Add("D", dati);
        Session.Add("att", prod_index);

    %>
    <form id="form1" runat="server" method = "get">
        <div>
            <%
                int tmp_pos = (int)Session["att"];
                System.Data.DataSet dati_1 = (System.Data.DataSet)Context.Items["D"];
            %>
            <br />
            <br />
            <input id="Text1" type="text" name="DES" />
            <input id="Text2" type="text" name="PRZ" />
            <input id="Text3" type="text" name="QTA" />
            <br />
            <br />
            <br />
            PRODOTTO CORRENTE
            <br />
            <br />ID: <input id="Text4" type="text" name="id_a" value="<%=dati_1.Tables["Prodotti"].Rows[tmp_pos][0]%>"/>
            <br />Descrizione: <input id="Text5" type="text" name="de_a" value="<%=dati_1.Tables["Prodotti"].Rows[tmp_pos][1]%>"/>
            <br />Prezzo: <input id="Text6" type="text" name="pr_a" value="<%=dati_1.Tables["Prodotti"].Rows[tmp_pos][2]%>"/>
            <br />Quantità: <input id="Text7" type="text" name="qu_a" value="<%=dati_1.Tables["Prodotti"].Rows[tmp_pos][3]%>"/>

            <br />
            <br />
            <input id="Submit1" type="submit" value="Primo" name="ACT" />
            <input id="Submit2" type="submit" value="Indietro" name="ACT" />
            <input id="Submit3" type="submit" value="Avanti" name="ACT" />
            <input id="Submit4" type="submit" value="Ultimo" name="ACT" />
            <br />
            <input id="Submit5" type="submit" value="Inserisci" name="ACT" />
            <input id="Submit6" type="submit" value="Modifica" name="ACT" />
            <input id="Submit7" type="submit" value="Cancella" name="ACT" />

        </div>
    </form>
</body>
</html>
