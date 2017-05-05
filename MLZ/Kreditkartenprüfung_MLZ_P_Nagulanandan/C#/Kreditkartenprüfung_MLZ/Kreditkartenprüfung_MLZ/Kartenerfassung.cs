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
    public partial class Kartenerfassung : Form
    {
        SqlConnection conn;

        public Kartenerfassung()
        {
            InitializeComponent();
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
                SqlCommand command = new SqlCommand("insertAll", conn);

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

                // SQL Stored Procedure Output 'ValidationMessage'
                SqlParameter outputParameterValidation = new SqlParameter();
                outputParameterValidation.ParameterName = "@ValidationMessage";
                outputParameterValidation.SqlDbType = System.Data.SqlDbType.VarChar;
                outputParameterValidation.Direction = System.Data.ParameterDirection.Output;
                outputParameterValidation.Size = 1000;
                command.Parameters.Add(outputParameterValidation);

                // SQL Stored Procedure Output 'ErrorMessage'
                SqlParameter outputParameterMessage = new SqlParameter();
                outputParameterMessage.ParameterName = "@Message";
                outputParameterMessage.SqlDbType = System.Data.SqlDbType.VarChar;
                outputParameterMessage.Direction = System.Data.ParameterDirection.Output;
                outputParameterMessage.Size = 1000;
                command.Parameters.Add(outputParameterMessage);

                // SQL Command Execution
                command.ExecuteNonQuery();

                // Writes Output to C# Variables
                string strValidationMessage = outputParameterValidation.Value.ToString();
                string strMessage = outputParameterMessage.Value.ToString();

                // Shows Validation and Messages on GUI
                lblValidation.Text = "Validation Message: " + strValidationMessage;
                lblMessage.Text = "Message: " + strMessage;

                // SQL connection close command
                conn.Close();


            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
