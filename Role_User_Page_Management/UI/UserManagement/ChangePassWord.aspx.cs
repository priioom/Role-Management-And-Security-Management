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
using System.Web.Security;

namespace Role_User_Page_Management.UI.UserManagement
{
    public partial class ChangePassWord : System.Web.UI.Page
    {
        DataConnector DC = new DataConnector();
        Validator VDT = new Validator();
        DataLoader DL = new DataLoader();
        UserEntity UE = new UserEntity();
        ChangePasswordEntity CPE = new ChangePasswordEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                VDT.UserAccessibility(Session["Role"].ToString(), "../../UI/UserManagement/ChangePassWord.aspx");
                if (Session["User"] != null && VDT.IsAccess == true)
                {
                    if (!IsPostBack)
                    {
                        lblUser.Text = Session["User"].ToString();
                        LoadDdlUser();
                        if (Session["Role"].ToString() != "1")
                        {
                            Reset.Visible = false;
                        }
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


        protected void BtnRefreshOnClick(object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString());
        }
        protected void BtnChangeOnClick(object sender, EventArgs e)
        {
            btnSave.Disabled = true;
            ChangeData();
           
        }
        protected void BtnResetOnClick(object sender, EventArgs e)
        {
            btnReset.Disabled = true;
            ResetData();
        }

        protected void LoadDdlUser()
        {
            string QRY = "SELECT UserId, UserName FROM [UserMaster] where IsActive=1 ORDER BY UserName ";
            DL.LoadDll(ddlUser, DC.GetDataTable(QRY), "UserId", "UserName", "Select An User To Reset His Password");
        }


        protected void ChangeData()
        {
#pragma warning disable 0618// Type or member is obsolete
            string CurrentPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtCurrPassword.Value, "SHA1");
#pragma warning disable 0618// Type or member is obsolete
#pragma warning disable 0618// Type or member is obsolete
            string ConfirmPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtConPassword.Value, "SHA1");
#pragma warning disable 0618// Type or member is obsolete
#pragma warning disable 0618// Type or member is obsolete
            string NewPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtNewPassword.Value, "SHA1");
#pragma warning disable 0618// Type or member is obsolete
            CPE.CurrentPassword = CurrentPassword;
            CPE.ConfirmPassword = ConfirmPassword;
            CPE.NewPassword = NewPassword;
            UE.AddBy = Session["UserId"].ToString();
            if (UE.AddBy != string.Empty && CPE.NewPassword != string.Empty && CPE.ConfirmPassword != string.Empty)
            {
                if (btnSave.InnerText == "Change" && VDT.IsWrite == true)
                {
                    if (CPE.NewPassword == CPE.ConfirmPassword)
                    {
                        if (VDT.IsDuplicate("select * from UserMaster where Password='" + CPE.NewPassword + "'  AND UserId='" + UE.AddBy + "' AND IsActive=1") == false)
                        {

                            SavingFunc();

                            btnSave.Disabled = false;
                            ClearData();
                            btnSave.InnerText = "Change";
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('This was your Previous Password......');", true);
                            btnSave.Disabled = false;
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('Password Does not Match......');", true);
                        btnSave.Disabled = false;
                    }
          
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

        protected void ResetData()
        {
#pragma warning disable 0618// Type or member is obsolete
            string ResetPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtRNewPassword.Value, "SHA1");
            string ResetConPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtRConPassword.Value, "SHA1");
#pragma warning disable 0618// Type or member is obsolete
            CPE.ResetPassword =  ResetPassword;
            CPE.ResetConPassword =ResetConPassword;
            UE.AddBy = Session["UserId"].ToString();
            if (UE.AddBy != string.Empty && CPE.ResetPassword != string.Empty && CPE.ResetConPassword != string.Empty && ddlUser.SelectedValue != "") 
            {
                if (btnReset.InnerText == "Save" && VDT.IsWrite == true)
                {
                    if (CPE.ResetPassword == CPE.ResetConPassword)
                    {
                        if (VDT.IsDuplicate("select * from UserMaster where Password='" + CPE.ResetPassword + "' AND IsActive=1 AND UserId='" + ddlUser.SelectedValue + "'") == false)
                        {

                            ResetFunc();

                            btnReset.Disabled = false;
                            ClearData();
                            btnSave.InnerText = "Save";
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('This was His Previous Password......');", true);
                            btnReset.Disabled = false;
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('Password Does not Match......');", true);
                        btnReset.Disabled = false;
                    }

                }

                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('You are not permitted......');", true);

                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('All Field Are Mandatory! You can not put any field Blank......');", true);
                btnReset.Disabled = false;
            }
        }


        protected void ResetFunc()
        {
            try
            {
                //==================================Need to Code Here ===========================================
                string qryuser = "Update [UserMaster] set Password = '" + CPE.ResetPassword + "',Modifyby='" + UE.AddBy + "',ModifyDate='" + UE.AddDate + "'  Where UserId='" + ddlUser.SelectedValue + "' AND IsActive = 1";
                string Result = DC.ExecuteQuery(qryuser, "ConnDB230");
                if (Result == "1")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('Changed Previous Password to a new one......');", true);
             
                    if (UE.AddBy == ddlUser.SelectedValue)
                    {
                        Session.Abandon();
                        Response.Redirect("~/userLogin.aspx");
                    }
                    ClearData();
                   
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('Somthing Bad happened while Registering User Information......');", true);
                }
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " SavingFunc() " + ex.Message, "~/Log.txt");

            }
        }

        protected void SavingFunc()
        {
            try
            {
                //==================================Need to Code Here ===========================================
                string qryuser = "Update [UserMaster] set Password = '" + CPE.NewPassword+ "',Modifyby='" + UE.AddBy + "',ModifyDate='" + UE.AddDate + "'  Where UserId='" + UE.AddBy + "' AND IsActive = 1";
                string Result = DC.ExecuteQuery(qryuser, "ConnDB230");
                if (Result == "1")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('Changed Previous Password to a new one Login again......');", true);
                    Session.Abandon();
                    Response.Redirect("~/userLogin.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('Somthing Bad happened while Registering User Information......');", true);
                }
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " SavingFunc() " + ex.Message, "~/Log.txt");

            }
        }



        protected void ClearData()
        {
            txtConPassword.Value = " ";
            txtCurrPassword.Value = "";
            txtNewPassword.Value = "";
            txtRConPassword.Value = " ";
            txtRNewPassword.Value = "";
            ddlUser.ClearSelection();
        }
    }
}