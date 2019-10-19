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
using System.Globalization;

namespace Role_User_Page_Management.UI.Security
{
    public partial class VersionControl : System.Web.UI.Page
    {
        DataConnector DC = new DataConnector();
        Validator VDT = new Validator();
        VersionControlEntity VCE = new VersionControlEntity();
        UserEntity UE = new UserEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                VDT.UserAccessibility(Session["Role"].ToString(), "../../UI/Security/VersionControl.aspx");
                if (Session["User"] != null && VDT.IsAccess == true)
                {
                    GetVersionInfo();
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


        protected void BtnSaveOnClick(object sender, EventArgs e)
        {
            btnSave.Disabled = true;
            SaveData();
        }

        protected void BtnRefreshOnClick(object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void GvVersionInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                int newindex = e.NewPageIndex;
                gvVersionInfo.PageIndex = newindex;
                GetVersionInfo();
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " GvPInfo_PageIndexChanging" + ex.Message, "~/Log.txt");
            }

        }

        protected void GvVersionInfo_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = gvVersionInfo.SelectedRow.Cells[0].Text.Trim().Replace("&nbsp;", "");
            HdnTaskId.Value = id;
           txtProTitle.Text = gvVersionInfo.SelectedRow.Cells[1].Text.Trim().Replace("&nbsp;", "");
           var decodedhtml = HttpUtility.HtmlDecode(gvVersionInfo.SelectedRow.Cells[3].Text.Trim().Replace("&nbsp;", ""));
           txtDescription.Text = decodedhtml;
           txtRealeaseDate.Text = gvVersionInfo.SelectedRow.Cells[4].Text.Trim().Replace("&nbsp;", "");
           string F2 = txtRealeaseDate.Text;
           string dateString = DateTime.ParseExact(F2, "dd-MM-yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
           txtRealeaseDate.Text = dateString;
           ddlActivity.SelectedIndex = ddlActivity.Items.IndexOf(ddlActivity.Items.FindByText(gvVersionInfo.SelectedRow.Cells[5].Text.Trim().Replace("&nbsp;", "")));
           btnSave.InnerText = "Update";
        }


        //==========================================Storing Version Control data to properties=====================================
        protected void SaveData()
        {
            VCE.Title = txtProTitle.Text;
            VCE.Activity = ddlActivity.SelectedItem.Text;
          

          VCE.ReleaseDate = txtRealeaseDate.Text;
          
       
            VCE.Description = txtDescription.Text;
            UE.AddBy = Session["UserId"].ToString();
            if (UE.AddBy != string.Empty && VCE.Title != string.Empty && VCE.Activity != string.Empty && VCE.ReleaseDate != null && VCE.Description != string.Empty )
            {
                if (btnSave.InnerText == "Save" && VDT.IsWrite == true)
                {
                        SavingFunc();
                        GetVersionInfo();
                        btnSave.Disabled = false;
                        ClearData();
                }
                else if (btnSave.InnerText == "Update" && VDT.IsEdit == true)
                {
                    UpdatingFunc();
                    GetVersionInfo();
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

                //if()
                //string s = DC.GetObjectDataId("select top(1) [TaskNo] from [VersionControl] order by [VersionControlID] desc", "ConnDB230");
                //string voucherNo = VCE.Title + " V" + yy.Substring(yy.Length - 2) + Convert.ToInt32(s+1).ToString("D3");
                string qryuser = "EXEC [Sp_VersionControlInsertUpdateDelete] '','"+ VCE.Title +"','"+ VCE.Activity +"','','"+ VCE.ReleaseDate +"','"+ VCE.Description +"', 1 ,'"+ UE.AddBy +"','" + UE.AddDate + "','Insert'";
                string Result = DC.GetObjectDataId(qryuser, "ConnDB230");
                if (Result != " ")
                {
                    int vno = Convert.ToInt32(Result) / 100 ;
                    if (vno < 1)
                    {
                        string rsult = DC.ExecuteQuery("UPDATE VersionControl SET VersionNo=1 Where TaskNo ='" + Result + "'", "ConnDB230");
                        if (rsult == "1")
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('New Version Added SuccessFully !!!.....');", true);

                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('New Version Can Not Be Added !!!.....');", true);
                        }
                    }
                    else if (Convert.ToInt32(Result) % 100 == 0)
                    {
                        string rsult = DC.ExecuteQuery("UPDATE VersionControl SET VersionNo='" + (vno + 1) + "' Where TaskNo ='" + Result + "'", "ConnDB230");
                        if (rsult == "1")
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('New Version Added SuccessFully !!!.....');", true);

                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('New Version Can Not Be Added !!!.....');", true);
                        }
                    }
                    else
                    {
                        string rsult = DC.ExecuteQuery("UPDATE VersionControl SET VersionNo='" + vno + "' Where TaskNo ='" + Result + "'", "ConnDB230");
                        if (rsult == "1")
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('New Version Added SuccessFully !!!.....');", true);

                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('New Version Can Not Be Added !!!.....');", true);
                        }
                    }


                   

                }
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " SavingFunc " + ex.Message, "~/Log.txt");

            }
        }

        protected void GvVersionInfoOnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                if (VDT.IsWrite == true)
                {
                    string PID, qryAPV, result;
                    PID = gvVersionInfo.DataKeys[e.RowIndex].Values["TaskNo"].ToString();
                    qryAPV = "EXEC [Sp_VersionControlInsertUpdateDelete] '" + PID + "' ,'','','','','','','','', 'Delete'";
                    result = DC.ExecuteQuery(qryAPV, "ConnDB230");
                    if (result == "1")
                    {
                        VDT.ShowMessage(lblMsg, "One Version info deleted.......", "ERR");
                        GetVersionInfo();
                    }
                }
                else
                    VDT.ShowMessage(lblMsg, "You are not permitted to perform this operation.......", "ERR");
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " GvVersionInfoOnRowDeleting " + ex.Message, "~/Log.txt");
            }
        }

        //==========================================UpdatingFunc for updating data to database=====================================
        protected void UpdatingFunc()
        {
            try
            {
                string qryuser = "EXEC [Sp_VersionControlInsertUpdateDelete] '"+ HdnTaskId.Value.ToString() +"','" + VCE.Title + "','" + VCE.Activity + "','','"+ VCE.ReleaseDate +"','"+ VCE.Description +"','','"+ UE.AddBy+"','"+UE.AddDate+"', 'Update'";
                string Result = DC.ExecuteQuery(qryuser, "ConnDB230");
                if (Result == "1")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Save", "alert('Page Updated SuccessFully !!! ');", true);
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

        protected void GetVersionInfo()
        {
            try
            {
                string qry = "EXEC [Sp_VersionControlInsertUpdateDelete] '','','','','','','','','', 'Select'";
                DataTable dtPageInfo = DC.GetDataTable(qry);
                if (dtPageInfo != null)
                {
                    gvVersionInfo.DataSource = dtPageInfo;
                    gvVersionInfo.DataBind();
                }
            }
            catch (Exception ex)
            {
                VDT.WriteToLog(DateTime.Now + " " + this.Page + " GetVersionInfo() " + ex.Message, "~/Log.txt");
            }
        }



        protected void ClearData()
        {
            txtProTitle.Text = "";
            txtDescription.Text = "";
            txtRealeaseDate.Text = "";
            ddlActivity.ClearSelection();
            btnSave.InnerText = "Save";
        }
    }
}