using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Hobby : System.Web.UI.Page
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
        cm.CommandText = "select * from hobby";
        da.Fill(dati, "Hobby");

        dgw_hobby.DataSource = dati.Tables["Hobby"];
        dgw_hobby.DataBind();
    }

    protected void btn_chiudi_Click(object sender, EventArgs e)
    {
        Response.Redirect("Generale.aspx");
    }

    protected void dgw_hobby_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = (int)dati.Tables["Hobby"].Rows[e.RowIndex][0];
        Elimina(id);
    }
    
    //METODI
    public void Elimina(int id)
    {
        cm.CommandText = "DELETE FROM Hobby WHERE id = " + id.ToString() + ";";
        cm.ExecuteNonQuery();
        Response.Redirect("Hobby.aspx");
    }
}