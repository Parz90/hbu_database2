using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Data;

namespace ArztDB
{
    public class ArztDB
    {        
        #region Fields
        /// <summary>
        /// Connectstring from config file
        /// </summary>
        private static string _connectionString = Properties.Settings.Default.ConnectionString;

        #endregion
        

        #region Methoden 
 
        /// <summary>
        /// Scores berechnen
        /// </summary>
        /// <param name="z1">Zahl 1</param>
        /// <param name="z2">Zahl 2</param>
        /// <param name="z3">Zahl 3</param>
        /// <param name="z4">Zahl 4</param>
        /// <param name="z5">Zahl 4</param>
        /// <returns></returns>
   
        public static int Scores(int z1, int z2, int z3, int z4, int z5)
        {
            int result = 0;
            SqlConnection conn = null;

            try
            {
                conn = new SqlConnection(ArztDB._connectionString);

                SqlCommand cmd = new SqlCommand("scores", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@Z1", SqlDbType.Int).Value = z1;
                cmd.Parameters.Add("@Z2", SqlDbType.Int).Value = z2;
                cmd.Parameters.Add("@Z3", SqlDbType.Int).Value = z3;
                cmd.Parameters.Add("@Z4", SqlDbType.Int).Value = z4;
                cmd.Parameters.Add("@Z5", SqlDbType.Int).Value = z5;
                cmd.Parameters.Add("@Result", SqlDbType.Int).Direction = ParameterDirection.Output;

                // open db SqlConnection
                conn.Open();
                cmd.ExecuteNonQuery();
                result = Convert.ToInt32(cmd.Parameters["@Result"].Value);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
                return 0;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }


            return result;
        }

        /// <summary>
        /// Ermittelt die Anzahl der Konsultationen einer Diagnose
        /// </summary>
        /// <param name="diagnose">name der diagnose</param>
        /// <returns>Anzahl Konsultationen</returns>
        public static int GetNumKonsultation(string diagnose)
        {
            int result = 0;
            SqlConnection conn = null;

            try
            {
                conn = new SqlConnection(ArztDB._connectionString);

                SqlCommand cmd = new SqlCommand("AnzahlKonsultationen", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@DiagnoseName", SqlDbType.NVarChar).Value = diagnose;

                // open db SqlConnection
                conn.Open();
                //cmd.ExecuteNonQuery();
                result = Convert.ToInt32(cmd.ExecuteScalar());
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
                return 0;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }



            return result;
        }

        /// <summary>
        /// Arztliste anzeigen
        /// </summary>
        /// <returns>dataset</returns>
        public static DataSet ArztListe()
        {
            DataSet ds = new DataSet();

            // ...

            return ds;
        }

        /// <summary>
        /// PLZ einfügen
        /// </summary>
        /// <param name="plz">PLZ</param>
        /// <param name="ort">Ort</param>
        /// <returns></returns>
        public static bool InsertOrt(int plz, string ort)
        {
            bool result = false;

            // ...

            return result;
        }

        public static DataSet PlzListe()
        {
            DataSet ds = new DataSet();

            // ...

            return ds;
        }

        #endregion
    }
}
