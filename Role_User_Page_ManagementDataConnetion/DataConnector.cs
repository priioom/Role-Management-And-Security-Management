using System;
using System.Collections.Generic;
using System.Linq;
using System.Collections;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace Role_User_Page_ManagementDataConnetion
{
    public class DataConnector
    {


        Hashtable hh = new Hashtable();
        Hashtable connTable = new Hashtable();
        SqlConnection myConnection = null;
        SqlCommand cmd = null;
        SqlDataAdapter adapter = null;
        DataSet ds = null;
        public DataConnector()
        {
            
            connTable.Add("ConnDB230", "Data Source=DESKTOP-441NA8M\\SQLEXPRESS;Initial Catalog=Role_N_User_N_Page_Management;User ID=sa;Password=123456;");


        }
        public string ExecuteQuery(string query, string dbName)
        {
            string rValue = string.Empty;

            myConnection = new SqlConnection(connTable[dbName].ToString());
            try
            {
                cmd = new SqlCommand(query, myConnection);
                cmd.CommandTimeout = 60;
                myConnection.Open();
                rValue = cmd.ExecuteNonQuery().ToString();
                if (rValue == "-1") { throw new Exception(); }
            }
            catch (Exception ex)
            { rValue = ex.Message.ToString(); }
            finally
            {
                myConnection.Close();
                cmd = null;
                myConnection = null;
                query = null;
                //rValue = "1";
            }
            return rValue;
        }
        public object getObjectData(string query, string dbName)
        {
            myConnection = new SqlConnection(connTable[dbName].ToString());

            try
            {
                cmd = new SqlCommand(query, myConnection);
                myConnection.Open();
                object retValue = cmd.ExecuteScalar();
                return retValue;
            }
            catch (Exception ex)
            {
                return (object)ex.Message.ToString();
            }
            finally
            {
                myConnection.Close();
                cmd = null;
                myConnection = null;
                query = null;
                dbName = null;
            }
        }

        //public int Log_in(SqlParameter[] ParamsLogin, string query, string dbName)
        //{
        //    myConnection = new SqlConnection(connTable[dbName].ToString());
        //    ds = new DataSet();
        //    DataTable dt = new DataTable();
        //    int result = 0;
        //    try
        //    {
        //        cmd = new SqlCommand(query, myConnection)
        //        {
        //            CommandType = CommandType.StoredProcedure
        //        };
        //        cmd.Parameters.AddRange(ParamsLogin);
        //        myConnection.Open();
        //         object retValue= cmd.ExecuteScalar();
        //         return Convert.ToInt32(retValue);
        //    }
        //    catch 
        //    {
        //        return result;
        //    }

        //    finally
        //    {
        //        myConnection.Close();
        //        cmd = null;
        //        myConnection = null;
        //        query = null;
        //        dbName = null;
        //    }


        //}
        public string GetObjectDataId(string query, string dbName)
        {
            myConnection = new SqlConnection(connTable[dbName].ToString());
            string result = "";
            try
            {
                cmd = new SqlCommand(query, myConnection);
                myConnection.Open();
                object firstColumn = cmd.ExecuteScalar();

                if (firstColumn != null)
                {
                    result = firstColumn.ToString();
                    return result;
                }

            }
            catch (Exception ex)
            {
                return (string)ex.Message.ToString();
            }
            finally
            {
                myConnection.Close();
                cmd = null;
                myConnection = null;
                query = null;
                dbName = null;
            }
            return result;
        }
        public DataSet GetDataSet(string query, string dbName)
        {
            myConnection = new SqlConnection(connTable[dbName].ToString());
            ds = new DataSet();
            try
            {
                cmd = new SqlCommand(query, myConnection);
                adapter = new SqlDataAdapter();
                //cmd.CommandTimeout = 60;
                adapter.SelectCommand = cmd;
                adapter.Fill(ds);
                if (ds.Tables[0].Rows.Count != 0)
                    return ds;
                else
                    return null;
            }
            catch (Exception)
            { return null; }
            finally
            {
                adapter = null;
                cmd = null;
                myConnection = null;
                query = null;
            }
        }
        public DataTable GetDataTable(string query)
        {
            string dbName = "ConnDB230";
            myConnection = new SqlConnection(connTable[dbName].ToString());
            ds = new DataSet();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand(query, myConnection);
                adapter = new SqlDataAdapter();
                //cmd.CommandTimeout = 60;
                adapter.SelectCommand = cmd;
                adapter.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    dt = ds.Tables[0];
                    return dt;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception)
            { return null; }
            finally
            {
                adapter = null;
                cmd = null;
                myConnection = null;
                query = null;
            }
        }
        public string getObjectDataStr(string query, string dbName)
        {
            myConnection = new SqlConnection(connTable[dbName].ToString());
            string result = "";
            try
            {
                cmd = new SqlCommand(query, myConnection);
                myConnection.Open();
                object firstColumn = cmd.ExecuteScalar();

                if (firstColumn != null)
                {
                    result = firstColumn.ToString();
                    return result;
                }

            }
            catch (Exception ex)
            {
                return (string)ex.Message.ToString();
            }
            finally
            {
                myConnection.Close();
                cmd = null;
                myConnection = null;
                query = null;
                dbName = null;
            }
            return result;
        }


        public string CreateTmpTable(string query, string dbName)
        {
            myConnection = new SqlConnection(connTable[dbName].ToString());
            string result = "";
            try
            {
                cmd = new SqlCommand(query, myConnection);
                myConnection.Open();
                object firstColumn = cmd.ExecuteScalar();

                if (firstColumn != null)
                {
                    result = firstColumn.ToString();
                    return result;
                }

            }
            catch (Exception ex)
            {
                return (string)ex.Message.ToString();
            }
            finally
            {

                cmd = null;
                myConnection = null;
                query = null;
                dbName = null;
            }
            return result;
        }

    }
}
