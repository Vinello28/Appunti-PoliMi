<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Prodotti.aspx.cs" Inherits="Prodotti" %>

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
        da.SelectCommand = cm;

        cm.CommandText = "SELECT * FROM Città";
        da.Fill(dati, "City");

        cm.CommandText = "SELECT * FROM Persona";
        da.Fill(dati, "Persona");

        cm.CommandText = "SELECT * FROM Hobby";
        da.Fill(dati, "Hobby");

        Context.Items.Add("D", dati);
        Context.Items.Add("cm", cm);
        Context.Items.Add("da", da);

        int rec_at;

        if (IsPostBack)
        {
            rec_at = (int)Session["RAT"];
            Response.Write("Codice città =" + Request.QueryString["Cod_Cit"]);
            switch(Request.QueryString["ACT"])
            {
                case "Inserisci":
                    {
                        cm.CommandText = "Insert into Persona (Nome, Cognome, Città) values ('" + Request.QueryString["Nome"] + "', '" + Request.QueryString["Cognome"] + "', '" + Request.QueryString["Cod_Cit"] + "');";
                        cm.ExecuteNonQuery();
                        dati.Tables["Persona"].Clear();
                        cm.CommandText = "SELECT * FROM Città;";
                        da.Fill(dati, "Città");
                        Response.Redirect("Prodotti.aspx");

                        //---- ANALISI -----
                        //dovrò leggere l'id della persona, con un SELECT LAST (seleziona l'ultimo record)
                        //per ogni codice hobby inserisco una persona ed un hobby nella tabella Pers_Hobby.
                        //

                        break;
                    }
                case "Primo":
                    {
                        rec_at = 0;
                        break;
                    }
                case "Indietro":
                    {
                        rec_at --;
                        if (rec_at < 0)
                            rec_at = 0;
                        break;
                    }
                case "Avanti":
                    {
                        rec_at ++;
                        if (rec_at >dati.Tables["Persona"].Rows.Count-1)
                            rec_at = dati.Tables["Persona"].Rows.Count-1;
                        break;
                    }
                case "Ultimo":
                    {
                        rec_at = dati.Tables["Persona"].Rows.Count-1;
                        break;
                    }
                case "Modifica":
                    {
                        cm.CommandText = "UPDATE Persona SET Città = '" + Request.QueryString["ID_Città"] + "' WHERE ID_Pers = '" + int.Parse(Request.QueryString["Cod"]) + "');";
                        cm.ExecuteNonQuery();

                        cm.CommandText = "UPDATE Persona SET Nome = '" + Request.QueryString["Nome"] + "' WHERE ID_Pers = '" + int.Parse(Request.QueryString["Cod"]) + "');";
                        cm.ExecuteNonQuery();

                        cm.CommandText = "UPDATE Persona SET Cognome = '" + Request.QueryString["Cognome"] + "' WHERE ID_Pers = '" + int.Parse(Request.QueryString["Cod"]) + "');";
                        cm.ExecuteNonQuery();

                        cm.CommandText = "DELETE FROM Pers_Hobby WHERE ID_Pers = " + int.Parse(Request.QueryString["Cod"]) +";";
                        cm.ExecuteNonQuery();

                        //---- ANALISI ----
                        //aggiungere parte sul telefono

                        dati.Tables["Persona"].Clear();
                        cm.CommandText = "SELECT * FROM Persona;";
                        da.Fill(dati, "Persona");

                        break;
                    }
                case "Cancella":
                    {
                        cm.CommandText = "DELETE FROM Persona WHERE ID_Pers = " + int.Parse(Request.QueryString["Cod"]) + ";";
                        cm.ExecuteNonQuery();
                        dati.Tables["Persona"].Clear();
                        cm.CommandText = "SELECT * FROM Persona;";
                        da.Fill(dati, "Persona");
                        rec_at = 0;
                        Response.Redirect("Prodotti.aspx");

                        break;
                    }
            }
        }
        else
            rec_at = 0;

        //gestione pulsanti postback
        Session.Add("RAT", rec_at);
%>
    <form id="form1" runat="server" method="get">
        <div>
            <%
                int ra = (int)Session["RAT"];

                System.Data.DataSet dati_1=(System.Data.DataSet) Context.Items["D"];
                System.Data.SqlClient.SqlDataAdapter da = (System.Data.SqlClient.SqlDataAdapter)Context.Items["da"];

                da.SelectCommand.CommandText = "select Id_Hobby from Pers_Hobby where Id_per=" + dati_1.Tables["Persona"].Rows[ra][0] + ";";
                da.Fill(dati_1, "P_H");
            %>
            Cod:
            <input id="Text1" type="text" name="Cod" value="<%=dati_1.Tables["Persona"].Rows[ra][0] %>"/><br />
            Nome:
            <input id="Text2" type="text" name="Nome" value="<%=dati_1.Tables["Persona"].Rows[ra][1] %>"/><br />
            Cognome:
            <input id="Text3" type="text" name="Cognome" value="<%=dati_1.Tables["Persona"].Rows[ra][2] %>"/><br />
            Città:
            <select id="Select1" name="Cod_Cit">
                <% 
                    for (int i = 0; i < dati_1.Tables["City"].Rows.Count; i++)
                    {
                        %> <option value="<%=dati_1.Tables["City"].Rows[i][0] %>" 
                        <%
                            if ((int)dati_1.Tables["City"].Rows[i][0] == (int)dati_1.Tables["Persona"].Rows[ra][3])
                            {
                                Response.Write("selected");
                            } 
                        %>>

                      <%=dati_1.Tables["City"].Rows[i][1] %>
                      </option>
                <%  }  %>
            
            </select>
            <br />
            
            Hobbies:
                <% 
                    int i_P_H = 0;
                    for (int i = 0; i < dati_1.Tables["Hobby"].Rows.Count; i++)
                    { %>
                       <br />
                       <input id="Checkbox1" type="checkbox" name="Hobby" value="<%=dati_1.Tables["Hobby"].Rows[i][0] %>"
                           <%
                           if (i_P_H < dati_1.Tables["P_H"].Rows.Count)
                               if ((int)dati_1.Tables["Hobby"].Rows[i][0] == (int)dati_1.Tables["P_H"].Rows[i_P_H][0])
                               {
                                   Response.Write("checked");
                                   i_P_H++;
                               }
                           %>
                           /><%=dati_1.Tables["Hobby"].Rows[i][1] %>
                <%  }  %>
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
