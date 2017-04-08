namespace ArztDB
{
    partial class A3Form
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
            this.dgvList = new System.Windows.Forms.DataGridView();
            this.colArztId = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colArztName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colPLZ = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colOrt = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btnLoad = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvList)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvList
            // 
            this.dgvList.AllowUserToAddRows = false;
            this.dgvList.AllowUserToDeleteRows = false;
            this.dgvList.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colArztId,
            this.colArztName,
            this.colPLZ,
            this.colOrt});
            this.dgvList.Location = new System.Drawing.Point(3, 1);
            this.dgvList.Name = "dgvList";
            this.dgvList.ReadOnly = true;
            this.dgvList.RowHeadersVisible = false;
            this.dgvList.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvList.Size = new System.Drawing.Size(487, 227);
            this.dgvList.TabIndex = 0;
            // 
            // colArztId
            // 
            this.colArztId.HeaderText = "Arzt Id";
            this.colArztId.Name = "colArztId";
            this.colArztId.ReadOnly = true;
            // 
            // colArztName
            // 
            this.colArztName.HeaderText = "Name";
            this.colArztName.Name = "colArztName";
            this.colArztName.ReadOnly = true;
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
            // btnLoad
            // 
            this.btnLoad.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnLoad.Location = new System.Drawing.Point(415, 234);
            this.btnLoad.Name = "btnLoad";
            this.btnLoad.Size = new System.Drawing.Size(75, 23);
            this.btnLoad.TabIndex = 1;
            this.btnLoad.Text = "&Laden";
            this.btnLoad.UseVisualStyleBackColor = true;
            this.btnLoad.Click += new System.EventHandler(this.btnLoad_Click);
            // 
            // A3Form
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(493, 264);
            this.Controls.Add(this.btnLoad);
            this.Controls.Add(this.dgvList);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "A3Form";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Ärzteliste anzeigen";
            this.Load += new System.EventHandler(this.A3Form_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvList)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvList;
        private System.Windows.Forms.DataGridViewTextBoxColumn colArztId;
        private System.Windows.Forms.DataGridViewTextBoxColumn colArztName;
        private System.Windows.Forms.DataGridViewTextBoxColumn colPLZ;
        private System.Windows.Forms.DataGridViewTextBoxColumn colOrt;
        private System.Windows.Forms.Button btnLoad;
    }
}