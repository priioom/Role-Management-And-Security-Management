using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using Role_User_Page_Management;
using Role_User_Page_ManagementCustomDataLoader;
using Role_User_Page_ManagementDataConnetion;
using Role_User_Page_ManagementDataLoader;
using Role_User_Page_ManagementEntity;
using Role_User_Page_ManagementValidator;
using System.Data;

namespace Role_User_Page_Management.UI.Master
{
    public partial class Home : System.Web.UI.MasterPage
    {
        DataConnector DC = new DataConnector();
        Validator VDT = new Validator();
        UserRole URole = new UserRole();
        protected void Page_Load(object sender, EventArgs e)
        {
            //anchor1.ServerClick += new EventHandler(anchor1_Click);
            try
            {
                if (Session["User"] != null)
                {
                    Uname.InnerText = Session["User"].ToString();
                    SpnUSName.InnerText = Session["User"].ToString();
                    var SB = new StringBuilder();
                    string S = CreateMenuItem(SB);
                    menu.InnerHtml = S;
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


        /////////////////////////////////////////////////CREATE MENU ITEM//////////////////////////////////////////////////////////
        protected string CreateMenuItem(StringBuilder sbDynaMnu)
        {
            URole.Role = Session["Role"].ToString();
            CreatingMenuItem Cm = new CreatingMenuItem();
            try
            {
                DataTable dtMDL = new DataTable();
                Cm.qryMenu = "SELECT DISTINCT M.ModuleName, M.URL, M.ModuleID,M.Priority,M.ModuleIcon FROM dbo.ModuleInfo M " +
                "INNER JOIN dbo.PageInfo P ON M.ModuleID = P.ModuleID INNER JOIN dbo.UserRoleDetail R " +
                "ON P.PageID = R.PageID WHERE (R.RoleID = '" + URole.Role + "') AND (R.IsAccess=1) ORDER BY M.Priority ASC";

                dtMDL = DC.GetDataTable(Cm.qryMenu);
                if (dtMDL != null)
                {

                    for (int i = 0; i < dtMDL.Rows.Count; i++)
                    {
                        /////////////////////MENU///////////////////
                        if (VDT.IsDuplicate("select PageId from ModuleInfo m join [PageInfo] p on m.ModuleId = p.ModuleId where  m.ModuleID='" + dtMDL.Rows[i][2].ToString() + "' AND P.IsActive = 1") == false)
                        {
                            dtMDL = DC.GetDataTable(Cm.qryMenu);
                            Cm.li = string.Format(@"<li class=""{0}"">", "");
                            sbDynaMnu.Append(Cm.li);
                            Cm.a = string.Format(@"<a href=""{0}"">", dtMDL.Rows[i][1].ToString());
                            sbDynaMnu.Append(Cm.a);

                            Cm.i = string.Format(@"<i class=""{0}""> </i>", dtMDL.Rows[i][4].ToString());
                            sbDynaMnu.Append(Cm.i);
                            Cm.MenuName = string.Format(@" {0} ", dtMDL.Rows[i][0].ToString());
                            sbDynaMnu.Append(Cm.MenuName);
                            sbDynaMnu.Append("</a>");
                            sbDynaMnu.Append("</li>");
                        }
                        else
                        {
                            Cm.qrySubMenu = "SELECT P.PageName,P.URL FROM UserRoleDetail R INNER JOIN PageInfo P ON R.PageID=P.PageID WHERE" +
                                " R.RoleID= '" + URole.Role + "' AND P.ModuleID= '" + dtMDL.Rows[i][2].ToString() + "' AND [IsAccess]='True' AND P.IsActive = 1";
                            DataTable dtPAG = new DataTable();

                            dtPAG = DC.GetDataTable(Cm.qrySubMenu);


                            ////////////////////SUB MENU//////////////////////////////
                            if (dtPAG != null)
                            {
                                Cm.li = string.Format(@"<li class=""{0}"">", "");
                                sbDynaMnu.Append(Cm.li);
                                sbDynaMnu.Append("<a>");

                                Cm.i = string.Format(@"<i class=""{0}""> </i>", dtMDL.Rows[i][4].ToString());
                                sbDynaMnu.Append(Cm.i);
                                Cm.MenuName = string.Format(@" {0} ", dtMDL.Rows[i][0].ToString());
                                sbDynaMnu.Append(Cm.MenuName);
                                Cm.i = string.Format(@"<span class=""{0}""> </span>", "fa fa-chevron-down");
                                sbDynaMnu.Append(Cm.i);
                                sbDynaMnu.Append("</a>");
                                Cm.ul = string.Format(@"<ul class=""{0}"">", "nav child_menu");
                                sbDynaMnu.Append(Cm.ul);
                                for (int j = 0; j < dtPAG.Rows.Count; j++)
                                {
                                    Cm.li = string.Format(@"<li class=""{0}"">", "");
                                    sbDynaMnu.Append(Cm.li);
                                    Cm.a = string.Format(@"<a href=""{0}"">", dtPAG.Rows[j][1].ToString());
                                    sbDynaMnu.Append(Cm.a);
                                    Cm.MenuName = string.Format(@" {0} ", dtPAG.Rows[j][0].ToString());
                                    sbDynaMnu.Append(Cm.MenuName);
                                    sbDynaMnu.Append("</a>");
                                    sbDynaMnu.Append("</li>");
                                }
                                sbDynaMnu.Append("</ul>");
                                sbDynaMnu.Append("</li>");
                            }
                        }
                    }
                }

            }
            catch
            {
                //VDT.ShowMessage(lblUserName, Ex.Message, "ERR");
            }
            return sbDynaMnu.ToString();
        }
        protected void anchor1_Click(object sender, EventArgs e)
        {
            Session["User"] = null;
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/userLogin.aspx");
        }
    }
}