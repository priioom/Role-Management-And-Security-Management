using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Role_User_Page_Management.UI
{
    public partial class _404 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("~/userLogin.aspx");
            }

        }

        protected void btnBackOnClick(object sender, EventArgs e)
        {
            Response.Redirect("~/UI/Dashboard.aspx");
        }
    }
}