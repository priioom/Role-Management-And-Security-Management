using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Role_User_Page_ManagementDataLoader
{
    public class DataLoader
    {
        public void LoadDll(DropDownList ddl, DataTable dt, string valueField, string textField, string blankField)
        {
            try
            {
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddl.DataTextField = textField;
                    ddl.DataValueField = valueField;
                    ddl.DataSource = dt;
                    ddl.DataBind();
                    ddl.Items.Insert(0, new ListItem("--" + blankField + "--", ""));
                }
                else
                {
                    ddl.Items.Clear();
                    ddl.Items.Insert(0, new ListItem("...No Data Found...", ""));
                }
            }
            catch
            {
                ddl.Items.Clear();
                ddl.Items.Add(new ListItem("--" + blankField + "--", "0"));
                //ddlProduct.Enabled = false;
            }
        }

        public void LoadDllMul(DropDownList ddl, DataTable dt, string valueField, string textField)
        {
            try
            {
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddl.DataTextField = textField;
                    ddl.DataValueField = valueField;
                    ddl.DataSource = dt;
                    ddl.DataBind();
                    //ddl.Items.Insert(0, new ListItem("--" + blankField + "--", ""));
                }
                else
                {
                    ddl.Items.Clear();
                    //ddl.Items.Insert(0, new ListItem("...No Data Found...", ""));
                }
            }
            catch
            {
                ddl.Items.Clear();
                //ddl.Items.Add(new ListItem("--" + blankField + "--", "0"));
                //ddlProduct.Enabled = false;
            }
        }

        public void LoadListbx(ListBox ddl, DataTable dt, string valueField, string textField, string blankField)
        {
            try
            {
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddl.DataTextField = textField;
                    ddl.DataValueField = valueField;
                    ddl.DataSource = dt;
                    ddl.DataBind();
                    //ddl.Items.Insert(0, new ListItem("--" + blankField + "--", ""));
                }
                else
                {
                    ddl.Items.Clear();
                    //ddl.Items.Insert(0, new ListItem("...No Data Found...", ""));
                }
            }
            catch
            {
                ddl.Items.Clear();
                //ddl.Items.Add(new ListItem("--" + blankField + "--", "0"));
                //ddlProduct.Enabled = false;
            }
        }

        public void LoadChkbxlst(CheckBoxList chk, DataTable dt, string valueField, string textField, string blankField)
        {
            try
            {
                if (dt != null && dt.Rows.Count > 0)
                {
                    chk.DataTextField = textField;
                    chk.DataValueField = valueField;
                    chk.DataSource = dt;
                    chk.DataBind();
                    //ddl.Items.Insert(0, new ListItem("--" + blankField + "--", ""));
                }
                else
                {
                    chk.Items.Clear();
                    //ddl.Items.Insert(0, new ListItem("...No Data Found...", ""));
                }
            }
            catch
            {
                chk.Items.Clear();
                //ddl.Items.Add(new ListItem("--" + blankField + "--", "0"));
                //ddlProduct.Enabled = false;
            }
        }



        public DataTable AssignGridViewToDataTable(GridView GV)
        {
            DataTable dt = new DataTable();
            if (GV.HeaderRow != null) // add the columns to the datatable
            {
                for (int i = 0; i < GV.HeaderRow.Cells.Count; i++)
                    dt.Columns.Add(GV.HeaderRow.Cells[i].Text);
            }
            foreach (GridViewRow row in GV.Rows) //  add each of the data rows to the table
            {
                DataRow dr;
                dr = dt.NewRow();
                for (int i = 0; i < row.Cells.Count; i++)
                    dr[i] = row.Cells[i].Text;    //.Replace(" ", "");
                dt.Rows.Add(dr);
            }
            return dt;
        }
    }
}

