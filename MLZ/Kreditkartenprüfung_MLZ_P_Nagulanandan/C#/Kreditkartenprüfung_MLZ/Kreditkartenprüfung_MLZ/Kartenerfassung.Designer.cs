namespace Kreditkartenprüfung_MLZ
{
    partial class Kartenerfassung
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
            this.btnCancel = new System.Windows.Forms.Button();
            this.btnBuy = new System.Windows.Forms.Button();
            this.cbxType = new System.Windows.Forms.ComboBox();
            this.tbxCVV = new System.Windows.Forms.TextBox();
            this.tbxValidMM = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.tbxBirthDate = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.tbxCardnumber4 = new System.Windows.Forms.TextBox();
            this.tbxCardnumber3 = new System.Windows.Forms.TextBox();
            this.tbxCardnumber2 = new System.Windows.Forms.TextBox();
            this.tbxCardnumber1 = new System.Windows.Forms.TextBox();
            this.tbxSurname = new System.Windows.Forms.TextBox();
            this.tbxName = new System.Windows.Forms.TextBox();
            this.lblCardnumber = new System.Windows.Forms.Label();
            this.lblSurname = new System.Windows.Forms.Label();
            this.lblName = new System.Windows.Forms.Label();
            this.lblTitle = new System.Windows.Forms.Label();
            this.tbxValidYYYY = new System.Windows.Forms.TextBox();
            this.lblMM = new System.Windows.Forms.Label();
            this.lblYYYY = new System.Windows.Forms.Label();
            this.lblValidation = new System.Windows.Forms.Label();
            this.lblMessage = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(141, 410);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 45;
            this.btnCancel.Text = "Abbrechen";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // btnBuy
            // 
            this.btnBuy.Location = new System.Drawing.Point(35, 410);
            this.btnBuy.Name = "btnBuy";
            this.btnBuy.Size = new System.Drawing.Size(75, 23);
            this.btnBuy.TabIndex = 44;
            this.btnBuy.Text = "Speichern";
            this.btnBuy.UseVisualStyleBackColor = true;
            this.btnBuy.Click += new System.EventHandler(this.btnBuy_Click);
            // 
            // cbxType
            // 
            this.cbxType.FormattingEnabled = true;
            this.cbxType.Items.AddRange(new object[] {
            "Visa",
            "Master Card",
            "Diner Card"});
            this.cbxType.Location = new System.Drawing.Point(226, 364);
            this.cbxType.Name = "cbxType";
            this.cbxType.Size = new System.Drawing.Size(226, 21);
            this.cbxType.TabIndex = 41;
            // 
            // tbxCVV
            // 
            this.tbxCVV.Location = new System.Drawing.Point(225, 326);
            this.tbxCVV.Name = "tbxCVV";
            this.tbxCVV.Size = new System.Drawing.Size(227, 20);
            this.tbxCVV.TabIndex = 40;
            // 
            // tbxValidMM
            // 
            this.tbxValidMM.Location = new System.Drawing.Point(271, 288);
            this.tbxValidMM.Name = "tbxValidMM";
            this.tbxValidMM.Size = new System.Drawing.Size(61, 20);
            this.tbxValidMM.TabIndex = 39;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(32, 367);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(81, 13);
            this.label4.TabIndex = 38;
            this.label4.Text = "Kreditkartentyp:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(32, 329);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(113, 13);
            this.label3.TabIndex = 37;
            this.label3.Text = "Sicherheitscode (CVV)";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(32, 291);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(53, 13);
            this.label2.TabIndex = 36;
            this.label2.Text = "Gültig bis:";
            // 
            // tbxBirthDate
            // 
            this.tbxBirthDate.Location = new System.Drawing.Point(226, 161);
            this.tbxBirthDate.Name = "tbxBirthDate";
            this.tbxBirthDate.Size = new System.Drawing.Size(227, 20);
            this.tbxBirthDate.TabIndex = 35;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(32, 164);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(76, 13);
            this.label1.TabIndex = 34;
            this.label1.Text = "Geburtsdatum:";
            // 
            // tbxCardnumber4
            // 
            this.tbxCardnumber4.Location = new System.Drawing.Point(353, 237);
            this.tbxCardnumber4.Name = "tbxCardnumber4";
            this.tbxCardnumber4.Size = new System.Drawing.Size(100, 20);
            this.tbxCardnumber4.TabIndex = 33;
            // 
            // tbxCardnumber3
            // 
            this.tbxCardnumber3.Location = new System.Drawing.Point(247, 237);
            this.tbxCardnumber3.Name = "tbxCardnumber3";
            this.tbxCardnumber3.Size = new System.Drawing.Size(100, 20);
            this.tbxCardnumber3.TabIndex = 32;
            // 
            // tbxCardnumber2
            // 
            this.tbxCardnumber2.Location = new System.Drawing.Point(141, 237);
            this.tbxCardnumber2.Name = "tbxCardnumber2";
            this.tbxCardnumber2.Size = new System.Drawing.Size(100, 20);
            this.tbxCardnumber2.TabIndex = 31;
            // 
            // tbxCardnumber1
            // 
            this.tbxCardnumber1.Location = new System.Drawing.Point(35, 237);
            this.tbxCardnumber1.Name = "tbxCardnumber1";
            this.tbxCardnumber1.Size = new System.Drawing.Size(100, 20);
            this.tbxCardnumber1.TabIndex = 30;
            // 
            // tbxSurname
            // 
            this.tbxSurname.Location = new System.Drawing.Point(226, 123);
            this.tbxSurname.Name = "tbxSurname";
            this.tbxSurname.Size = new System.Drawing.Size(227, 20);
            this.tbxSurname.TabIndex = 29;
            // 
            // tbxName
            // 
            this.tbxName.Location = new System.Drawing.Point(226, 85);
            this.tbxName.Name = "tbxName";
            this.tbxName.Size = new System.Drawing.Size(227, 20);
            this.tbxName.TabIndex = 28;
            // 
            // lblCardnumber
            // 
            this.lblCardnumber.AutoSize = true;
            this.lblCardnumber.Location = new System.Drawing.Point(32, 209);
            this.lblCardnumber.Name = "lblCardnumber";
            this.lblCardnumber.Size = new System.Drawing.Size(78, 13);
            this.lblCardnumber.TabIndex = 27;
            this.lblCardnumber.Text = "Kartennummer:";
            // 
            // lblSurname
            // 
            this.lblSurname.AutoSize = true;
            this.lblSurname.Location = new System.Drawing.Point(32, 126);
            this.lblSurname.Name = "lblSurname";
            this.lblSurname.Size = new System.Drawing.Size(52, 13);
            this.lblSurname.TabIndex = 26;
            this.lblSurname.Text = "Vorname:";
            // 
            // lblName
            // 
            this.lblName.AutoSize = true;
            this.lblName.Location = new System.Drawing.Point(32, 88);
            this.lblName.Name = "lblName";
            this.lblName.Size = new System.Drawing.Size(38, 13);
            this.lblName.TabIndex = 25;
            this.lblName.Text = "Name:";
            // 
            // lblTitle
            // 
            this.lblTitle.AutoSize = true;
            this.lblTitle.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTitle.Location = new System.Drawing.Point(105, 27);
            this.lblTitle.Name = "lblTitle";
            this.lblTitle.Size = new System.Drawing.Size(269, 29);
            this.lblTitle.TabIndex = 24;
            this.lblTitle.Text = "Kreditkartenerfassung";
            // 
            // tbxValidYYYY
            // 
            this.tbxValidYYYY.Location = new System.Drawing.Point(386, 288);
            this.tbxValidYYYY.Name = "tbxValidYYYY";
            this.tbxValidYYYY.Size = new System.Drawing.Size(67, 20);
            this.tbxValidYYYY.TabIndex = 46;
            // 
            // lblMM
            // 
            this.lblMM.AutoSize = true;
            this.lblMM.Location = new System.Drawing.Point(230, 291);
            this.lblMM.Name = "lblMM";
            this.lblMM.Size = new System.Drawing.Size(25, 13);
            this.lblMM.TabIndex = 47;
            this.lblMM.Text = "MM";
            // 
            // lblYYYY
            // 
            this.lblYYYY.AutoSize = true;
            this.lblYYYY.Location = new System.Drawing.Point(345, 291);
            this.lblYYYY.Name = "lblYYYY";
            this.lblYYYY.Size = new System.Drawing.Size(35, 13);
            this.lblYYYY.TabIndex = 48;
            this.lblYYYY.Text = "YYYY";
            // 
            // lblValidation
            // 
            this.lblValidation.AutoSize = true;
            this.lblValidation.Location = new System.Drawing.Point(32, 453);
            this.lblValidation.Name = "lblValidation";
            this.lblValidation.Size = new System.Drawing.Size(0, 13);
            this.lblValidation.TabIndex = 49;
            // 
            // lblMessage
            // 
            this.lblMessage.AutoSize = true;
            this.lblMessage.Location = new System.Drawing.Point(32, 484);
            this.lblMessage.Name = "lblMessage";
            this.lblMessage.Size = new System.Drawing.Size(0, 13);
            this.lblMessage.TabIndex = 50;
            // 
            // Kartenerfassung
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(484, 561);
            this.Controls.Add(this.lblMessage);
            this.Controls.Add(this.lblValidation);
            this.Controls.Add(this.lblYYYY);
            this.Controls.Add(this.lblMM);
            this.Controls.Add(this.tbxValidYYYY);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnBuy);
            this.Controls.Add(this.cbxType);
            this.Controls.Add(this.tbxCVV);
            this.Controls.Add(this.tbxValidMM);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.tbxBirthDate);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.tbxCardnumber4);
            this.Controls.Add(this.tbxCardnumber3);
            this.Controls.Add(this.tbxCardnumber2);
            this.Controls.Add(this.tbxCardnumber1);
            this.Controls.Add(this.tbxSurname);
            this.Controls.Add(this.tbxName);
            this.Controls.Add(this.lblCardnumber);
            this.Controls.Add(this.lblSurname);
            this.Controls.Add(this.lblName);
            this.Controls.Add(this.lblTitle);
            this.Name = "Kartenerfassung";
            this.Text = "Kartenerfassung";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Button btnBuy;
        private System.Windows.Forms.ComboBox cbxType;
        private System.Windows.Forms.TextBox tbxCVV;
        private System.Windows.Forms.TextBox tbxValidMM;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox tbxBirthDate;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox tbxCardnumber4;
        private System.Windows.Forms.TextBox tbxCardnumber3;
        private System.Windows.Forms.TextBox tbxCardnumber2;
        private System.Windows.Forms.TextBox tbxCardnumber1;
        private System.Windows.Forms.TextBox tbxSurname;
        private System.Windows.Forms.TextBox tbxName;
        private System.Windows.Forms.Label lblCardnumber;
        private System.Windows.Forms.Label lblSurname;
        private System.Windows.Forms.Label lblName;
        private System.Windows.Forms.Label lblTitle;
        private System.Windows.Forms.TextBox tbxValidYYYY;
        private System.Windows.Forms.Label lblMM;
        private System.Windows.Forms.Label lblYYYY;
        private System.Windows.Forms.Label lblValidation;
        private System.Windows.Forms.Label lblMessage;
    }
}