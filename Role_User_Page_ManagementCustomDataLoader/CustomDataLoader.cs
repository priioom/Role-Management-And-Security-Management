using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Role_User_Page_ManagementDataConnetion;
using System.Web;

namespace Role_User_Page_ManagementCustomDataLoader
{
    public class CustomDataLoader
    {
        DataConnector DC = new DataConnector();
        //================================================================ This Function used for Geting Object Id ===========================================
        public string FuncGetobjId(string qryuser)
        {
            string Result = DC.GetObjectDataId(qryuser, "ConnDB230");
            return Result;
        }


        //================================================================This Function used for Executing Query =======================================

        public string FuncExQry(string qryuser)
        {
            string Result = DC.ExecuteQuery(qryuser, "ConnDB230");
            return Result;
        }

        //protected void LoadToGv(GridView GV, string qry)
        //{
        //    DataTable dt = DC.GetDataTable(qry);
        //    if (dt != null)
        //    {
        //        GV.DataSource = dt;
        //        GV.DataBind();
        //    }
        //}
    }
}
