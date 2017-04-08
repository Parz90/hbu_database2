namespace ArztDB
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnA1 = new System.Windows.Forms.Button();
            this.btnA2 = new System.Windows.Forms.Button();
            this.btnA3 = new System.Windows.Forms.Button();
            this.btnA4 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnA1
            // 
            this.btnA1.Location = new System.Drawing.Point(10, 12);
            this.btnA1.Name = "btnA1";
            this.btnA1.Size = new System.Drawing.Size(273, 34);
            this.btnA1.TabIndex = 0;
            this.btnA1.Text = "A1 - Scores";
            this.btnA1.UseVisualStyleBackColor = true;
            this.btnA1.Click += new System.EventHandler(this.btnA1_Click);
            // 
            // btnA2
            // 
            this.btnA2.Location = new System.Drawing.Point(10, 52);
            this.btnA2.Name = "btnA2";
            this.btnA2.Size = new System.Drawing.Size(273, 34);
            this.btnA2.TabIndex = 1;
            this.btnA2.Text = "A2 - Anzahl Konsultationen";
            this.btnA2.UseVisualStyleBackColor = true;
            this.btnA2.Click += new System.EventHandler(this.btnA2_Click);
            // 
            // btnA3
            // 
            this.btnA3.Location = new System.Drawing.Point(10, 92);
            this.btnA3.Name = "btnA3";
            this.btnA3.Size = new System.Drawing.Size(273, 34);
            this.btnA3.TabIndex = 2;
            this.btnA3.Text = "A3 - Ärzteliste anzeigen";
            this.btnA3.UseVisualStyleBackColor = true;
            this.btnA3.Click += new System.EventHandler(this.btnA3_Click);
            // 
            // btnA4
            // 
            this.btnA4.Location = new System.Drawing.Point(10, 132);
            this.btnA4.Name = "btnA4";
            this.btnA4.Size = new System.Drawing.Size(273, 34);
            this.btnA4.TabIndex = 3;
            this.btnA4.Text = "A4 - Ortschaft einfügen";
            this.btnA4.UseVisualStyleBackColor = true;
            this.btnA4.Click += new System.EventHandler(this.btnA4_Click);
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(295, 336);
            this.Controls.Add(this.btnA4);
            this.Controls.Add(this.btnA3);
            this.Controls.Add(this.btnA2);
            this.Controls.Add(this.btnA1);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "MainForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Arzt-Datenbank";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnA1;
        private System.Windows.Forms.Button btnA2;
        private System.Windows.Forms.Button btnA3;
        private System.Windows.Forms.Button btnA4;
    }
}

