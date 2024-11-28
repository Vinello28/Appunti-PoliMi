namespace DeskAppWS_Vianello
{
    partial class Form1
    {
        /// <summary>
        /// Variabile di progettazione necessaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Pulire le risorse in uso.
        /// </summary>
        /// <param name="disposing">ha valore true se le risorse gestite devono essere eliminate, false in caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Codice generato da Progettazione Windows Form

        /// <summary>
        /// Metodo necessario per il supporto della finestra di progettazione. Non modificare
        /// il contenuto del metodo con l'editor di codice.
        /// </summary>
        private void InitializeComponent()
        {
            this.btn_breve = new System.Windows.Forms.Button();
            this.btn_esteso = new System.Windows.Forms.Button();
            this.lbl_vis = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.txb_tel = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txb_id = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.btn_clear = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btn_breve
            // 
            this.btn_breve.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btn_breve.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_breve.Location = new System.Drawing.Point(282, 134);
            this.btn_breve.Name = "btn_breve";
            this.btn_breve.Size = new System.Drawing.Size(88, 25);
            this.btn_breve.TabIndex = 0;
            this.btn_breve.Text = "Elenco breve";
            this.btn_breve.UseVisualStyleBackColor = true;
            this.btn_breve.Click += new System.EventHandler(this.btn_breve_Click);
            // 
            // btn_esteso
            // 
            this.btn_esteso.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btn_esteso.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_esteso.Location = new System.Drawing.Point(188, 134);
            this.btn_esteso.Name = "btn_esteso";
            this.btn_esteso.Size = new System.Drawing.Size(88, 25);
            this.btn_esteso.TabIndex = 1;
            this.btn_esteso.Text = "Elenco esteso";
            this.btn_esteso.UseVisualStyleBackColor = true;
            this.btn_esteso.Click += new System.EventHandler(this.btn_esteso_Click);
            // 
            // lbl_vis
            // 
            this.lbl_vis.Location = new System.Drawing.Point(24, 171);
            this.lbl_vis.Name = "lbl_vis";
            this.lbl_vis.Size = new System.Drawing.Size(404, 270);
            this.lbl_vis.TabIndex = 3;
            this.lbl_vis.Text = "label1";
            // 
            // button1
            // 
            this.button1.Cursor = System.Windows.Forms.Cursors.Hand;
            this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.button1.Location = new System.Drawing.Point(368, 91);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(60, 20);
            this.button1.TabIndex = 2;
            this.button1.Text = "Modifica";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.btn_modifica_Click);
            // 
            // txb_tel
            // 
            this.txb_tel.Location = new System.Drawing.Point(251, 91);
            this.txb_tel.Name = "txb_tel";
            this.txb_tel.Size = new System.Drawing.Size(111, 20);
            this.txb_tel.TabIndex = 4;
            this.txb_tel.Text = "telefono ufficio...";
            this.txb_tel.Click += new System.EventHandler(this.txb_tel_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.label1.Location = new System.Drawing.Point(9, 92);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(173, 17);
            this.label1.TabIndex = 5;
            this.label1.Text = "- Inserire il nuovo numero:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Tahoma", 22F, System.Drawing.FontStyle.Bold);
            this.label2.Location = new System.Drawing.Point(55, 9);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(321, 36);
            this.label2.TabIndex = 6;
            this.label2.Text = "Gestione Dipendenti";
            // 
            // txb_id
            // 
            this.txb_id.Location = new System.Drawing.Point(188, 91);
            this.txb_id.Name = "txb_id";
            this.txb_id.Size = new System.Drawing.Size(57, 20);
            this.txb_id.TabIndex = 7;
            this.txb_id.Text = "     ID...";
            this.txb_id.Click += new System.EventHandler(this.txb_id_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.label3.Location = new System.Drawing.Point(9, 138);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(132, 17);
            this.label3.TabIndex = 8;
            this.label3.Text = "- Scegliere l\'elenco:";
            // 
            // btn_clear
            // 
            this.btn_clear.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btn_clear.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_clear.Location = new System.Drawing.Point(376, 134);
            this.btn_clear.Name = "btn_clear";
            this.btn_clear.Size = new System.Drawing.Size(52, 25);
            this.btn_clear.TabIndex = 9;
            this.btn_clear.Text = "Pulisci";
            this.btn_clear.UseVisualStyleBackColor = true;
            this.btn_clear.Click += new System.EventHandler(this.btn_clear_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(456, 450);
            this.Controls.Add(this.btn_clear);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txb_id);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txb_tel);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.lbl_vis);
            this.Controls.Add(this.btn_esteso);
            this.Controls.Add(this.btn_breve);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btn_breve;
        private System.Windows.Forms.Button btn_esteso;
        private System.Windows.Forms.Label lbl_vis;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox txb_tel;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txb_id;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btn_clear;
    }
}

