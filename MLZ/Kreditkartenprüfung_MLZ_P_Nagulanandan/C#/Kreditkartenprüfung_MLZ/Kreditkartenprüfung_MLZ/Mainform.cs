using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Configuration;

namespace Kreditkartenprüfung_MLZ
{
    public partial class Mainform : Form
    {
        Kartenerfassung kartenerfassung = new Kartenerfassung();
        SqlConnection conn;
        public Mainform()
        {
            InitializeComponent();
        }

        private void btnCreate_Click(object sender, EventArgs e)
        {
            if (kartenerfassung.IsDisposed)
            {
                kartenerfassung = new Kartenerfassung();
            }
            kartenerfassung.Show();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnBuy_Click(object sender, EventArgs e)
        {
            using (conn = new SqlConnection())
            {
                // Create the connectionString
                string connString = "Data Source=WIN-KQ07L02UBSO\\SQLEXPRESS;Initial Catalog=Kreditkartenpruefung;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
                conn.ConnectionString = connString;
                conn.Open();

                // Create the command
                SqlCommand command = new SqlCommand("checkAccess", conn);

                // SQL Command Type declaration
                command.CommandType = System.Data.CommandType.StoredProcedure;

                //SQL Stored Procedure Inputs
                command.Parameters.AddWithValue("@Name", tbxName.Text);
                command.Parameters.AddWithValue("@Vorname", tbxSurname.Text);
                command.Parameters.AddWithValue("@Geburtsdatum", tbxBirthDate.Text);
                command.Parameters.AddWithValue("@Kartennummer", (tbxCardnumber1.Text + tbxCardnumber2.Text + tbxCardnumber3.Text + tbxCardnumber4.Text));
                command.Parameters.AddWithValue("@GueltigkeitMM", tbxValidMM.Text);
                command.Parameters.AddWithValue("@GueltigkeitYYYY", tbxValidYYYY.Text);
                command.Parameters.AddWithValue("@Sicherheitscode", tbxCVV.Text);
                command.Parameters.AddWithValue("@Kartentyp", cbxType.Text);

                // SQL Stored Procedure Output 'Kartensperrung'
                SqlParameter outputParameterCardLock = new SqlParameter();
                outputParameterCardLock.Value = false;
                outputParameterCardLock.ParameterName = "@Kartensperrung";
                outputParameterCardLock.SqlDbType = System.Data.SqlDbType.Bit;
                outputParameterCardLock.Direction = System.Data.ParameterDirection.Output;
                command.Parameters.Add(outputParameterCardLock);

                // SQL Stored Procedure Output 'Sperrzähler'
                SqlParameter outputParameterCardCounter = new SqlParameter();
                outputParameterCardCounter.Value = 0;
                outputParameterCardCounter.ParameterName = "@Sperrzaehler";
                outputParameterCardCounter.SqlDbType = System.Data.SqlDbType.Int;
                outputParameterCardCounter.Direction = System.Data.ParameterDirection.Output;
                command.Parameters.Add(outputParameterCardCounter);

                // SQL Stored Procedure Output 'ValidationMessage'
                SqlParameter outputParameterValidation = new SqlParameter();
                outputParameterValidation.Value = "";
                outputParameterValidation.ParameterName = "@ValidationMessage";
                outputParameterValidation.SqlDbType = System.Data.SqlDbType.VarChar;
                outputParameterValidation.Direction = System.Data.ParameterDirection.Output;
                outputParameterValidation.Size = 1000;
                command.Parameters.Add(outputParameterValidation);

                // SQL Stored Procedure Output 'Message'
                SqlParameter outputParameterMessage = new SqlParameter();
                outputParameterMessage.Value = "";
                outputParameterMessage.ParameterName = "@Message";
                outputParameterMessage.SqlDbType = System.Data.SqlDbType.VarChar;
                outputParameterMessage.Direction = System.Data.ParameterDirection.Output;
                outputParameterMessage.Size = 1000;
                command.Parameters.Add(outputParameterMessage);
                
                // SQL Command Execution 
                command.ExecuteNonQuery();

                // Writes Output to C# Variables
                string strKartensperrung = outputParameterCardLock.Value.ToString();
                bool kartensperrung = Boolean.Parse(strKartensperrung);

                string strSperrzaehler = outputParameterCardCounter.Value.ToString();
                int sperrzaehler = Int32.Parse(strSperrzaehler);

                string strValidationMessage = outputParameterValidation.Value.ToString();
                string strMessage = outputParameterMessage.Value.ToString();

                // Logic for Card Lock Symbol
                if (kartensperrung)
                {
                    pbxAccessState.Image = Kreditkartenprüfung_MLZ.Properties.Resources.Locked;
                }
                else if((sperrzaehler == 0) && (!kartensperrung))
                {
                    pbxAccessState.Image = Kreditkartenprüfung_MLZ.Properties.Resources.Confirm;
                }
                else
                {
                    pbxAccessState.Image = Kreditkartenprüfung_MLZ.Properties.Resources.Information;
                }

                // Shows Validation and Messages on GUI
                lblValidation.Text = "Validation Message: " + strValidationMessage.Replace("\n", Environment.NewLine); ;
                lblMessage.Text = "Message: " + strMessage.Replace("\n", Environment.NewLine); ;

                // SQL connection close command
                conn.Close();
            }
        }
    }
}
