using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class City : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cm;
    SqlDataAdapter da;
    DataSet dati;

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
        
        Tabella.DataSource = dati.Tables["City"];
        Tabella.DataBind();
    }

    protected void Chiudi_Click(object sender, EventArgs e)
    {
        Response.Redirect("Generale.aspx");
    }

    protected void Tabella_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        int id = (int) dati.Tables["City"].Rows[e.RowIndex][0];
        Elimina(id);
    }

    protected void Tabella_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Response.Write("riga modificata: " + e.RowIndex.ToString());
    }

    protected void Tabella_RowCreated(object sender, GridViewRowEventArgs e)
    {
        //Response.Write("riga creata");
    }

    //METODI
    public void Elimina(int id)
    {
        cm.CommandText = "DELETE FROM Città WHERE id_city = " + id.ToString() + ";";
        cm.ExecuteNonQuery();
        Response.Redirect("City.aspx");
    }
}