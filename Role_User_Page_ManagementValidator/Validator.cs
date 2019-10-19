using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using System.Data;
using Role_User_Page_ManagementDataConnetion;
using System.Web;
using System.Drawing;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

namespace Role_User_Page_ManagementValidator
{
    public class Validator
    {
        DataConnector DC = new DataConnector();
        public bool IsRead = false, IsWrite = false, IsEdit = false, IsAccess = false;
        private string stringSanatizer(string value)
        {
            string sanatized = "";
            sanatized = HttpUtility.UrlEncode(value);
            return sanatized;
        }

        public bool CheckCredentials(string username, string password)
        {
            string result;

            if (username.Length > 0 && password.Length > 0)
            {
                if (System.Text.RegularExpressions.Regex.IsMatch(username,
                                                   "^[a-zA-Z'.]{1,40}$") && System.Text.RegularExpressions.Regex.IsMatch(password,
                                                   "(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$"))
                {
                    String query = "EXEC spLoginChecker '" + username.ToString() + "','" + password.ToString() + "'";
                    result = DC.getObjectDataStr(query, "ConnDB230");
                    if (result == "1")
                    { return true; }
                    else
                        return false;

                }
                else
                {

                    return false;
                }

            }
            else
                return false;

        }



        public bool CheckCredentials(string password)
        {
            //string result;

            if (password.Length > 0)
            {
                if (System.Text.RegularExpressions.Regex.IsMatch(password,
                                                   "(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$"))
                {

                    return true;


                }
                else
                {

                    return false;
                }

            }
            else
                return false;

        }

        public bool UserNameChecker(string username)
        {
            string result;

            if (username.Length > 0)
            {
                try
                {
                    String query = "EXEC UserNameChecker '" + username.ToString() + "'";
                    result = DC.getObjectDataStr(query, "ConnDB230");
                    if (result == "1")
                    { return true; }
                    else
                        return false;
                }
                catch (Exception ex)
                { throw ex; }
            }
            else
                return false;

        }

        public bool SOUserIDChecker(string username)
        {
            string result;

            if (username.Length > 0)
            {
                try
                {
                    String query = "SELECT UserLoginID from Sales_Officer WHERE UserLoginID = '" + username + "'";
                    result = DC.getObjectDataStr(query, "ConnDB230");
                    if (result != "")
                    { return true; }
                    else
                        return false;
                }
                catch (Exception ex)
                { throw ex; }
            }
            else
                return false;

        }
        public bool IsDuplicate(string Qry)
        {
            bool Result = true;
            DataTable dt = DC.GetDataTable(Qry);
            if (dt != null)
                Result = true;
            else
                Result = false;
            return Result;
        }
        ///////////////////////////////////////////////////ENCODING PASSWORD/////////////////////////////////////////////////////////
        public string EncodePasswordToBase64(string password)
        {
            byte[] bytes = Encoding.Unicode.GetBytes(password);
            byte[] inArray = HashAlgorithm.Create("SHA1").ComputeHash(bytes);
            return Convert.ToBase64String(inArray);
        }
        ///////////////////////////////////////USER ACCESSIBILITY///////////////////////////////////
        public void UserAccessibility(string RID, string URL)
        {
            DataTable dtACS = new DataTable();
            dtACS = DC.GetDataTable("EXEC Get_User_Accessibility '" + RID + "','" + URL + "'");
            if (dtACS != null)
            {
                IsWrite = (bool)dtACS.Rows[0][0];
                IsEdit = (bool)dtACS.Rows[0][1];
                IsRead = (bool)dtACS.Rows[0][2];
                IsAccess = (bool)dtACS.Rows[0][3];
            }
        }
        //////////////////////////////////////////////MESSAGE/////////////////////////////////////////
        public void ShowMessage(Label LBL, string MSG, string TPE)
        {
            LBL.BackColor = TPE == "ERR" ? Color.DarkRed : Color.DarkBlue;
            LBL.ForeColor = Color.White;
            LBL.Font.Bold = true;
            LBL.Font.Size = 12;
            LBL.Text = MSG;
        }


        public void WriteToLog(string TXT, string FN)
        {
            try
            {
                using (StreamWriter w = new StreamWriter(HttpContext.Current.Server.MapPath(FN), true, Encoding.ASCII))
                {
                    w.WriteLine(TXT);
                }
            }
            catch
            {
                //txtLog.Text = ex.Message;Exception ex
            }
        }
    }
}
