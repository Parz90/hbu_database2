namespace ArztDB
{
    partial class A4Form
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
            this.dgvOrt = new System.Windows.Forms.DataGridView();
            this.colPLZ = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colOrt = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.lbPLZ = new System.Windows.Forms.Label();
            this.tbPLZ = new System.Windows.Forms.TextBox();
            this.tbOrt = new System.Windows.Forms.TextBox();
            this.lbOrt = new System.Windows.Forms.Label();
            this.btnInsert = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvOrt)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvOrt
            // 
            this.dgvOrt.AllowUserToAddRows = false;
            this.dgvOrt.AllowUserToDeleteRows = false;
            this.dgvOrt.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvOrt.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colPLZ,
            this.colOrt});
            this.dgvOrt.Location = new System.Drawing.Point(2, 0);
            this.dgvOrt.Name = "dgvOrt";
            this.dgvOrt.ReadOnly = true;
            this.dgvOrt.RowHeadersVisible = false;
            this.dgvOrt.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvOrt.Size = new System.Drawing.Size(318, 570);
            this.dgvOrt.TabIndex = 1;
            // 
            // colPLZ
            // 
            this.colPLZ.HeaderText = "PLZ";
            this.colPLZ.Name = "colPLZ";
            this.colPLZ.ReadOnly = true;
            // 
            // colOrt
            // 
            this.colOrt.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.colOrt.HeaderText = "Ort";
            this.colOrt.Name = "colOrt";
            this.colOrt.ReadOnly = true;
            // 
            // lbPLZ
            // 
            this.lbPLZ.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.lbPLZ.AutoSize = true;
            this.lbPLZ.Location = new System.Drawing.Point(326, 5);
            this.lbPLZ.Name = "lbPLZ";
            this.lbPLZ.Size = new System.Drawing.Size(27, 13);
            this.lbPLZ.TabIndex = 2;
            this.lbPLZ.Text = "PLZ";
            // 
            // tbPLZ
            // 
            this.tbPLZ.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.tbPLZ.Location = new System.Drawing.Point(329, 22);
            this.tbPLZ.Name = "tbPLZ";
            this.tbPLZ.Size = new System.Drawing.Size(206, 20);
            this.tbPLZ.TabIndex = 3;
            // 
            // tbOrt
            // 
            this.tbOrt.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.tbOrt.Location = new System.Drawing.Point(329, 68);
            this.tbOrt.Name = "tbOrt";
            this.tbOrt.Size = new System.Drawing.Size(206, 20);
            this.tbOrt.TabIndex = 5;
            // 
            // lbOrt
            // 
            this.lbOrt.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.lbOrt.AutoSize = true;
            this.lbOrt.Location = new System.Drawing.Point(326, 51);
            this.lbOrt.Name = "lbOrt";
            this.lbOrt.Size = new System.Drawing.Size(21, 13);
            this.lbOrt.TabIndex = 4;
            this.lbOrt.Text = "Ort";
            // 
            // btnInsert
            // 
            this.btnInsert.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnInsert.Location = new System.Drawing.Point(459, 105);
            this.btnInsert.Name = "btnInsert";
            this.btnInsert.Size = new System.Drawing.Size(75, 23);
            this.btnInsert.TabIndex = 6;
            this.btnInsert.Text = "Einfügen";
            this.btnInsert.UseVisualStyleBackColor = true;
            this.btnInsert.Click += new System.EventHandler(this.btnInsert_Click);
            // 
            // A4Form
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(548, 572);
            this.Controls.Add(this.btnInsert);
            this.Controls.Add(this.tbOrt);
            this.Controls.Add(this.lbOrt);
            this.Controls.Add(this.tbPLZ);
            this.Controls.Add(this.lbPLZ);
            this.Controls.Add(this.dgvOrt);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "A4Form";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "PLZ bearbeiten";
            this.Load += new System.EventHandler(this.A4Form_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvOrt)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvOrt;
        private System.Windows.Forms.DataGridViewTextBoxColumn colPLZ;
        private System.Windows.Forms.DataGridViewTextBoxColumn colOrt;
        private System.Windows.Forms.Label lbPLZ;
        private System.Windows.Forms.TextBox tbPLZ;
        private System.Windows.Forms.TextBox tbOrt;
        private System.Windows.Forms.Label lbOrt;
        private System.Windows.Forms.Button btnInsert;
    }
}