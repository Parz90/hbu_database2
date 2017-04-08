using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ArztDB
{
    public partial class A4Form : Form
    {
        public A4Form()
        {
            InitializeComponent();
        }

        private void A4Form_Load(object sender, EventArgs e)
        {
            OrtListe();
        }

        private void btnInsert_Click(object sender, EventArgs e)
        {
            if (tbPLZ.Text == string.Empty || tbOrt.Text == string.Empty)
            {
                MessageBox.Show("Bitte Eingabefelder vollständig erfassen.", "Eingabe", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                tbPLZ.Focus();
                return;
            }

            int plz = 0;
            if (!int.TryParse(tbPLZ.Text, out plz))
            {
                MessageBox.Show("Ungültige PLZ eingetragen.", "Eingabe", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                tbPLZ.Focus();
                return;
            }

            // Ort einfügen
            if (ArztDB.InsertOrt(plz, tbOrt.Text))
            {
                // Liste anzeigen
                OrtListe();
            }
        }

        private void OrtListe()
        {
            dgvOrt.Rows.Clear();

            DataSet ds = ArztDB.PlzListe();
            if (ds != null)
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    int row = dgvOrt.Rows.Add();
                    dgvOrt.Rows[row].Cells[0].Value = dr["PLZ_ID"];
                    dgvOrt.Rows[row].Cells[1].Value = dr["PLZ_ORT"];
                }
            }
        }
    }
}
