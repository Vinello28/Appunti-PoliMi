<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Generale.aspx.cs" Inherits="Generale" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <%
                          /*  Response.Write("Sei già all'ultima posizione");
                        }
                        else
                        {
                            rec_at++;
                        }
                         
                       /* if (rec_at > dati.Tables["Persona"].Rows.Count - 1)
                        {
                            rec_at = dati.Tables["Persona"].Rows.Count - 1;
                        }
                        break;
                    }
                case "Ultimo":
                    {
                        rec_at = dati.Tables["Persona"].Rows.Count-1;
                        break;
                    }
                case "Modifica":
                    {
                        //Modifico persona
                        //Elimino tutti gli hobby presenti nella tabella della persona da modificare
                        //per ogni codice hobby inserisco codice persona e codice hobby nella tabella pers hobby
                        //Aggiorna tabelle in memoria

                        //Modifica del nome.
                        if(Request.QueryString["Nome"]!= "")
                        {
                            cm.CommandText = "Update Persona set nome= '"+ Request.QueryString["Nome"] + "' where ID_P = " + Request.QueryString["Cod"] + ";";
                            cm.ExecuteNonQuery();
                        }
                        //Modifica del cognome.
                        if(Request.QueryString["Cognome"]!= "")
                        {
                            cm.CommandText = "Update Persona set cognome= '"+ Request.QueryString["Cognome"] + "' where ID_P = " + Request.QueryString["Cod"] + ";";
                            cm.ExecuteNonQuery();
                        }

                        //Modifica della città.
                        cm.CommandText = "Update Persona set città_res= " + Request.QueryString["Cod_Cit"] + " where ID_P = " + Request.QueryString["Cod"] + ";";
                        cm.ExecuteNonQuery();
                         
                        //Modifica degli hobby.
                        //Cancellazione hobby
                        cm.CommandText = "Delete from Pers_Hobby where Id_per= "+ Request.QueryString["Cod"] + ";";
                        cm.ExecuteNonQuery();
                        
                        //Inserimento hobby.
                        String[] hobbies = Request.QueryString["Hobby"].Split(','); //Vettore contenente gli hobbies selezionati.

                        for(int i=0; i<hobbies.Length; i++)
                        {
                             cm.CommandText = "Insert into Pers_Hobby(Id_per, Id_Hobby) values (" + Request.QueryString["Cod"] + ", " + hobbies[i] + ");";
                             cm.ExecuteNonQuery();
                        }

                        //Aggiornamento tabella.
                        dati.Tables["Persona"].Clear();
                        cm.CommandText = "select * from Persona";
                        da.Fill(dati, "Persona");
                        rec_at = dati.Tables["Persona"].Rows.Count - 1;
                        break;
                    }
                    case "Cancella":
                    {
                        //Elimino tutti gli hobby presenti nella tabella della persona da eliminare
                        //elimino persona
                        //aggiorno tabelle
                        //rec_attuale = record precedente a quello eliminato per gestire la visualizzazione.


                        //Cancellazione hobby.
                        cm.CommandText = "Delete from Pers_Hobby where id_per = " + Request.QueryString["Cod"] + ";";
                        cm.ExecuteNonQuery();
                        //Cancellazione persona.
                        cm.CommandText = "Delete from Persona where ID_P = " + Request.QueryString["Cod"] + ";";
                        cm.ExecuteNonQuery();

                        break;
                    }
            }
        }
        else
            rec_at = 0;

            // gestione pulsanti postback
            Session.Add("RAT", rec_at);*/
%>
    <form id="form1" runat="server" method="get">
        <div>
            <%
                /*int ra = (int)Session["RAT"];
                System.Data.DataSet dati_1=(System.Data.DataSet) Context.Items["D"];
                System.Data.SqlClient.SqlDataAdapter da = (System.Data.SqlClient.SqlDataAdapter)Context.Items["da"];
                da.SelectCommand.CommandText = "select Id_Hobby from Pers_Hobby where Id_per=" + dati_1.Tables["Persona"].Rows[ra][0] + ";";
                da.Fill(dati_1, "P_H");*/
            %>Cod:
            <asp:TextBox ID="TXB_Cod" runat="server"></asp:TextBox>
            <br />
            Nome:
            <asp:TextBox ID="TXB_Nome" runat="server"></asp:TextBox>
            <br />
            Cognome:
            <asp:TextBox ID="TXB_Cognome" runat="server"></asp:TextBox>
            <br />

            Città:
            <asp:DropDownList ID="CMB_CIttà" runat="server">
            </asp:DropDownList>
            <br />

            Hobbies:
             <br />
            <asp:CheckBoxList ID="CBX_List" runat="server">
            </asp:CheckBoxList>
            <br />

            Bottoni: <br />
            <asp:Button ID="BTN_Primo" runat="server" Text="Primo" OnClick="BTN_Primo_Click" />
            <asp:Button ID="BTN_Avanti" runat="server" Text="Avanti" OnClick="BTN_Avanti_Click" />
            <asp:Button ID="BTN_Ultimo" runat="server" Text="Ultimo" OnClick="BTN_Ultimo_Click" />
            <asp:Button ID="BTN_Indietro" runat="server" Text="Indietro" OnClick="BTN_Indietro_Click" />
            <br />
            <asp:Button ID="BTN_Inserisci" runat="server" Text="Inserisci" OnClick="BTN_Inserisci_Click" />
            <asp:Button ID="BTN_Modifica" runat="server" Text="Modifica" OnClick="BTN_Modifica_Click" />
            <asp:Button ID="BTN_Cancella" runat="server" Text="Cancella" OnClick="BTN_Cancella_Click" />
            <br />
            <asp:Button ID="Vis_City" runat="server" Text="Visualizza Città" OnClick="Vis_City_Click" />
            <asp:Button ID="btn_hobby" runat="server" OnClick="btn_hobby_Click" Text="Visualizza hobby" Width="115px" />        
        </div>
    </form>
   
</body>
</html>













