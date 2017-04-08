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
    public partial class A1Form : Form
    {
        public A1Form()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Init
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void A1Form_Load(object sender, EventArgs e)
        {
            // Felder in Standardwerten vorbelegen
            tbZ1.Text = "1";
            tbZ2.Text = "2";
            tbZ3.Text = "3";
            tbZ4.Text = "4";
            tbZ5.Text = "5";

            lbResult.Text = "0";
        }

        /// <summary>
        /// Stored procedure aufrufen
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnCalc_Click(object sender, EventArgs e)
        {
            // Methode scores() aufrufen
            int z1 = Convert.ToInt32(tbZ1.Text);
            int z2 = Convert.ToInt32(tbZ2.Text);
            int z3 = Convert.ToInt32(tbZ3.Text);
            int z4 = Convert.ToInt32(tbZ4.Text);
            int z5 = Convert.ToInt32(tbZ5.Text);

            int result = ArztDB.Scores(z1, z2, z3, z4, z5);
            lbResult.Text = result.ToString();
        }

    }
}
