using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.IO;
using Role_User_Page_ManagementDataLoader;
using Role_User_Page_ManagementDataConnetion;
using Role_User_Page_ManagementValidator;
using Role_User_Page_ManagementEntity;
using Role_User_Page_ManagementCustomDataLoader;

namespace Role_User_Page_Management.UI
{
    public partial class Default : System.Web.UI.Page
    {
        DataConnector DC = new DataConnector();
        Validator VDT = new Validator();
        protected void Page_Load(object sender, EventArgs e)
        {
            //VDT.UserAccessibility(Session["Role"].ToString(), "../../UI/Security/Default.aspx");
            //if (Session["User"] != null && VDT.IsAccess == true)
            //{
            fuImages.Attributes["onchange"] = "UploadFile(this)";
            imgDynamiccrop.Visible = false;
            //}
            //else
            //{
            //    Response.Redirect("~/UI/403.aspx");
            //}
        }
        protected void BtnGetImage_OnClick(object sender, EventArgs e)
        {
            try
            {
                ViewState["filename"] = null;
                ViewState["filename"] = DateTime.Now.ToString("ss") + Path.GetFileName(fuImages.PostedFile.FileName);
                fuImages.SaveAs(Server.MapPath("~/Image/" + ViewState["filename"].ToString()));
                imgDynamiccrop.Src = "~/Image/" + ViewState["filename"].ToString();
                imgDynamiccrop.Visible = true;
            }
            catch (Exception ex)
            { }
        }
        protected void BtnDynamiccrop_Click(object sender, EventArgs e)
        {
            try
            {
                string fpath = Path.Combine(Server.MapPath("~/Image"), ViewState["filename"].ToString());
                System.Drawing.Image oimg = System.Drawing.Image.FromFile(fpath);
                Rectangle cropcords = new Rectangle(
                Convert.ToInt32(hdnx.Value),
                Convert.ToInt32(hdny.Value),
                Convert.ToInt32(hdnw.Value),
                Convert.ToInt32(hdnh.Value));
                string cfname, cfpath;
                Bitmap bitMap = new Bitmap(cropcords.Width, cropcords.Height, oimg.PixelFormat);
                Graphics grph = Graphics.FromImage(bitMap);
                grph.DrawImage(oimg, new Rectangle(0, 0, bitMap.Width, bitMap.Height), cropcords, GraphicsUnit.Pixel);
                cfname = DateTime.Now.ToString("ss") + ViewState["filename"].ToString();
                cfpath = Path.Combine(Server.MapPath("~/Image"), cfname);
                bitMap.Save(cfpath);
                imgDynamiccropped.Visible = true;
                imgDynamiccrop.Src = "~/Image/" + cfname;
                imgDynamiccrop.Visible = true;
            }
            catch (Exception ex)
            {
                //throw ex;
            }
        }
    }
}