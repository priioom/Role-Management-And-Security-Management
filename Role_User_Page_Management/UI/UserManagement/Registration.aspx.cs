using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Role_User_Page_ManagementDataLoader;
using Role_User_Page_ManagementDataConnetion;
using Role_User_Page_ManagementValidator;
using Role_User_Page_ManagementEntity;
using Role_User_Page_ManagementCustomDataLoader;
using System.Web.Security;





namespace Role_User_Page_Management.UI.UserManagement
{
    public partial class Registration : System.Web.UI.Page
    {
        DataConnector DC = new DataConnector();
        Validator VDT = new Validator();
        DataLoader DL = new DataLoader();
        RegistrationEntity RegE = new RegistrationEntity();
        UserEntity UE = new UserEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                VDT.UserAccessibility(Session["Role"].ToString(), "../../UI/UserManagement/Registration.aspx");
                if (Session["User"] != null && VDT.IsAccess == true)
                {
                    if (!IsPostBack)
                    {
                        LoadDataToRoleDDl();
                        LoadDataToBranchDdl();
                        GetRegistrationData();
                        //LoadModuleToDDL();
                        //GetPageInfo();
                        //LoadParentModuleToDDL();
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





        protected void GvRegInfo_OnSelectedIndexChanged(object sender, EventArgs e){
            try
            {
                string id = gvRegInfo.SelectedRow.Cells[0].Text.Trim().Replace("&nbsp;", "");
                HdnUserID.Value = id;
                txtFirstName.Value = gvRegInfo.SelectedRow.Cells[1].Text.Trim().Replace("&nbsp;", "");
                txtLastName.Value = gvRegInfo.SelectedRow.Cells[2].Text.Trim().Replace("&nbsp;", "");
                txtUserName.Value = gvRegInfo.SelectedRow.Cells[3].Text.Trim().Replace("&nbsp;", "");
                txtPassword.Value = gvRegInfo.SelectedRow.Cells[4].Text.Trim().Replace("&nbsp;", "");
                //txtPassword.Disabled = true;
                pass.Visible = false;
                txtEmail.Value = gvRegInfo.SelectedRow.Cells[7].Text.Trim().Replace("&nbsp;", "");
                txtEmpId.Value = gvRegInfo.SelectedRow.Cells[8].Text.Trim().Replace("&nbsp;", "");
                txtPhoneOff.Value = gvRegInfo.SelectedRow.Cells[5].Text.Trim().Replace("&nbsp;", "");
                txtPhonePersonal.Value = gvRegInfo.SelectedRow.Cells[6].Text.Trim().Replace("&nbsp;", "");
                ddlRole.SelectedValue = gvRegInfo.SelectedRow.Cells[11].Text.Trim().Replace("&nbsp;", "");
                DDLBranch.SelectedValue = gvRegInfo.SelectedRow.Cells[13].Text.Trim().Replace("&nbsp;", "");
                txtPermanentAdress.Text = gvRegInfo.SelectedRow.Cells[10].Text.Trim().Replace("&nbsp;", "");
                txtPresentAddress.Text = gvRegInfo.SelectedRow.Cells[9].Text.Trim().Replace("&nbsp;", "");
                btnSave.InnerText = "Update";

            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " GvRoleInfo_SelectedIndexChanged" + ex.Message, "~/Log.txt");
            }
        }


        protected void GvRegInfo_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                if (VDT.IsWrite == true)
                {
                    string PID, qryAPV, result;
                    PID = gvRegInfo.DataKeys[e.RowIndex].Values["UserId"].ToString();
                    qryAPV = "EXEC [Sp_RegistrationInsertUpdateDelete] '"+ PID +"','','','','','','','','','','','','','','','Delete'";
                    result = DC.ExecuteQuery(qryAPV, "ConnDB230");
                    if (result == "1")
                    {
                        VDT.ShowMessage(lblMsg, "Role is deleted.......", "ERR");
                        GetRegistrationData();
                    }
                }
                else
                    VDT.ShowMessage(lblMsg, "You are not permitted to perform this operation.......", "ERR");
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " GvRegInfo_OnRowDeleting " + ex.Message, "~/Log.txt");
            }
        }

        protected void GvRegInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                int newindex = e.NewPageIndex;
                gvRegInfo.PageIndex = newindex;
                GetRegistrationData();
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " GvRoleInfo_PageIndexChanging" + ex.Message, "~/Log.txt");
            }

        }

        protected void BtnRefreshOnClick(object sender, EventArgs e)
        {

            Page.Response.Redirect(Page.Request.Url.ToString());        
        }

        protected void BtnSaveOnClick(object sender, EventArgs e)
        {
            SaveData();
        }

        protected void LoadDataToRoleDDl()
        {
            string QRY = "SELECT RoleId, RoleName FROM [UserRoleMaster] where IsActive=1 ORDER BY RoleName ";
            DL.LoadDll(ddlRole, DC.GetDataTable(QRY), "RoleId", "RoleName", "Select A Role");
        }


        protected void LoadDataToBranchDdl()
        {

            string QRY = "SELECT BranchId, BranchName FROM SchoolBranch where IsActive=1 ORDER BY BranchName ";
            DL.LoadDll(DDLBranch, DC.GetDataTable(QRY), "BranchId", "BranchName", "Select A Branch");
        }










        protected void SaveData()
        {
#pragma warning disable 0618// Type or member is obsolete
            string Hashedpass = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Value, "SHA1");
