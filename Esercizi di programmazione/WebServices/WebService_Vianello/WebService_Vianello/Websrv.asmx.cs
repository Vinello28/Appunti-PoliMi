using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;

namespace WebService_Vianello
{
    /// <summary>
    /// Descrizione di riepilogo per Websrv
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Per consentire la chiamata di questo servizio Web dallo script utilizzando ASP.NET AJAX, rimuovere il commento dalla riga seguente. 
    // [System.Web.Script.Services.ScriptService]
    public class Websrv : System.Web.Services.WebService
    {
        SqlConnection cn;
        SqlCommand cm;
        SqlDataAdapter da;
        DataSet dati_br;
        DataSet dati_ex;

        [WebMethod]
        public String Elenco_Breve()
        {
            AccessToDB();
            cm.CommandText = "SELECT id, nome, cognome, reparto FROM Dipendenti";
            da.Fill(dati_br, "Dip_brv");
            
            return dati_br.GetXml();
        }

        [WebMethod]
        public String Elenco_Esteso()
        {
            AccessToDB();
            cm.CommandText = "SELECT id, nome, cognome, reparto, tel_ufficio, tel_azienda FROM Dipendenti";
            da.Fill(dati_ex, "Dip_ext");
            return dati_ex.GetXml();
        }

        [WebMethod]
        public void Modifica(string x, string y)
        {
            AccessToDB();
            cm.CommandText = "UPDATE Dipendenti SET tel_ufficio = " + y + " WHERE id = " + x + ";";
            cm.ExecuteNonQuery();
        }

        public void AccessToDB()
        {
            cn = new SqlConnection();
            cm = new SqlCommand();
            da = new SqlDataAdapter();
            dati_br = new DataSet();
            dati_ex = new DataSet();
            cn.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Utente\Documents\Prova.mdf;Integrated Security=True;Connect Timeout=30";
            cn.Open();
            cm.CommandType = System.Data.CommandType.Text;
            cm.Connection = cn;
            da.SelectCommand = cm;
        }
    }
}
