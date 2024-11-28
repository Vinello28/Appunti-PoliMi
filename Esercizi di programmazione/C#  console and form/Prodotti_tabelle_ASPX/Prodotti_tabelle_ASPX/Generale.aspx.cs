using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Generale : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cm;
    SqlDataAdapter da;
    DataSet dati;
    int rec_at;

    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection();
        cm = new SqlCommand();
        da = new SqlDataAdapter();
        dati = new DataSet();
        cn.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Utente\Documents\Prova.mdf;Integrated Security=True;Connect Timeout=30";
        cn.Open();
        cm.CommandType = System.Data.CommandType.Text;
        cm.Connection = cn;
        da.SelectCommand = cm;
        cm.CommandText = "select * from Città";
        da.Fill(dati, "City");
        cm.CommandText = "select * from Persona";
        da.Fill(dati, "Persona");
        cm.CommandText = "select * from Hobby";
        da.Fill(dati, "Hobby");
        //Gestione combobox: aggiunta opzioni.
        CMB_CIttà.DataSource = dati.Tables["City"];
        CMB_CIttà.DataValueField = "id_city";
        CMB_CIttà.DataTextField = "descrizione";

        //Gestione CheckboxList.
        CBX_List.DataSource = dati.Tables["Hobby"];
        CBX_List.DataValueField = "id";
        CBX_List.DataTextField = "descrizione";
        if (!IsPostBack)
        {
            rec_at = 0;
            Session.Add("Pos_att", rec_at);
            visualizza();
        }
        else
        {
            rec_at = (int)Session["Pos_att"];
        }

    }

    private void visualizza()
    {
        CMB_CIttà.DataBind();
        CBX_List.DataBind();

        if (dati.Tables.IndexOf("Pers_Hobby") >= 0)
        {
            dati.Tables["Pers_Hobby"].Clear();
        }
        else
        {
            if (dati.Tables["Persona"].Rows.Count > 0)
            {
                cm.CommandText = "select Id_Hobby from Pers_Hobby where id_per=" + dati.Tables["Persona"].Rows[rec_at][0] + ";";
                da.Fill(dati, "Pers_Hobby");
            }
        }

        //Gestione Textbox.
        if (dati.Tables["Persona"].Rows.Count > 0)
        {
            TXB_Cod.Text = dati.Tables["Persona"].Rows[rec_at][0].ToString();
            TXB_Nome.Text = dati.Tables["Persona"].Rows[rec_at][1].ToString();
            TXB_Cognome.Text = dati.Tables["Persona"].Rows[rec_at][2].ToString();
            CMB_CIttà.SelectedValue = dati.Tables["Persona"].Rows[rec_at][3].ToString();
            for (int j = 0; j < dati.Tables["Pers_Hobby"].Rows.Count; j++)
            {
                CBX_List.Items.FindByValue(dati.Tables["Pers_Hobby"].Rows[j][0].ToString()).Selected = true;
            }
        }
    }

    //Gestione bottoni.
    protected void BTN_Primo_Click(object sender, EventArgs e)
    {
        rec_at = 0;
        Session.Add("Pos_att", rec_at);
        visualizza();
    }

    protected void BTN_Avanti_Click(object sender, EventArgs e)
    {
        //Estrapolo del numero di righe della tabella persona e lo confronto con quella attuale per capire se si è già all'ultima posizione.
        int n = dati.Tables["Persona"].Rows.Count - 1;
        if (rec_at == n)
        {
            Response.Write("Sei già all'ultima posizione");
        }
        else
        {
            rec_at++;
            Session.Add("Pos_att", rec_at);
        }
        visualizza();
    }

    protected void BTN_Ultimo_Click(object sender, EventArgs e)
    {
        rec_at = dati.Tables["Persona"].Rows.Count - 1;
        Session.Add("Pos_att", rec_at);
        visualizza();
    }


    protected void BTN_Indietro_Click(object sender, EventArgs e)
    {
        rec_at--;
        if (rec_at < 0)
        {
            rec_at = 0;
            Response.Write("Sei già alla prima posizione");
        }
        Session.Add("Pos_att", rec_at);
        visualizza();
    }

    protected void BTN_Inserisci_Click(object sender, EventArgs e)
    {
        //Inserisci persona
        //Rilevare id persona con una select
        //per ogni codice hobby inserisco codice persona e codice hobby nella tabella pers_hobby
        //Aggiornare la tabella in memoria
        //rec_att = indice dell'ultimo record


        //Inserimento nome, cognome e città di residenza di una nuova persona nella tabella persone.
        cm.CommandText = "Insert into Persona(nome, cognome, città_res) values ('" + TXB_Nome.Text + "', '" + TXB_Cognome.Text + "', " + CMB_CIttà.SelectedValue + ");";
        cm.ExecuteNonQuery();

        //Vettore che conterrà tutti gli hobby selezionati.
        //String[] hobbies = Request.QueryString.GetValues("CBX_list"); //Vengono inseriti gli hobby checkati nel vettore.


            //Vengono inseriti nuovi record nella tabella in base al numero di hobby selezionati per una certa persona.
        for (int j = 0; j < CBX_List.Items.Count; j++)
        {
            //Inserimento della persona e hobby nella tabella pers_hobby. Oppure dati.tables["Persona"].Rows[rec_att][1].
            if (CBX_List.Items[j].Selected)
            {
                cm.CommandText = "Insert into Pers_Hobby(Id_per, Id_Hobby) values ((select MAX(ID_P) from Persona), " + CBX_List.Items[j].Value + ");";
                cm.ExecuteNonQuery();
            }
        }
        //Aggiornamento tabella.
        dati.Tables["Persona"].Clear();
        cm.CommandText = "select * from Persona";
        da.Fill(dati, "Persona");
        rec_at = dati.Tables["Persona"].Rows.Count - 1;
        visualizza();
        Session.Add("Pos_att", rec_at);
    }

    protected void BTN_Modifica_Click(object sender, EventArgs e)
    {
        //Modifico persona
        //Elimino tutti gli hobby presenti nella tabella della persona da modificare
        //per ogni codice hobby inserisco codice persona e codice hobby nella tabella pers hobby
        //Aggiorna tabelle in memoria

        //Modifica del nome.
        if (TXB_Nome.Text != "")
        {
            cm.CommandText = "Update Persona set nome= '" + TXB_Nome.Text + "' where ID_P = " + TXB_Cod.Text + ";";
            cm.ExecuteNonQuery();
        }
        //Modifica del cognome.
        if (TXB_Cognome.Text != "")
        {
            cm.CommandText = "Update Persona set cognome= '" + TXB_Cognome.Text + "' where ID_P = " + TXB_Cod.Text + ";";
            cm.ExecuteNonQuery();
        }

        //Modifica della città.
        /*cm.CommandText = "Update Persona set città_res= '" + Request.QueryString["TXB_Cod"] + "' where ID_P = " + TXB_Cod.Text + ";";
        cm.ExecuteNonQuery();

        //Modifica degli hobby.
        //Cancellazione hobby
        /*cm.CommandText = "Delete from Pers_Hobby where Id_per= " + TXB_Cod.Text + ";";
        cm.ExecuteNonQuery();

        //Inserimento hobby.
        String[] hobbies = Request.QueryString["CBX_List"].Split(','); //Vettore contenente gli hobbies selezionati.

        for (int i = 0; i < hobbies.Length; i++)
        {
            cm.CommandText = "Insert into Pers_Hobby(Id_per, Id_Hobby) values (" + TXB_Cod.Text + ", " + hobbies[i] + ");";
            cm.ExecuteNonQuery();
        }*/

        //Aggiornamento tabella.
        dati.Tables["Persona"].Clear();
        cm.CommandText = "select * from Persona";
        da.Fill(dati, "Persona");
        rec_at = dati.Tables["Persona"].Rows.Count - 1;
        Session.Add("Pos_att", rec_at);
    }

    protected void BTN_Cancella_Click(object sender, EventArgs e)
    {
        //Elimino tutti gli hobby presenti nella tabella della persona da eliminare
        //elimino persona
        //aggiorno tabelle
        //rec_attuale = record precedente a quello eliminato per gestire la visualizzazione.

        //Cancellazione hobby.
        cm.CommandText = "Delete from Pers_Hobby where id_per = " + TXB_Cod.Text + ";";
        cm.ExecuteNonQuery();
        //Cancellazione persona.
        cm.CommandText = "Delete from Persona where ID_P = " + TXB_Cod.Text + ";";
        cm.ExecuteNonQuery();
    }

    protected void Vis_City_Click(object sender, EventArgs e)
    {
        Session.Add("City", dati.Tables["City"]);
        Response.Redirect("City.aspx");
    }

    protected void btn_hobby_Click(object sender, EventArgs e)
    {
        Session.Add("Hobby", dati.Tables["Hobby"]);
        Response.Redirect("Hobby.aspx");
    }
}