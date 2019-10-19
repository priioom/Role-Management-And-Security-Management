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
using System.Text;
using System.Data;
using System.Web.Services;
using System.Drawing;


namespace Role_User_Page_Management.UI.Security
{
    public partial class ConfigureRole : System.Web.UI.Page     
    {
        DataConnector DC = new DataConnector();
        Validator VDT = new Validator();
        RoleConfigurationEntity RCE = new RoleConfigurationEntity();
        DataLoader DL = new DataLoader();
        DataTable dt = new DataTable();
        //public class Foo {


        //}
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                VDT.UserAccessibility(Session["Role"].ToString(), "../../UI/Security/ConfigureRole.aspx");
                if (Session["User"] != null && VDT.IsAccess == true)
                {
                    if (!IsPostBack)
                    {
                       
                        //ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "text", " $('#myTabs a:first').tab('show');", true);
                        LoadDdlUserRoleSelection();
                   
                    }
                }
                else
                {
                    Response.Redirect("~/UI/403.aspx");
                }
            }
            catch
            {
                Response.Redirect("~/userLogin.aspx");
            }
        }

        protected void ddlURSOnSelectedEventChange(object sender, EventArgs e)
        {
            if (ddlUserRoleSelection.SelectedIndex != 0)
            {
                string txtDesc = DC.getObjectData("SELECT Description FROM UserRoleMaster where RoleId='" + ddlUserRoleSelection.SelectedValue + "' ", "ConnDB230").ToString();
                lblDescription.Text = txtDesc;
                Session["SelectedRoleID"] = ddlUserRoleSelection.SelectedValue;
                var Access = new StringBuilder();
                string S = CreateListItem(Access);
                AccessFolder.InnerHtml = S;
                //var nAccess = new StringBuilder();
                //string Content = CreateContent(nAccess);
                //content.InnerHtml = Content;
                BindGridViewWithData(Session["home"].ToString());

                
            }
            else
            {
                AccessFolder.InnerHtml = "";
            }
        }

        protected void LoadDdlUserRoleSelection()
        {
            string QRY = "SELECT RoleId, RoleName FROM UserRoleMaster Where IsActive=1 ORDER BY RoleName";
            DL.LoadDll(ddlUserRoleSelection, DC.GetDataTable(QRY), "RoleId", "RoleName", "Select A Role");
        }

        protected string CreateListItem(StringBuilder sbDynaMnu)
        {
            
            CreatingMenuItem Cm = new CreatingMenuItem();
            try
            {
                string menu = "";
                DataTable dtL = new DataTable();
                RCE.qryMenu = "SELECT ModuleId,ModuleName FROM ModuleInfo  ORDER BY Priority ASC";

                dtL = DC.GetDataTable(RCE.qryMenu);
                if (dtL != null)
                {

                    //for (int i = 0; i < 1 ; i++)
                    //{
                    //    /////////////////////MENU///////////////////
                    //    //if (VDT.IsDuplicate("select PageId from ModuleInfo m join [PageInfo] p on m.ModuleId = p.ModuleId where  m.ModuleID='" + dtMDL.Rows[i][2].ToString() + "' AND P.IsActive = 1") == false)
                    //    //{
                    //    dtL = DC.GetDataTable(RCE.qryMenu);
                    //        RCE.li = string.Format(@"<li class=""{0}"">", "active");
                    //        sbDynaMnu.Append(RCE.li);
                    //        RCE.a = string.Format(@"<a href=""#{0}"" data-toggle=""{0}""", dtL.Rows[i][1].ToString(), "tab");
                    //        sbDynaMnu.Append(RCE.a);
                    //        sbDynaMnu.Append("/>");
                    //        RCE.MenuName = string.Format(@" {0} ", dtL.Rows[i][1].ToString());
                    //        sbDynaMnu.Append(RCE.MenuName);
                    //        sbDynaMnu.Append("</a>");
                    //        sbDynaMnu.Append("</li>");
                    //    //}
                    //        menu = RCE.MenuName;
                    //}
                    for (int i = 0; i < dtL.Rows.Count; i++)
                    {
                        /////////////////////MENU///////////////////
                        //if (VDT.IsDuplicate("select PageId from ModuleInfo m join [PageInfo] p on m.ModuleId = p.ModuleId where  m.ModuleID='" + dtMDL.Rows[i][2].ToString() + "' AND P.IsActive = 1") == false)
                        //{
                        dtL = DC.GetDataTable(RCE.qryMenu);
                        RCE.li = string.Format(@"<li class=""{0}"">", "");
                        sbDynaMnu.Append(RCE.li);
                        RCE.a = string.Format(@"<a href=""#{0}"" data-toggle=""{0}""", dtL.Rows[i][1].ToString(), "tab");
                        sbDynaMnu.Append(RCE.a);
                  
                        sbDynaMnu.Append("/>");
                        RCE.MenuName = string.Format(@" {0} ", dtL.Rows[i][1].ToString());
                        sbDynaMnu.Append(RCE.MenuName);
                        sbDynaMnu.Append("</a>");
                        sbDynaMnu.Append("</li>");
                        //}
                        menu = dtL.Rows[0][1].ToString();
                    }
                    Session["home"] = dtL.Rows[0][1].ToString();
                    //for (int i = 0; i < dtMDL.Rows.Count; i++)
                    //{
                  
                    //}
                }
               
            }
            catch
            {
                //VDT.ShowMessage(lblUserName, Ex.Message, "ERR");
            }
            return sbDynaMnu.ToString();
        }
        //[WebMethod]
        //[System.Web.Script.Services.ScriptMethod(UseHttpGet = true)]
        //public static string CreateContent(string s)
        //{
        //   // ConfigureRole cr = new ConfigureRole();
        //   ////cr.DivtblContnt.Visible = true;
        //   // var sbDynaMnu = new StringBuilder();
        //   // //Button Button1 = new Button();
            
        //   // string a = string.Format(@"<div class=""{0}"" ", "tab-pane active");
        //   // sbDynaMnu.Append(a);
        //   // string b = string.Format(@"id=""{0}""> ", s);
        //   // sbDynaMnu.Append(b);
        //   // string c = string.Format(@"<p class=""{0}""> ", "lead");

        //   // DataConnector DC = new DataConnector();
        //   // Validator VDT = new Validator();
        //   // RoleConfigurationEntity RCE = new RoleConfigurationEntity();
        //   // DataTable dtMDL = new DataTable();
         
        //   // RCE.qryMenu = "EXEC Sp_SelectUserAccessability '" + s + "', '" + cr.Session["SelectedRoleID"] + "' ";

        //   // dtMDL = DC.GetDataTable(RCE.qryMenu);
        //   // if (dtMDL != null)
        //   // {

        //   //     string Datatbl = string.Format(@"<table id=""{0}"" ", "datatable");
        //   //     sbDynaMnu.Append(Datatbl);

        //   //     Datatbl = string.Format(@"class=""{0}""> ", "table table-striped table-bordered table-hover jambo_table bulk_action");
        //   //     sbDynaMnu.Append(Datatbl);
        //   //     Datatbl = string.Format(@"<thead> <tr class=""{0}""> ", "tblhead headerStyle");
        //   //     sbDynaMnu.Append(Datatbl);
        //   //     Datatbl = string.Format(@"<th style=""{0}"">Page Name</th> ", "text-align:center;");
        //   //     sbDynaMnu.Append(Datatbl);
        //   //     Datatbl = string.Format(@"<th style=""{0}"">IsAccess</th> ", "text-align:center;");
        //   //     sbDynaMnu.Append(Datatbl);
        //   //     Datatbl = string.Format(@"<th style=""{0}"">IsWrite</th> ", "text-align:center;");
        //   //     sbDynaMnu.Append(Datatbl);
        //   //     Datatbl = string.Format(@"<th style=""{0}"">IsEdit</th> ", "text-align:center;");
        //   //     sbDynaMnu.Append(Datatbl);
        //   //     Datatbl = string.Format(@"<th style=""{0}"">IsRead</th> ", "text-align:center;");
        //   //     sbDynaMnu.Append(Datatbl);
        //   //     Datatbl = string.Format(@"<th style=""{0}"">Access Area</th> ", "text-align:center;");
        //   //     sbDynaMnu.Append(Datatbl);
        //   //     sbDynaMnu.Append(" <th></th> </tr> </thead> ");
        //   //     sbDynaMnu.Append("<tbody> ");
        //   //     for (int i = 0; i < dtMDL.Rows.Count; i++)
        //   //     {
        //   //         Datatbl = string.Format(@"<tr class=""{0}""> ", "even pointer");
        //   //         sbDynaMnu.Append(Datatbl);

        //   //         Datatbl = string.Format(@"<td>{0}</td> ", dtMDL.Rows[i][4].ToString());
        //   //         sbDynaMnu.Append(Datatbl);
                
        //   //         if (dtMDL.Rows[i][5].ToString() == "True")
        //   //         {
        //   //             Datatbl = string.Format(@"<td ><input type=""{0}"" checked / ></td> ", "checkbox");
        //   //             sbDynaMnu.Append(Datatbl);
        //   //         }
        //   //         else
        //   //         {
        //   //             Datatbl = string.Format(@"<td ><input type=""{0}"" / ></td> ", "checkbox");
        //   //             sbDynaMnu.Append(Datatbl);
        //   //         }
        //   //         if (dtMDL.Rows[i][6].ToString() == "True")
        //   //         {
        //   //             Datatbl = string.Format(@"<td ><input type=""{0}"" checked / ></td> ", "checkbox");
        //   //             sbDynaMnu.Append(Datatbl);
        //   //         }
        //   //         else
        //   //         {
        //   //             Datatbl = string.Format(@"<td ><input type=""{0}"" / ></td> ", "checkbox");
        //   //             sbDynaMnu.Append(Datatbl);
        //   //         }
        //   //         if (dtMDL.Rows[i][7].ToString() == "True")
        //   //         {
        //   //             Datatbl = string.Format(@"<td ><input type=""{0}"" checked / ></td> ", "checkbox");
        //   //             sbDynaMnu.Append(Datatbl);
        //   //         }
        //   //         else
        //   //         {
        //   //             Datatbl = string.Format(@"<td ><input type=""{0}"" / ></td> ", "checkbox");
        //   //             sbDynaMnu.Append(Datatbl);
        //   //         }
        //   //         if (dtMDL.Rows[i][8].ToString() == "True")
        //   //         {
        //   //             Datatbl = string.Format(@"<td ><input type=""{0}"" checked / ></td> ", "checkbox");
        //   //             sbDynaMnu.Append(Datatbl);
        //   //         }
        //   //         else
        //   //         {
        //   //             Datatbl = string.Format(@"<td ><input type=""{0}"" / ></td> ", "checkbox");
        //   //             sbDynaMnu.Append(Datatbl);
        //   //         }
        //   //         Datatbl = string.Format(@"<td>{0}</td> ", dtMDL.Rows[i][9].ToString());
        //   //         sbDynaMnu.Append(Datatbl);
        //   //         sbDynaMnu.Append("<td >");
        //   //         DataTable dt = new DataTable();
        //   //         dt = DC.GetDataTable("Select AccessAreaId, AceessArea from AccessArea");

        //   //         Datatbl = string.Format(@"<select id=""{0}"">", "ddlAccessArea");
        //   //         sbDynaMnu.Append(Datatbl);
        //   //         Datatbl = string.Format(@"<Option value = ""{0}"" > ", "0");
        //   //         sbDynaMnu.Append(Datatbl);
        //   //         Datatbl = string.Format(@" {0} </Option> ", "Select An Access Area");
        //   //         sbDynaMnu.Append(Datatbl);
        //   //         if (dt != null)
        //   //         {
        //   //             for (int j = 0; j < dt.Rows.Count; j++)
        //   //             {
        //   //                 Datatbl = string.Format(@"<Option value = ""{0}"" > ", dt.Rows[j][0].ToString());
        //   //                 sbDynaMnu.Append(Datatbl);
        //   //                 Datatbl = string.Format(@" {0} </Option> ", dt.Rows[j][1].ToString());
        //   //                 sbDynaMnu.Append(Datatbl);
        //   //             }
        //   //         }
        //   //         sbDynaMnu.Append("</select ></td> ");
                   
        //   //         sbDynaMnu.Append("</tr>");
        //   //     }
        //   //     sbDynaMnu.Append("</tbody> </table>");
        //   //     sbDynaMnu.Append("</p>");
        //   //     sbDynaMnu.Append("</div>");
        //   //     Datatbl = string.Format(@" <div class=""{0}""> </div>", "col-md-10  col-sm-10 col-xs-12");
        //   //     sbDynaMnu.Append(Datatbl);
        //   //     Datatbl = string.Format(@" <div class=""{0}"">", "col-md-2  col-sm-2 col-xs-12");
        //   //     sbDynaMnu.Append(Datatbl);
        //   //     Datatbl = string.Format(@"<button type=""{0}""", "button");
        //   //     sbDynaMnu.Append(Datatbl);
        //   //     Datatbl = string.Format(@"class=""{0}"" >Save</button>", "btn btn-success form-control col-md-12 col-xs-12");
        //   //     sbDynaMnu.Append(Datatbl);
        //   //     //Datatbl = string.Format(@"  onserverclick =""{0}"" >Save</button>", "onclicked()");
        //   //     //sbDynaMnu.Append(Datatbl);
                
        //   //     //sbDynaMnu.Append("<script type='text/javascript'>function onclicked(){alert('You clicked on image');}</script>");
        //   //     sbDynaMnu.Append("</div>");
        //   // }



            
        //   // return sbDynaMnu.ToString(); 
           

            
        //}
        protected void gvAccessinfoRowdataBOund(object sender, GridViewRowEventArgs e)
        {
            try
            {
         
                DropDownList ddlAccessArea = e.Row.FindControl("ddlAccessArea") as DropDownList;
                ddlAccessArea.CssClass = "form-control col-md-12 col-xs-12";
                string QRY = "Select AccessAreaId, AceessArea from AccessArea";
                DL.LoadDll(ddlAccessArea, DC.GetDataTable(QRY), "AccessAreaId", "AceessArea", "Change Access Area");
                if (!IsPostBack)
                {
                    if (e.Row.RowType == DataControlRowType.DataRow)
                    {
                      
                        ddlAccessArea.AutoPostBack = true;
                        //if (ddlAccessArea.SelectedIndex != -1)
                        //{

                        //}
                      
                        ddlAccessArea.SelectedIndexChanged += new EventHandler(ddlAccessAreaOnSelectedindexChange);
                    }
                }
                    if (e.Row.RowType == DataControlRowType.DataRow)
                    {

                        string IsAccess = DC.GetObjectDataId("Select IsAccess from UserRoleDetail where UserRoleDetailId='" + e.Row.Cells[0].Text + "'", "ConnDB230");
                        string IsWrite = DC.GetObjectDataId("Select IsWrite from UserRoleDetail where UserRoleDetailId='" + e.Row.Cells[0].Text + "'", "ConnDB230");
                        string IsEdit = DC.GetObjectDataId("Select IsEdit from UserRoleDetail where UserRoleDetailId='" + e.Row.Cells[0].Text + "'", "ConnDB230");
                        string IsRead = DC.GetObjectDataId("Select IsRead from UserRoleDetail where UserRoleDetailId='" + e.Row.Cells[0].Text + "'", "ConnDB230");
                     
                        if (IsAccess == "True")
                        {
                            LinkButton img = (LinkButton)e.Row.FindControl("img");
                            img.Text = "<img src='../../images/accept.png'/>";
                            e.Row.Cells[5].Controls.Add(img);
                        }
                        else if (IsAccess == "False")
                        {
                            LinkButton img1 = (LinkButton)e.Row.FindControl("img");
                            img1.Text = "<img src='../../images/cross.png'/>"; ;
                            e.Row.Cells[5].Controls.Add(img1);

                        }
                        if (IsWrite == "True")
                        {
                            LinkButton img2 = (LinkButton)e.Row.FindControl("img2");
                            img2.Text = "<img src='../../images/accept.png'/>";
                            e.Row.Cells[6].Controls.Add(img2);
                        }
                        else if (IsWrite == "False")
                        {
                            LinkButton img3 = (LinkButton)e.Row.FindControl("img2");
                            img3.Text = "<img src='../../images/cross.png'/>"; ;
                            e.Row.Cells[6].Controls.Add(img3);
                        }
                        if (IsEdit == "True")
                        {
                            LinkButton img4 = (LinkButton)e.Row.FindControl("img4");
                            img4.Text = "<img src='../../images/accept.png'/>";
                            e.Row.Cells[7].Controls.Add(img4);
                        }
                        else if (IsEdit == "False")
                        {
                            LinkButton img5 = (LinkButton)e.Row.FindControl("img4");
                            img5.Text = "<img src='../../images/cross.png'/>"; ;
                            e.Row.Cells[7].Controls.Add(img5);

                        }
                        if (IsRead == "True")
                        {
                            LinkButton img6 = (LinkButton)e.Row.FindControl("img6");
                            img6.Text = "<img src='../../images/accept.png'/>";
                            e.Row.Cells[8].Controls.Add(img6);
                        }
                        else if (IsRead == "False")
                        {

                            LinkButton img7 = (LinkButton)e.Row.FindControl("img6");
                            img7.Text = "<img src='../../images/cross.png'/>"; ;
                            e.Row.Cells[8].Controls.Add(img7);
                        }
                    }
                
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + Page + " gvAccessinfoRowdataBOund " + ex.Message, "~/Log.txt");
            }
        }
        protected void gvAccessSelectedIndex(object sender, EventArgs e)
        {
             string ID = gvPInfo.DataKeys[gvPInfo.EditIndex].Values["UserRoleDetailId"].ToString();
             hfTab.Value = ID;
        }
        protected void ddlAccessAreaOnSelectedindexChange(object sender, EventArgs e)
        {
            //if(ddlAccessArea)
            if (((DropDownList)sender).SelectedValue != "-1")
            {
                GridViewRow row = (GridViewRow)(((DropDownList)sender).NamingContainer);
                int rowIndex = row.RowIndex;
                int strID = Convert.ToInt32(gvPInfo.DataKeys[rowIndex].Values["UserRoleDetailId"].ToString());
                string Access = DC.ExecuteQuery("Update UserRoleDetail Set AccessArea='" + ((DropDownList)sender).SelectedValue + "'  where UserRoleDetailId='" + strID + "'", "ConnDB230");
                if (Access == "1")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('AccessArea Updated SucessFully');", true);
                    BindGridViewWithData(Session["module"].ToString());
                }
            }
            //this.lblCity.Text = ((DropDownList)sender).SelectedValue;
     
            //if (!IsPostBack)
            //{
               
            //}
            //
            //else
            //BindGridViewWithData(Session["module"].ToString());
        }


        protected void gvAccessOnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            StringBuilder Sb = new StringBuilder();
            GridViewRow gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            int RowIndex = gvr.RowIndex;
            int strID = Convert.ToInt32(gvPInfo.DataKeys[RowIndex].Values["UserRoleDetailId"].ToString());
          

                string IsAccess = DC.GetObjectDataId("Select IsAccess from UserRoleDetail where UserRoleDetailId='" + strID + "'", "ConnDB230");
                string IsWrite = DC.GetObjectDataId("Select IsWrite from UserRoleDetail where UserRoleDetailId='" + strID + "'", "ConnDB230");
                string IsEdit = DC.GetObjectDataId("Select IsEdit from UserRoleDetail where UserRoleDetailId='" + strID + "'", "ConnDB230");
                string IsRead = DC.GetObjectDataId("Select IsRead from UserRoleDetail where UserRoleDetailId='" + strID + "'", "ConnDB230");
                string gridmodule = DC.GetObjectDataId(" select m.ModuleName from ModuleInfo m join PageInfo p on m.ModuleId=p.ModuleId Join UserRoleDetail ur on p.PageID=ur.PageID where UserRoleDetailId='" + strID + "'", "ConnDB230");
      
          

            
            if (e.CommandName == "IsAccessClick")
            {
                if (VDT.IsWrite == true)
                {
                    if (IsAccess == "True")
                    {
                        string Access = DC.ExecuteQuery("Update UserRoleDetail Set IsAccess='False'  where UserRoleDetailId='" + strID + "'", "ConnDB230");
                        if (Access == "1")
                        {
                            LinkButton img = (LinkButton)e.CommandSource; ;
                            img.Text = "<img src='../../images/cross.png'/>"; ;


                        }
                        else
                        {
          
                        }
                    }
                    else
                    {
                        string Access = DC.ExecuteQuery("Update UserRoleDetail Set IsAccess='True'  where UserRoleDetailId='" + strID + "'", "ConnDB230");
                        if (Access == "1")
                        {
                            LinkButton img = (LinkButton)e.CommandSource; ;
                            img.Text = "<img src='../../images/accept.png'/>";
        
                        }
                        else
                        {
                        
                        }
                       
                    }

                }

            }
            if (e.CommandName == "IsWriteClick")
            {
                if (VDT.IsWrite == true)
                {
           


                    if (IsWrite == "True")
                    {
                        string Write = DC.ExecuteQuery("Update UserRoleDetail Set IsWrite='False'  where UserRoleDetailId='" + strID + "'", "ConnDB230");
                        if (Write == "1")
                        {
                            LinkButton img3 = (LinkButton)e.CommandSource;
                            img3.Text = "<img src='../../images/cross.png'/>"; ;
                   
                        }
                        else
                        {
                     
                        }
                     
                    }
                    else
                    {
                        string Write = DC.ExecuteQuery("Update UserRoleDetail Set IsWrite='True'  where UserRoleDetailId='" + strID + "'", "ConnDB230");
                        if (Write == "1")
                        {
                            LinkButton img2 = (LinkButton)e.CommandSource;
                            img2.Text = "<img src='../../images/accept.png'/>";

                   
                        }
                        else
                        {
               
                        }
                        
                    }

                }
            }
            if (e.CommandName == "IsEditClick")
            {
                if (VDT.IsWrite == true)
                {
                    
                    if (IsEdit == "True")
                    {
                        string Edit = DC.ExecuteQuery("Update UserRoleDetail Set IsEdit='False'  where UserRoleDetailId='" + strID + "'", "ConnDB230");
                        if (Edit == "1")
                          {
                              LinkButton img5 = (LinkButton)e.CommandSource;
                              img5.Text = "<img src='../../images/cross.png'/>"; ;
                     
                          }
                          else
                          {
                      
                          }
                      
                    }
                    else
                    {
                        string Edit = DC.ExecuteQuery("Update UserRoleDetail Set IsEdit='True'  where UserRoleDetailId='" + strID + "'", "ConnDB230");
                        if (Edit == "1")
                        {
                            LinkButton img4 = (LinkButton)e.CommandSource;
                            img4.Text = "<img src='../../images/accept.png'/>";
    
                        }
                        else
                        {
                        
                        }
                        
                    }

                }

            }
            if (e.CommandName == "IsReadClick")
            {
                if (VDT.IsWrite == true)
                {

                    if (IsRead== "True")
                    {
                        string Read = DC.ExecuteQuery("Update UserRoleDetail Set IsRead ='False'  where UserRoleDetailId='" + strID + "'", "ConnDB230");
                        if (Read == "1")
                        {
                            LinkButton img7 = (LinkButton)e.CommandSource;
                            img7.Text = "<img src='../../images/cross.png'/>"; ;
               
                        }
                        else
                        {
                  
                        }
                        
                    }
                    else
                    {
                        string Read = DC.ExecuteQuery("Update UserRoleDetail Set IsRead ='True'  where UserRoleDetailId='" + strID + "'", "ConnDB230");
                        if (Read == "1")
                        {
                            LinkButton img6 = (LinkButton)e.CommandSource;
                            img6.Text = "<img src='../../images/accept.png'/>";
                          
                    
                        }
                        else
                        {
                         
                        }
                     
                    }
              
                }

            }

            BindGridViewWithData(gridmodule);
        }





        protected void Page_PreRender(object sender, EventArgs e)
        {
            ClientScript.GetPostBackEventReference(this, string.Empty);
            //myTabs.Attributes.Add("onclick", "hidePanel(this);");
            if (this.IsPostBack)
            {
                string eventTarget = (this.Request["__EVENTTARGET"] == null) ? string.Empty : this.Request["__EVENTTARGET"];
                string eventvalue = Request.Form["__EVENTARGUMENT"];
                //Session["eventvalue"] = eventvalue;
                if (eventTarget == "CheckHideShow")
                {
                    BindGridViewWithData(eventvalue);
                   

                }
                //else if
            }
        }


        
        public void BindGridViewWithData ( string s)
        {
            try
            {
                Session["module"] = s;
                string qry = "EXEC Sp_SelectUserAccessability '" + s + "', '" + Session["SelectedRoleID"] + "' ";
                DataTable dtPageInfo = DC.GetDataTable(qry);
                if (dtPageInfo != null)
                {
                    gvPInfo.DataSource = dtPageInfo;
                    gvPInfo.DataBind();
                }
                
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + Page + " BindGridViewWithData " + ex.Message, "~/Log.txt");
            }
        }

        
        }
}