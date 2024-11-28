using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DeskAppWS_Vianello.localhost;
using System.Xml;


namespace DeskAppWS_Vianello
{
    public partial class Form1 : Form
    {

        private Websrv x = new Websrv();
       

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            lbl_vis.Text = "";
        }

        public void CreaXML(string y)
        {
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(y);
            XmlNodeList nl = doc.DocumentElement.ChildNodes;
            lbl_vis.Text = "";

            for (int i = 0; i < nl.Count; i++)
            {
                for(int j = 0; j < nl[i].ChildNodes.Count; j++)
                {
                    lbl_vis.Text += nl[i].ChildNodes[j].InnerText + "  |  ";
                }
                lbl_vis.Text += "\n\n";
            }
        }

        private void btn_breve_Click(object sender, EventArgs e)
        {
            CreaXML(x.Elenco_Breve());
        }

        private void btn_esteso_Click(object sender, EventArgs e)
        {
            CreaXML(x.Elenco_Esteso());
        }

        private void btn_modifica_Click(object sender, EventArgs e)
        {
            x.Modifica(txb_id.Text, txb_tel.Text);

            txb_id.Text = "    ID...";
            txb_tel.Text = "telefono ufficio...";

            CreaXML(x.Elenco_Esteso()); //per aggiornare la label
        }

        private void txb_id_Click(object sender, EventArgs e)
        {
            txb_id.Text = "";
        }

        private void txb_tel_Click(object sender, EventArgs e)
        {
            txb_tel.Text = "";
        }

        private void btn_clear_Click(object sender, EventArgs e)
        {
            lbl_vis.Text = "";
        }
    }
}
