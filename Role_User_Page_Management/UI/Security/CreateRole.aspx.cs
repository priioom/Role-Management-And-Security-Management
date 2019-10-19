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
    public partial class Create_Role : System.Web.UI.Page
    {
        DataConnector DC = new DataConnector();
        Validator VDT = new Validator();
        //============================This objects has used for Save and Update Data==============     
        UserEntity UE = new UserEntity();
        RoleEntity RE = new RoleEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                VDT.UserAccessibility(Session["Role"].ToString(), "../../UI/Security/CreateRole.aspx");
                if (Session["User"] != null && VDT.IsAccess == true)
                {
                    GetRoleinfo();
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

        protected void GvRoleInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                int newindex = e.NewPageIndex;
                gvRoleInfo.PageIndex = newindex;
                GetRoleinfo();
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " GvRoleInfo_PageIndexChanging" + ex.Message, "~/Log.txt");
            }

        }

        protected void GvRoleInfo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string id = gvRoleInfo.SelectedRow.Cells[0].Text.Trim().Replace("&nbsp;", "");
                HdnRoleID.Value = id;
                txtName.Text = gvRoleInfo.SelectedRow.Cells[1].Text.Trim().Replace("&nbsp;", "");
                textdesc.Text = gvRoleInfo.SelectedRow.Cells[2].Text.Trim().Replace("&nbsp;", "");
                btnSave.InnerText = "Update";

            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " GvRoleInfo_SelectedIndexChanged" + ex.Message, "~/Log.txt");
            }
        }

        protected void GvRoleInfoOnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                if (VDT.IsWrite == true)
                {
                    string PID, qryAPV, result;
                    PID = gvRoleInfo.DataKeys[e.RowIndex].Values["RoleId"].ToString();
                    qryAPV = "EXEC [Sp_RoleInfoInsertUpdateDelete] '" + PID + "','','','','','Delete'";
                    result = DC.ExecuteQuery(qryAPV, "ConnDB230");
                    if (result == "1")
                    {
                        VDT.ShowMessage(lblMsg, "Role is deleted.......", "ERR");
                        GetRoleinfo();
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
        
        protected void BtnRefreshOnClick(object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString());
        }

        protected void BtnSaveOnClick(object sender, EventArgs e)
        {
            btnSave.Disabled = true;
            SaveRoleInfo();
        }


//=========================================================New Role Information will be save from this function 
        protected void SaveRoleInfo()
        {
            RE.RoleName = txtName.Text;
            RE.RoleDescription = textdesc.Text;
            UE.AddBy = Session["UserId"].ToString();
            if (UE.AddBy != string.Empty && RE.RoleName != string.Empty && RE.RoleDescription != string.Empty)
            {
                if (btnSave.InnerText == "Save" && VDT.IsWrite == true)
                {
                    if (VDT.IsDuplicate("select * from [UserRoleMaster] where RoleName='" + RE.RoleName + "' AND IsActive=1") == false)
                    {

                        SavingFunc();
                        //GetPageInfo();
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
                    //GetPageInfo();
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


//===============================================New Role Data store to Database
        protected void SavingFunc()
        {
            try
            {
                string qryuser = "EXEC [Sp_RoleInfoInsertUpdateDelete] '','"+ RE.RoleName +"','"+ RE.RoleDescription +"','"+ Convert.ToInt32(UE.AddBy) +"','"+ UE.AddDate +"','Insert'";
                string Result = DC.GetObjectDataId(qryuser, "ConnDB230");
                if (Result != "")
                {
                    CreatingRolePages(Result);
               
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('Somthing Bad happened while creating new role......');", true);
                }
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " SavingFunc " + ex.Message, "~/Log.txt");

            }
        }

        //===============================================Updating Role Data from here
        protected void UpdatingFunc()
        {
            try
            {
                string qryuser = "EXEC [Sp_RoleInfoInsertUpdateDelete] '" + HdnRoleID.Value + "','" + RE.RoleName + "','" + RE.RoleDescription + "','" + UE.AddBy + "','" + UE.AddDate + "','Update'";
                string Result = DC.ExecuteQuery(qryuser, "ConnDB230");
                if (Result == "1")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('Role Updated SuccessFully ');", true);
                    GetRoleinfo();
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

        protected void GetRoleinfo()
        {
            try
            {
                string qry = "EXEC [Sp_RoleInfoInsertUpdateDelete] '','','','','','Select'";
                DataTable dtRoleInfo = DC.GetDataTable(qry);
                if (dtRoleInfo != null)
                {
                    gvRoleInfo.DataSource = dtRoleInfo;
                    gvRoleInfo.DataBind();
                }
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " GetRoleinfo " + ex.Message, "~/Log.txt");
            }
        }

        //===============================================Creating Pages For ROle
        protected void CreatingRolePages( string role)
        {
            string result="";
            DataTable Dt = new DataTable();
            Dt = DC.GetDataTable("Select PageId from PageInfo");
            try {
                if (Dt != null)
                {
                    for (int i = 0; i < Dt.Rows.Count; i++)
                    {
                        result = DC.ExecuteQuery("insert into UserRoleDetail (RoleId,[PageId],[IsAccess],[IsRead],[IsWrite],[IsEdit],[AccessArea],AddBy,AddDate,IsActive ) Values('" + role + "', '" + Dt.Rows[i][0].ToString() + "', 0, 0 , 0,0,1,'" + UE.AddBy + "', '" + UE.AddDate + "', 1)", "ConnDB230");
                    }
                    if (result == "1")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('New Role Created......');", true);
                        GetRoleinfo();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('Somthing Bad happened while creating pages......');", true);
                    }
                }
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " CreatingRolePages " + ex.Message, "~/Log.txt");
            }

        }


//===========================================================TextBox Data Clearing from here
        protected void ClearData()
        {
            txtName.Text = "";
            textdesc.Text = "";
            btnSave.InnerText = "Save";
        }
    }
}