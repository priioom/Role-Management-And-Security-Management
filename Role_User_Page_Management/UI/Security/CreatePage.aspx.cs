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
using System.Data;
using System.Drawing;

namespace Role_User_Page_Management.UI.Security
{
    public partial class Create_Page : System.Web.UI.Page
    {
        DataConnector DC = new DataConnector();
        Validator VDT = new Validator();
        DataLoader DL = new DataLoader();

        //============================This objects has used for Save and Update Data==============
        PageCreationEntity PCE = new PageCreationEntity();
        DropDownEntity DDE = new DropDownEntity();
        UserEntity UE = new UserEntity();
        ModuleCreationEntity MCE = new ModuleCreationEntity();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                VDT.UserAccessibility(Session["Role"].ToString(), "../../UI/Security/CreatePage.aspx");
                if (Session["User"] != null && VDT.IsAccess == true)
                {
                    if (!IsPostBack) {
                        LoadModuleToDDL();
                        GetPageInfo();
                        LoadParentModuleToDDL();
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
        protected void DdlModulSelectedIndexChanged(object sender, EventArgs e)
        {
            //Response.Redirect(ddlModule.SelectedValue);
        }

        protected void GvPInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                int newindex = e.NewPageIndex;
                gvPInfo.PageIndex = newindex;
                GetPageInfo();
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " GvPInfo_PageIndexChanging" + ex.Message, "~/Log.txt");
            }
          
        }

        protected void Rdcolor(object sender, EventArgs e)
        {
            Rdbutton1.Style.Add("background-color", "green");
        }

