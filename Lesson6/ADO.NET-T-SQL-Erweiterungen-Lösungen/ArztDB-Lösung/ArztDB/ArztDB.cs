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
        /// fetch all credit cards from database
        /// </summary>
        /// <returns>List of credit cards</returns>
        /// 

        //command.Parameters.Add(new SqlParameter("@RegionID",SqlDbType.Int,0,"RegionID"));
        // command.Parameters.Add(new SqlParameter("@RegionDescription",SqlDbType.NChar,50,"RegionDescription"));
        // command.Parameters[0].Value=4;
        // command.Parameters[1].Value="SouthEast";
        public static int Scores(int z1, int z2, int z3, int z4, int z5)
        {
            int result = 0;
            SqlConnection conn = null;

            try
            {
                // create a SqlConnection
                conn = new SqlConnection(ArztDB._connectionString);

                SqlCommand cmd = new SqlCommand("scores", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add("@score1", System.Data.SqlDbType.Int).Value = z1;
                cmd.Parameters.Add("@score2", System.Data.SqlDbType.Int).Value = z2;
                cmd.Parameters.Add("@score3", System.Data.SqlDbType.Int).Value = z3;
                cmd.Parameters.Add("@score4", System.Data.SqlDbType.Int).Value = z4;
                cmd.Parameters.Add("@score5", System.Data.SqlDbType.Int).Value = z5;
                cmd.Parameters.Add("@myAvg", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

                // open db SqlConnection
                conn.Open();
                cmd.ExecuteNonQuery();
                result = Convert.ToInt32(cmd.Parameters["@myAvg"].Value);
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
                // create a SqlConnection
                conn = new SqlConnection(ArztDB._connectionString);

                SqlCommand cmd = new SqlCommand("GetNumKonsultation", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add("@Name", System.Data.SqlDbType.NVarChar).Value = diagnose;

                // open db SqlConnection
                conn.Open();
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
            SqlConnection conn = null;
            DataSet ds = new DataSet();

            try
            {
                // create a SqlConnection
                conn = new SqlConnection(ArztDB._connectionString);

                SqlCommand cmd = new SqlCommand("ArztListe", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                conn.Open();

                ad.Fill(ds);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
                return ds;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }

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
            SqlConnection conn = null;

            try
            {
                // create a SqlConnection
                conn = new SqlConnection(ArztDB._connectionString);

                SqlCommand cmd = new SqlCommand("InsertOrt", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add("@PLZ", System.Data.SqlDbType.Int).Value = plz;
                cmd.Parameters.Add("@Ort", System.Data.SqlDbType.NVarChar).Value = ort;

                // open db SqlConnection
                conn.Open();
                if (cmd.ExecuteNonQuery() == 1)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
                return false;
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

        public static DataSet PlzListe()
        {
            SqlConnection conn = null;
            DataSet ds = new DataSet();

            try
            {
                // create a SqlConnection
                conn = new SqlConnection(ArztDB._connectionString);

                SqlCommand cmd = new SqlCommand("PLZListe", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                conn.Open();

                ad.Fill(ds);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
                return ds;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }

            return ds;
        }

        #endregion
    }
}
