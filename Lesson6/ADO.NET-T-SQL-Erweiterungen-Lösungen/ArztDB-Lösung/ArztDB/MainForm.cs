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
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }

        private void btnA1_Click(object sender, EventArgs e)
        {
            A1Form f = new A1Form();
            f.ShowDialog();
        }

        private void btnA2_Click(object sender, EventArgs e)
        {
            A2Form f = new A2Form();
            f.ShowDialog();
        }

        private void btnA3_Click(object sender, EventArgs e)
        {
            A3Form f = new A3Form();
            f.ShowDialog();
        }

        private void btnA4_Click(object sender, EventArgs e)
        {
            A4Form f = new A4Form();
            f.ShowDialog();
        }
    }
}
