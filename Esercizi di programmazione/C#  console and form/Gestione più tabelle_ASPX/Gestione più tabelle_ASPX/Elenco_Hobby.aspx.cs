using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Elenco_Hobby : System.Web.UI.Page
{
    DataTable Hobby;
    protected void Page_Load(object sender, EventArgs e)
    {
        Hobby = (DataTable)Session["hobby"];
        dgw_hobby.DataSource = Hobby;
        dgw_hobby.DataBind();
    }

    protected void btn_chiudi_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}