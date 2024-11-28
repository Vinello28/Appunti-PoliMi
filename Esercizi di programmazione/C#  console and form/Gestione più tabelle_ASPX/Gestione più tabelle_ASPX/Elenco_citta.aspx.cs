using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Elenco_citta : System.Web.UI.Page
{
    DataTable Città;
    protected void Page_Load(object sender, EventArgs e)
    {
        Città = (DataTable)Session["Città"];
        dgw_city.DataSource = Città;
        dgw_city.DataBind();
    }

    protected void btn_chiudi_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}