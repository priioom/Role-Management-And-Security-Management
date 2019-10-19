using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Role_User_Page_ManagementDataConnetion;
using Role_User_Page_ManagementDataLoader;
using Role_User_Page_ManagementEntity;
using System.Data;
using System.Data.SqlClient;


namespace Role_User_Page_ManagementBuissness
{

    public class userLoginbuisness
    {
        DataTable buisnessObject = new DataTable();
        DataConnector DT = new DataConnector();
        //public int LoginMethod(userLoginEntity loginobject)
        //{
        //    //LmData LoginData = new LmData();
        //    SqlParameter[] ParamsLogin = new SqlParameter[2];
        //    ParamsLogin[0] = new SqlParameter("@UN", SqlDbType.VarChar)
        //    {
        //        Value = loginobject.UserName
        //    };
        //    ParamsLogin[1] = new SqlParameter("@Pass", SqlDbType.VarChar)
        //    {
        //        Value = loginobject.Password
        //    };
        //    //int result = DT.Log_in(ParamsLogin, "UserLogin", "ConnDB230");
        //    //return result;
        //}
    }
}
