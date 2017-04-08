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
            // Eingabefelder validieren

            // Methode ArztDB() aufrufen
        }

        private void OrtListe()
        {
            // Methode PlzListe() aufrufen
            // Achtung: Die gespeicherte Prozedur muss in der DB noch angelegt werden


            // Datengridview laden
        }
    }
}