        protected void GvPInfo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string id = gvPInfo.SelectedRow.Cells[0].Text.Trim().Replace("&nbsp;", "");
                HdnPageId.Value = id;
                txtName.Text = gvPInfo.SelectedRow.Cells[1].Text.Trim().Replace("&nbsp;", "");
                txtURL.Text = gvPInfo.SelectedRow.Cells[2].Text.Trim().Replace("&nbsp;", "");
                ddlModule.SelectedValue =gvPInfo.SelectedRow.Cells[4].Text;
                HdnModuleId.Value = ddlModule.SelectedValue;
                textdesc.Text = gvPInfo.SelectedRow.Cells[3].Text.Trim().Replace("&nbsp;", "");
                if (gvPInfo.SelectedRow.Cells[6].Text == "True")
                {
                    Rdbutton1.Value = "1";
                    Rdbutton1.Checked = true;
                    lvlrbl1.Attributes.Add("class", "btn btn-default btnActive active");
                    lvlrbl2.Attributes.Add("class", "btn btn-default btnActive ");
                }
                else
                {
                    Rdbutton2.Value = "0";
                    Rdbutton2.Checked = true;
                    lvlrbl2.Attributes.Add("class", "btn btn-default btnActive active");
                    lvlrbl1.Attributes.Add("class", "btn btn-default btnActive ");
                }
                btnSave.InnerText = "Update";
               
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " GvPInfo_SelectedIndexChanged" + ex.Message, "~/Log.txt");
            }
        }


        protected void GvPInfoOnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                if (VDT.IsWrite == true)
                {
                    string PID, qryAPV, result;
                    PID = gvPInfo.DataKeys[e.RowIndex].Values["PageId"].ToString();
                    qryAPV = "Delete From PageInfo where [PageId] ='" + PID + "' ;  Delete from UserRoleDetail where PageId ='" + PID + "' ";
                    result = DC.ExecuteQuery(qryAPV, "ConnDB230");
                    if (result == "1")
                    {
                        VDT.ShowMessage(lblMsg, "Page is deleted.......", "ERR");
                        GetPageInfo();
                    }
                }
                else
                    VDT.ShowMessage(lblMsg, "You are not permitted to perform this operation.......", "ERR");
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " GvPInfoOnRowDeleting " + ex.Message, "~/Log.txt");
            }
        }




        //================================================Loading Module to Dropdown=======================================
        protected void LoadModuleToDDL()
        {
            string QRY = "SELECT [ModuleID], [ModuleName] FROM [ModuleInfo] ORDER BY [ModuleName]";
            DL.LoadDll(ddlModule, DC.GetDataTable(QRY), "ModuleID", "ModuleName", "Select Role Module");
         
        }
        protected void LoadParentModuleToDDL()
        {
            string QRY = "SELECT [ModuleID], [ModuleName] FROM [ModuleInfo] ORDER BY [ModuleName]";
            DL.LoadDll(ddlParentModule, DC.GetDataTable(QRY), "ModuleID", "ModuleName", "Select Role Module");

        }


        protected void BtnSaveOnClick(object sender, EventArgs e)
        {
            SaveData();
        }

        protected void BtnModuleSaveOnClick(object sender, EventArgs e)
        {
            SaveModuleData();
        }

        protected void BtnRefreshOnClick(object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void BtnModuleRefreshOnClick(object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
        //==========================================Storing PageInfo data to properties=====================================
        protected void SaveData()
        {
            btnSave.Disabled = true;
            PCE.PageName = txtName.Text;
            PCE.PageURL = txtURL.Text;
            DDE.DDLValue = ddlModule.SelectedValue;
            PCE.Description = textdesc.Text;
            if (Rdbutton1.Checked == true)
            {
                PCE.IsActive = Rdbutton1.Value;
            }
            else if (Rdbutton2.Checked == true)
            {
                PCE.IsActive = Rdbutton2.Value;
            }
            else
            {
                PCE.IsActive = "";
            }
            UE.AddBy = Session["UserId"].ToString();
            if (UE.AddBy != string.Empty && PCE.PageName != string.Empty && PCE.PageURL != string.Empty && DDE.DDLValue != string.Empty && PCE.IsActive != string.Empty && PCE.Description != string.Empty)
            {
                  if (btnSave.InnerText == "Save" && VDT.IsWrite == true)
                    {
                        if (VDT.IsDuplicate("select * from [PageInfo] where PageName='" + PCE.PageName + "'") == false)
                        {
                  
                        SavingFunc();
                        GetPageInfo();
                        btnSave.Disabled = false;
                        ClearData();
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('Duplicate Value Can not be inserted......');", true);
                            btnSave.Disabled = false;
                        }
                    }
                  else if (btnSave.InnerText == "Update" && VDT.IsEdit == true)
                    {
                        UpdatingFunc();
                        GetPageInfo();
                        btnSave.Disabled = false;
                        ClearData();
                    }
                  else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('You are not permitted......');", true);

                    }
             
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('All Field Are Mandatory! You can not put any field Blank......');", true);
                btnSave.Disabled = false;
            }

        }
        //==========================================SavingFunc for storing data to database=====================================
        protected void SavingFunc()
        {
            try
            {
                string qryuser = "EXEC Sp_PageInfoInsertUpdateDelete '','"+ PCE.PageName +"','"+ PCE.PageURL +"','"+ PCE.Description +"',"+
                    "'"+ DDE.DDLValue +"','"+ PCE.IsActive +"','"+ Convert.ToInt32(UE.AddBy) +"','"+UE.AddDate+"', 'Insert'";
                string Result= DC.GetObjectDataId(qryuser, "ConnDB230");
                if (Result != " ")
                {
                    StoretoUserRole(Result);

                }
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " SavingFunc " + ex.Message, "~/Log.txt");

            }
        }

        //==========================================UpdatingFunc for updating data to database=====================================
        protected void UpdatingFunc()
        {
            try
            {
                string qryuser = "EXEC Sp_PageInfoInsertUpdateDelete '"+ HdnPageId.Value +"','" + PCE.PageName + "','" + PCE.PageURL + "','" + PCE.Description + "'," +
                    "'" + DDE.DDLValue + "','" + PCE.IsActive + "','" + Convert.ToInt32(UE.AddBy) + "','" + UE.AddDate + "', 'Update'";
                string Result = DC.ExecuteQuery(qryuser, "ConnDB230");
                if (Result == "1")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('Page Updated SuccessFully !!! Now Fix Role For Controlling Access, EDIT , UPDATE AND DELETE......');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('Some Error Happened While Updating');", true);
                }
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " UpdatingFunc " + ex.Message, "~/Log.txt");
            }
        }

        //==========================================Store PageInfo to RoleDetails Table=====================================

        protected void StoretoUserRole(string PID)
        {
            try
            {
                string qry = "INSERT INTO [UserRoleDetail] ([RoleID],[PageID],[AddBy],[AddDate],IsAccess,IsRead,IsWrite,IsEdit,AccessArea,IsActive) " +
                "VALUES('" + Convert.ToInt32(Session["Role"]) + "','" + PID + "','" + UE.AddBy + "','" + UE.AddDate + "',0,0,0,0,1,1)";
                string result = DC.ExecuteQuery(qry, "ConnDB230");
                if (result != "1")
                {

                    VDT.WriteToLog(DateTime.Now + " " + this.Page + " StoretoUserRole result  ", "~/Log.txt");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('Page Created SuccessFully !!! Now Fix Role For Controlling Access, EDIT , UPDATE AND DELETE......');", true);
                }
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " StoretoUserRole " + ex.Message, "~/Log.txt");
            }

        }

        //==========================================Storing ModuleInfo data to properties=====================================
        protected void SaveModuleData()
        {
            btnModuleSave.Disabled = true;
            MCE.ModuleName = txtMdlName.Text;
            MCE.ParentModuleId =ddlParentModule.SelectedValue;
            MCE.ModuleIcon = txtModuleIco.Text;
            MCE.ModuleURL = txtMdlURl.Text;
            MCE.Priority =txtPriority.Text;
            if (rdbYes.Checked == true)
            {
                MCE.IsActive = "1";
            }
            else if (rdbNo.Checked == true)
            {
                MCE.IsActive = "0";
            }
            else
            {
                MCE.IsActive ="";
            }


            if (UE.AddBy != string.Empty && MCE.ModuleName != string.Empty  && MCE.ModuleIcon != string.Empty  && MCE.Priority != null && MCE.IsActive !=null)
            {
                if (btnModuleSave.InnerText == "Save" && VDT.IsWrite == true)
                {
                    if (VDT.IsDuplicate("select * from [ModuleInfo] where ModuleName='" + MCE.ModuleName + "'") == false)
                    {

                        ModuleSavingFunc();
                        //SavingFunc();
                        //GetPageInfo();
                        //btnSave.Disabled = false;
                        //ClearData();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('Duplicate Value Can not be inserted......');", true);
                        btnModuleSave.Disabled = false;
                        
                    }
                }
                //else if (btnModuleSave.InnerText == "Update" && VDT.IsEdit == true)
                //{
                //    ModuleUpdatingFinc();
                //    //UpdatingFunc();
                //    //GetPageInfo();
                //    //btnSave.Disabled = false;
                //    //ClearData();
                //}
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('You are not permitted......');", true);
                    btnModuleSave.Disabled = false;
                }

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('All Field Are Mandatory! You can not put any field Blank......');", true);
                btnModuleSave.Disabled = false;
            }
        }


        //=============================================Storing Module Information To the Module table==============================
        protected void ModuleSavingFunc()
        {
            try
            {
               //==================================Need to Code Here ===========================================
                string qryuser = "EXEC Sp_ModuleinfoInsert '" + MCE.ModuleName + "','" + MCE.ModuleIcon + "','" + MCE.ModuleURL + "'," +
                 "'" + MCE.ParentModuleId + "','"+ MCE.Priority +"','" + MCE.IsActive + "','" + Convert.ToInt32(UE.AddBy) + "','" + UE.AddDate + "', 'Insert'";
                string Result = DC.GetObjectDataId(qryuser, "ConnDB230");
                if (Result != "")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('New Module Created......');", true);
                    ClearModuleData();
                    ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "text", "hideModal()", true);
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Pop", "$('#myModal').modal('hide');", true);

              
                    LoadModuleToDDL();
                    LoadParentModuleToDDL();
                    ddlModule.SelectedValue = Result;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('Somthing Bad happened while creating new module......');", true);
                }
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " ModuleSavingFunc() " + ex.Message, "~/Log.txt");

            }
        }

        //=============================================Updating Module Information To the Module table==============================
        //protected void ModuleUpdatingFinc()
        //{

        //    try
        //    {
        //        //string qryuser = "EXEC Sp_PageInfoInsertUpdateDelete '" + HdnPageId.Value + "','" + PCE.PageName + "','" + PCE.PageURL + "','" + PCE.Description + "'," +
        //        //    "'" + DDE.DDLValue + "','" + PCE.IsActive + "','" + Convert.ToInt32(UE.AddBy) + "','" + UE.AddDate + "', 'Update'";
        //        //string Result = DC.ExecuteQuery(qryuser, "ConnDB230");

        //        //==================================Need to Code Here ===========================================
        //        //if (Result == "1")
        //        //{
        //        //    ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('Page Updated SuccessFully !!! Now Fix Role For Controlling Access, EDIT , UPDATE AND DELETE......');", true);
        //        //}
        //        //else
        //        //{
        //        //    ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('Some Error Happened While Updating');", true);
        //        //}
        //    }
        //    catch (Exception ex)
        //    {
        //        VDT.WriteToLog(DateTime.Now + " " + this.Page + " ModuleUpdatingFinc() " + ex.Message, "~/Log.txt");
        //    }
          
        //}

        //==========================================Storing Page information to the Gridview =====================================

        protected void GetPageInfo()
        {
            try
            {
                string qry = "EXEC Sp_PageInfoInsertUpdateDelete '','','','','','','','', 'Select'";
                DataTable dtPageInfo = DC.GetDataTable(qry);
                if (dtPageInfo != null)
                {
                    gvPInfo.DataSource = dtPageInfo;
                    gvPInfo.DataBind();
                }
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " GetPageInfo " + ex.Message, "~/Log.txt");
            }
        }

        //====================================================  Clearing Data  =================================================
        protected void ClearData()
        {
            txtName.Text = "";
            txtURL.Text = "";
            textdesc.Text = "";
            ddlModule.ClearSelection();
            Rdbutton1.Checked = false;
            Rdbutton2.Checked = false;
            btnSave.InnerText = "Save";
        }
        //====================================================  Clearing Data From Module =================================================
        protected void ClearModuleData()
        {
            txtMdlName.Text = "";
            txtMdlURl.Text = "";
            txtModuleIco.Text = "";
            txtName.Text= "";
            ddlParentModule.ClearSelection();
            txtPriority.Text = "";
            btnModuleSave.InnerText = "Save";
        }
    }
}