using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Calcolatrice : System.Web.UI.Page
{
    private int x;
    private int y;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_calc_Click(object sender, EventArgs e)
    {
        Assegna();

        int tmp;

        if(rb_sm.Checked == true)
        {
            tmp = x + y;
            lbl_r.Text = tmp.ToString();
        }
        else
        {
            if(rb_st.Checked == true)
            {
                tmp = x - y;
                lbl_r.Text = tmp.ToString();
            }
            else
            {
                if(rb_pr.Checked == true)
                {
                    tmp = x * y;
                    lbl_r.Text = tmp.ToString();
                }
                else
                {
                    if (rb_dv.Checked == true)
                    {
                        tmp = x/y;
                        lbl_r.Text = tmp.ToString();
                    }
                }
            }
        }
    }

    public void Assegna()
    {
        int tmp;

        if (txb_n1.Text != null && txb_n2.Text != null)
        {
            x = Convert.ToInt16(txb_n1.Text);
            y = Convert.ToInt16(txb_n2.Text);

            if (y > x)
            {
                tmp = x;
                x = y;
                y = tmp;
            }
        }
    }
}