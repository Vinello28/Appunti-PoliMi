using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class WebForm1 : System.Web.UI.Page
{
    private int x;

    SqlConnection cn = new SqlConnection();
    SqlCommand cm = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataSet dati = new DataSet();
    
    

    protected void Page_Load(object sender, EventArgs e)
    {
        cn.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Utente\Documents\Prova.mdf;Integrated Security=True;Connect Timeout=30";
        cn.Open();
        cm.CommandType = CommandType.Text;
        cm.Connection = cn;
        cm.CommandText = "SELECT * FROM Persona";
        da.SelectCommand = cm;
        da.Fill(dati, "Perona");

        if (!IsPostBack)
        {
            x = 0;
            txb1.Text = "Inserisci cognome";

            Session.Add("X", x);
        }
        else
        {
            x = (int) Session["X"];
        }
    }



    protected void btn1_Click(object sender, EventArgs e)
    {
        x++;
        txb1.Text = x.ToString();
        Session.Add("X", x);
    }
}