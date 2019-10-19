using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Role_User_Page_ManagementCustomDataLoader;
using Role_User_Page_Management;
using Role_User_Page_ManagementDataConnetion;
using Role_User_Page_ManagementDataLoader;
using Role_User_Page_ManagementEntity;
using Role_User_Page_ManagementValidator;
using System.Web.Security;

namespace Role_User_Page_Management
{
    public partial class userLogin : System.Web.UI.Page
    {
        DataConnector DC = new DataConnector();
        Validator VDT = new Validator();
        userLoginEntity UL = new userLoginEntity();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                Response.Redirect("~/UI/403.aspx");
            }
        }

        protected void LoginOnclick(object sender, EventArgs e)
        {
#pragma warning disable 0618// Type or member is obsolete
            string Hashedpass = FormsAuthentication.HashPasswordForStoringInConfigFile(USPass.Value, "SHA1");
#pragma warning disable 0618// Type or member is obsolete
            UL.UserName = USName.Value;
            UL.Password = Hashedpass;
            if (VDT.IsDuplicate("EXEC UserLogin '" + UL.UserName + "', '" + UL.Password + "'") == true)
            {
                Session["User"] = UL.UserName;
                Session["Role"] = DC.getObjectData("Select RoleId from [UserMaster] where [UserName] ='" + UL.UserName + "' AND [Password] = '" + UL.Password + "' ", "ConnDB230");
                Session["UserId"] = DC.getObjectData("Select [UserId] from [UserMaster] where [UserName] ='" + UL.UserName + "' AND [Password] = '" + UL.Password + "' ", "ConnDB230");
                Response.Redirect("/UI/Dashboard.aspx");
                USName.Value = "";
                USPass.Value = "";
            }
            else
            {
                VDT.ShowMessage(logFailed, "You have Entered Wrong Username Or Password", "ERR");
                USName.Value = "";
                USPass.Value = "";
            }
        }
    }
}