#pragma warning disable 0618// Type or member is obsolete
            RegE.FirstName = txtFirstName.Value;
            RegE.LastName = txtLastName.Value;
            RegE.UserName = txtUserName.Value;
            RegE.Password = Hashedpass;
            RegE.Email = txtEmail.Value;
            RegE.EmployeeId =txtEmpId.Value;
            RegE.PhoneOffice = txtPhoneOff.Value;
            RegE.PhonePersonal = txtPhonePersonal.Value;
            RegE.SelectRole = ddlRole.SelectedValue;
            RegE.SelectBranch = DDLBranch.SelectedValue;
            RegE.PresentAddress = txtPresentAddress.Text;
            RegE.PermanentAddress = txtPermanentAdress.Text;
            UE.AddBy = Session["UserId"].ToString();
            if (UE.AddBy != string.Empty && RegE.FirstName != string.Empty && RegE.LastName != string.Empty && RegE.UserName != string.Empty &&
                RegE.Password != string.Empty && RegE.Email != string.Empty && RegE.PhonePersonal != string.Empty && RegE.SelectRole != "-1"
                && RegE.SelectBranch != "-1" && RegE.PresentAddress !=string.Empty && RegE.PermanentAddress !=string.Empty)
            {
                if (btnSave.InnerText == "Save" && VDT.IsWrite == true)
                {
                    if (VDT.IsDuplicate("select * from UserMaster where UserName='" + RegE.UserName + "' AND IsActive=1") == false)
                    {

                        SavingFunc();
                        GetRegistrationData();
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
                    GetRegistrationData();
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






        protected void SavingFunc()
        {
            try
            {
               //==================================Need to Code Here ===========================================
                string qryuser = "EXEC [Sp_RegistrationInsertUpdateDelete] '','"+ RegE.FirstName +"','"+ RegE.LastName +"','"+ RegE.UserName +"','"+RegE.Password+"',"+
                "'"+ RegE.PhoneOffice +"','"+ RegE.PhonePersonal +"','"+ RegE.Email +"', '"+ RegE.EmployeeId +"','"+ RegE.PresentAddress +"',"+
                "'"+ RegE.PermanentAddress +"','"+ RegE.SelectRole +"','"+ RegE.SelectBranch +"','"+ UE.AddBy +"','"+ UE.AddDate +"','Insert'";
                string Result = DC.ExecuteQuery(qryuser, "ConnDB230");
                if (Result == "1")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('New User Registered......');", true);
                   
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


        protected void UpdatingFunc()
        {
            try
            {
                string qryuser = "EXEC [Sp_RegistrationInsertUpdateDelete] '"+ HdnUserID.Value +"','"+ RegE.FirstName +"','"+ RegE.LastName +"','"+ RegE.UserName +"','"+ RegE.Password +"','"+ RegE.PhoneOffice +"', "+
                    "'"+ RegE.PhonePersonal +"','"+ RegE.Email +"','"+ RegE.EmployeeId +"','"+ RegE.PresentAddress +"', '"+ RegE.PermanentAddress +"',"+
                    "'"+ RegE.SelectRole +"','"+ RegE.SelectBranch +"','"+ UE.AddBy +"','"+ UE.AddDate +"','Update'";
                string Result = DC.ExecuteQuery(qryuser, "ConnDB230");
                if (Result == "1")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('Registration info Updated SuccessFully ');", true);
                    GetRegistrationData();
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


        protected void GetRegistrationData()
        {
            try
            {
                string qry = "EXEC [Sp_RegistrationInsertUpdateDelete] '','','','','','','','','','','','','','','','Select'";
                DataTable dtPageInfo = DC.GetDataTable(qry);
                if (dtPageInfo != null)
                {
                    gvRegInfo.DataSource = dtPageInfo;
                    gvRegInfo.DataBind();
                }
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " GetRegistrationData " + ex.Message, "~/Log.txt");
            }
        }
        protected void ClearData()
        {
            txtEmail.Value = "";
            txtEmpId.Value = "";
            txtFirstName.Value = "";
            txtLastName.Value = "";
            txtPassword.Value= "";
            txtPermanentAdress.Text = "";
            txtPhoneOff.Value = "";
            txtPhonePersonal.Value = "";
            txtPresentAddress.Text = "";
            txtUserName.Value = "";
            DDLBranch.ClearSelection();
            ddlRole.ClearSelection();
            btnSave.InnerText = "Save";
            pass.Visible = true;
        }

    }
}