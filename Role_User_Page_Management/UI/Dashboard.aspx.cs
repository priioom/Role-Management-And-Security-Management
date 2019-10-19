using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Role_User_Page_ManagementDataLoader;
using Role_User_Page_ManagementDataConnetion;
using Role_User_Page_ManagementValidator;
using Role_User_Page_ManagementEntity;
using Role_User_Page_ManagementCustomDataLoader;

namespace Role_User_Page_Management.UI
{
    public partial class Dashboard : System.Web.UI.Page
    {
        DataConnector DC = new DataConnector();
        Validator VDT = new Validator();
        protected void Page_Load(object sender, EventArgs e)
        {
            //VDT.UserAccessibility(Session["Role"].ToString(), "../../UI/Dashboard.aspx");
            try
            {
                if (Session["User"] != null)
                {

                }
                else
                {
                    Response.Redirect("~/userLogin.aspx");
                }
            }
            catch
            {

            }
        }
    }
}