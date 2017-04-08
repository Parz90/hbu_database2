namespace ArztDB
{
    partial class A1Form
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
            this.btnCalc = new System.Windows.Forms.Button();
            this.tbZ1 = new System.Windows.Forms.TextBox();
            this.lbZ1 = new System.Windows.Forms.Label();
            this.lbZ2 = new System.Windows.Forms.Label();
            this.tbZ2 = new System.Windows.Forms.TextBox();
            this.lbZ3 = new System.Windows.Forms.Label();
            this.tbZ3 = new System.Windows.Forms.TextBox();
            this.lbZ4 = new System.Windows.Forms.Label();
            this.tbZ4 = new System.Windows.Forms.TextBox();
            this.lbZ5 = new System.Windows.Forms.Label();
            this.tbZ5 = new System.Windows.Forms.TextBox();
            this.lbResult = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btnCalc
            // 
            this.btnCalc.Location = new System.Drawing.Point(200, 134);
            this.btnCalc.Name = "btnCalc";
            this.btnCalc.Size = new System.Drawing.Size(75, 23);
            this.btnCalc.TabIndex = 0;
            this.btnCalc.Text = "&Berechnen";
            this.btnCalc.UseVisualStyleBackColor = true;
            this.btnCalc.Click += new System.EventHandler(this.btnCalc_Click);
            // 
            // tbZ1
            // 
            this.tbZ1.Location = new System.Drawing.Point(65, 30);
            this.tbZ1.Name = "tbZ1";
            this.tbZ1.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.tbZ1.Size = new System.Drawing.Size(100, 20);
            this.tbZ1.TabIndex = 1;
            // 
            // lbZ1
            // 
            this.lbZ1.AutoSize = true;
            this.lbZ1.Location = new System.Drawing.Point(13, 30);
            this.lbZ1.Name = "lbZ1";
            this.lbZ1.Size = new System.Drawing.Size(37, 13);
            this.lbZ1.TabIndex = 2;
            this.lbZ1.Text = "Zahl 1";
            // 
            // lbZ2
            // 
            this.lbZ2.AutoSize = true;
            this.lbZ2.Location = new System.Drawing.Point(13, 56);
            this.lbZ2.Name = "lbZ2";
            this.lbZ2.Size = new System.Drawing.Size(37, 13);
            this.lbZ2.TabIndex = 4;
            this.lbZ2.Text = "Zahl 2";
            // 
            // tbZ2
            // 
            this.tbZ2.Location = new System.Drawing.Point(65, 56);
            this.tbZ2.Name = "tbZ2";
            this.tbZ2.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.tbZ2.Size = new System.Drawing.Size(99, 20);
            this.tbZ2.TabIndex = 3;
            // 
            // lbZ3
            // 
            this.lbZ3.AutoSize = true;
            this.lbZ3.Location = new System.Drawing.Point(13, 82);
            this.lbZ3.Name = "lbZ3";
            this.lbZ3.Size = new System.Drawing.Size(37, 13);
            this.lbZ3.TabIndex = 6;
            this.lbZ3.Text = "Zahl 3";
            // 
            // tbZ3
            // 
            this.tbZ3.Location = new System.Drawing.Point(65, 82);
            this.tbZ3.Name = "tbZ3";
            this.tbZ3.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.tbZ3.Size = new System.Drawing.Size(99, 20);
            this.tbZ3.TabIndex = 5;
            // 
            // lbZ4
            // 
            this.lbZ4.AutoSize = true;
            this.lbZ4.Location = new System.Drawing.Point(13, 108);
            this.lbZ4.Name = "lbZ4";
            this.lbZ4.Size = new System.Drawing.Size(37, 13);
            this.lbZ4.TabIndex = 8;
            this.lbZ4.Text = "Zahl 4";
            // 
            // tbZ4
            // 
            this.tbZ4.Location = new System.Drawing.Point(65, 108);
            this.tbZ4.Name = "tbZ4";
            this.tbZ4.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.tbZ4.Size = new System.Drawing.Size(99, 20);
            this.tbZ4.TabIndex = 7;
            // 
            // lbZ5
            // 
            this.lbZ5.AutoSize = true;
            this.lbZ5.Location = new System.Drawing.Point(13, 134);
            this.lbZ5.Name = "lbZ5";
            this.lbZ5.Size = new System.Drawing.Size(37, 13);
            this.lbZ5.TabIndex = 10;
            this.lbZ5.Text = "Zahl 5";
            // 
            // tbZ5
            // 
            this.tbZ5.Location = new System.Drawing.Point(65, 134);
            this.tbZ5.Name = "tbZ5";
            this.tbZ5.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.tbZ5.Size = new System.Drawing.Size(99, 20);
            this.tbZ5.TabIndex = 9;
            // 
            // lbResult
            // 
            this.lbResult.BackColor = System.Drawing.SystemColors.Info;
            this.lbResult.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbResult.Location = new System.Drawing.Point(13, 173);
            this.lbResult.Name = "lbResult";
            this.lbResult.Size = new System.Drawing.Size(262, 62);
            this.lbResult.TabIndex = 11;
            this.lbResult.Text = "0";
            this.lbResult.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // A1Form
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(289, 248);
            this.Controls.Add(this.lbResult);
            this.Controls.Add(this.lbZ5);
            this.Controls.Add(this.tbZ5);
            this.Controls.Add(this.lbZ4);
            this.Controls.Add(this.tbZ4);
            this.Controls.Add(this.lbZ3);
            this.Controls.Add(this.tbZ3);
            this.Controls.Add(this.lbZ2);
            this.Controls.Add(this.tbZ2);
            this.Controls.Add(this.lbZ1);
            this.Controls.Add(this.tbZ1);
            this.Controls.Add(this.btnCalc);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "A1Form";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Aufgabe Scores";
            this.Load += new System.EventHandler(this.A1Form_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnCalc;
        private System.Windows.Forms.TextBox tbZ1;
        private System.Windows.Forms.Label lbZ1;
        private System.Windows.Forms.Label lbZ2;
        private System.Windows.Forms.TextBox tbZ2;
        private System.Windows.Forms.Label lbZ3;
        private System.Windows.Forms.TextBox tbZ3;
        private System.Windows.Forms.Label lbZ4;
        private System.Windows.Forms.TextBox tbZ4;
        private System.Windows.Forms.Label lbZ5;
        private System.Windows.Forms.TextBox tbZ5;
        private System.Windows.Forms.Label lbResult;
    }
}