namespace ArztDB
{
    partial class A2Form
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
            this.lbResult = new System.Windows.Forms.Label();
            this.lbDiagnose = new System.Windows.Forms.Label();
            this.tbDiagnose = new System.Windows.Forms.TextBox();
            this.btnCalc = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lbResult
            // 
            this.lbResult.BackColor = System.Drawing.SystemColors.Info;
            this.lbResult.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbResult.Location = new System.Drawing.Point(15, 92);
            this.lbResult.Name = "lbResult";
            this.lbResult.Size = new System.Drawing.Size(274, 62);
            this.lbResult.TabIndex = 15;
            this.lbResult.Text = "0";
            this.lbResult.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // lbDiagnose
            // 
            this.lbDiagnose.AutoSize = true;
            this.lbDiagnose.Location = new System.Drawing.Point(12, 9);
            this.lbDiagnose.Name = "lbDiagnose";
            this.lbDiagnose.Size = new System.Drawing.Size(52, 13);
            this.lbDiagnose.TabIndex = 14;
            this.lbDiagnose.Text = "Diagnose";
            // 
            // tbDiagnose
            // 
            this.tbDiagnose.Location = new System.Drawing.Point(12, 25);
            this.tbDiagnose.Name = "tbDiagnose";
            this.tbDiagnose.Size = new System.Drawing.Size(277, 20);
            this.tbDiagnose.TabIndex = 13;
            // 
            // btnCalc
            // 
            this.btnCalc.Location = new System.Drawing.Point(214, 51);
            this.btnCalc.Name = "btnCalc";
            this.btnCalc.Size = new System.Drawing.Size(75, 23);
            this.btnCalc.TabIndex = 12;
            this.btnCalc.Text = "&Berechnen";
            this.btnCalc.UseVisualStyleBackColor = true;
            this.btnCalc.Click += new System.EventHandler(this.btnCalc_Click);
            // 
            // A2Form
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(302, 171);
            this.Controls.Add(this.lbResult);
            this.Controls.Add(this.lbDiagnose);
            this.Controls.Add(this.tbDiagnose);
            this.Controls.Add(this.btnCalc);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "A2Form";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Anzahl Konsultationen";
            this.Load += new System.EventHandler(this.A2Form_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbResult;
        private System.Windows.Forms.Label lbDiagnose;
        private System.Windows.Forms.TextBox tbDiagnose;
        private System.Windows.Forms.Button btnCalc;
    }
}