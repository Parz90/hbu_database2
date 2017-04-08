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
    public partial class A2Form : Form
    {
        public A2Form()
        {
            InitializeComponent();
        }

        private void A2Form_Load(object sender, EventArgs e)
        {
            tbDiagnose.Text = "Angina";
        }

        private void btnCalc_Click(object sender, EventArgs e)
        {
            lbResult.Text = "0";

            int result = ArztDB.GetNumKonsultation(tbDiagnose.Text);
            lbResult.Text = result.ToString();
        }
    }
}
