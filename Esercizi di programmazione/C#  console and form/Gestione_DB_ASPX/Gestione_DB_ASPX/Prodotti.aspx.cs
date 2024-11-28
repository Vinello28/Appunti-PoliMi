using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Prodotti : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cm;
    SqlDataAdapter da;
    DataSet dati;
    DataSet dati_1;
    int rec_at;

    protected void Page_Load(object sender, EventArgs e)

    {
        cn = new SqlConnection();
        cm = new SqlCommand();
        da = new SqlDataAdapter();
        dati = new DataSet();

        cn.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Utente\Documents\Prova.mdf;Integrated Security=True;Connect Timeout=30";
        cn.Open();

        cm.CommandType = CommandType.Text;
        cm.Connection = cn;
        da.SelectCommand = cm;

        cm.CommandText = "select * from Città";
        da.Fill(dati, "Città");
        cm.CommandText = "select * from Persona";
        da.Fill(dati, "Persona");
        cm.CommandText = "select * from Hobby";
        da.Fill(dati, "Hobby");
        Session.Add("D", dati);
        Session.Add("da", da);

        if (!IsPostBack)
        {
            rec_at = 0;
            Session.Add("Rec_at", rec_at);

            Txt_Codice.Text = dati.Tables["Persona"].Rows[rec_at][0].ToString();
            Txt_Nome.Text = dati.Tables["Persona"].Rows[rec_at][1].ToString();
            Txt_Cognome.Text = dati.Tables["persona"].Rows[rec_at][2].ToString();

            DDL_Città.DataSource = dati.Tables["Città"];
            DDL_Città.DataTextField = "Nome";
            DDL_Città.DataValueField = "ID_Città";
            DDL_Città.DataBind();
        }
        else
        {
            rec_at = (int)Session["Rec_at"];
        }
    }

    protected void Aggiorna()
    {
        Txt_Codice.Text = dati.Tables["Persona"].Rows[rec_at][0].ToString();
        Txt_Nome.Text = dati.Tables["Persona"].Rows[rec_at][1].ToString();
        Txt_Cognome.Text = dati.Tables["persona"].Rows[rec_at][2].ToString();
        DDL_Città.Text = dati.Tables["persona"].Rows[rec_at][3].ToString();
    }

    protected void Btn_Primo_Click(object sender, EventArgs e)
    {
        rec_at = 0;
        Session.Add("Rec_at", rec_at);
        Aggiorna();
    }

    protected void Btn_Indietro_Click(object sender, EventArgs e)
    {
        rec_at--;
        if (rec_at < 0)
            rec_at = 0;
        Session.Add("Rec_at", rec_at);
        Aggiorna();
    }

    protected void Btn_Avanti_Click(object sender, EventArgs e)
    {
        rec_at++;
        if (rec_at > dati.Tables["Persona"].Rows.Count - 1)
            rec_at = dati.Tables["Persona"].Rows.Count - 1;
        Session.Add("Rec_at", rec_at);
        Aggiorna();
    }

    protected void Btn_Ultimo_Click(object sender, EventArgs e)
    {
        rec_at = dati.Tables["Persona"].Rows.Count - 1;
        Session.Add("Rec_at", rec_at);
        Aggiorna();
    }

    protected void Btn_Inserisci_Click(object sender, EventArgs e)
    {
        cm.CommandText = "Insert into Persona (Nome, Cognome, Città) values ('" + Txt_Nome.Text + "','" + Txt_Cognome.Text + "'," + DDL_Città.SelectedValue + ");";
        cm.ExecuteNonQuery();

        dati.Tables["Persona"].Clear();
        cm.CommandText = "select * from Persona";
        da.Fill(dati, "Persona");

        rec_at = dati.Tables["Persona"].Rows.Count - 1;
        Session.Add("Rec_at", rec_at);
        Aggiorna();

        String[] Hobby = Request.QueryString["Hobby"].Split(',');

        for (int j = 0; j < Hobby.Length; j++)
        {
            cm.CommandText = "Insert into Persona_Hobby (ID_Pers, ID_Hobby) values (" + dati.Tables["Persona"].Rows[rec_at][0] + "," + Hobby[j] + ");";
            cm.ExecuteNonQuery();
        }
    }

    protected void Btn_Modifica_Click(object sender, EventArgs e)
    {
        cm.CommandText = "UPDATE Persona SET Nome = '" + Txt_Nome.Text + "', Cognome = '" + Txt_Cognome.Text + "', Città = " + DDL_Città.SelectedValue + " WHERE ID_Pers = " + int.Parse(Txt_Codice.Text) + ";";
        cm.ExecuteNonQuery();
        cm.CommandText = "DELETE FROM Persona_Hobby WHERE ID_Pers = " + int.Parse(Txt_Codice.Text);
        cm.ExecuteNonQuery();

        String[] Hobby = Request.QueryString["Hobby"].Split(',');

        for (int j = 0; j < Hobby.Length; j++)
        {
            cm.CommandText = "Insert into Persona_Hobby (ID_Pers, ID_Hobby) values (" + dati.Tables["Persona"].Rows[rec_at][0] + "," + Hobby[j] + ");";
            cm.ExecuteNonQuery();
        }

        dati.Tables["Persona"].Clear();
        cm.CommandText = "select * from Persona";
        da.Fill(dati, "Persona");

        rec_at = dati.Tables["Persona"].Rows.Count - 1;
        Session.Add("Rec_at", rec_at);
        Aggiorna();
    }

    protected void Btn_Elimina_Click(object sender, EventArgs e)
    {
        cm.CommandText = "DELETE FROM Persona_Hobby WHERE ID_Pers = " + int.Parse(Txt_Codice.Text);
        cm.ExecuteNonQuery();
        cm.CommandText = "DELETE FROM Persona WHERE ID_Pers = " + int.Parse(Txt_Codice.Text);
        cm.ExecuteNonQuery();

        dati.Tables["Persona"].Clear();
        cm.CommandText = "select * from Persona";
        da.Fill(dati, "Persona");

        rec_at--;
        if (rec_at < 0)
            rec_at = 0;
        Session.Add("Rec_at", rec_at);
        Aggiorna();
    }
}