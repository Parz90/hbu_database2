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
    public partial class A3Form : Form
    {
        public A3Form()
        {
            InitializeComponent();
        }

        private void btnLoad_Click(object sender, EventArgs e)
        {
            DataSet ds = ArztDB.ArztListe();

            foreach (DataRow dr in ds.Tables[0].Rows )
            {
                int row = dgvList.Rows.Add();
                dgvList.Rows[row].Cells[0].Value = dr["AZT_ID"];
                dgvList.Rows[row].Cells[1].Value = dr["AZT_NAME"];
                dgvList.Rows[row].Cells[2].Value = dr["PLZ_ID"];
                dgvList.Rows[row].Cells[3].Value = dr["PLZ_ORT"];
            }
        }

        private void A3Form_Load(object sender, EventArgs e)
        {

        }
    }
}
