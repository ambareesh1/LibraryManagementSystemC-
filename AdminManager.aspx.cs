using LibraryManagementSystem.MiddleLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
    public partial class AdminManager : System.Web.UI.Page
    {
        //Intilizing middle layer
        LibraryMiddleLayer md = new LibraryMiddleLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                DataTable dt = new DataTable();
                dt = md.BindUserDetail();
                
                gvUser.DataSource = dt;
                gvUser.DataBind();
                idStudents.InnerHtml = dt.Rows.Count.ToString();

                dt = md.BindBookDetail();
                gvBooks.DataSource = dt;
                gvBooks.DataBind();
                idBooks.InnerHtml = dt.Rows.Count.ToString();

                dt = md.BindCategoryDetails();
                gvCategory.DataSource = dt;
                gvCategory.DataBind();
                idCategory.InnerHtml = dt.Rows.Count.ToString();

                dt = md.BindDepartmentDetails();
                gvDepartment.DataSource = dt;
                gvDepartment.DataBind();
                idDepartment.InnerHtml = dt.Rows.Count.ToString();

                dt = md.BindUserDetailLocked();
                gvLocked.DataSource = dt;
                gvLocked.DataBind();


                gvPenalty.DataSource = md.PenaltyStudents();
                gvPenalty.DataBind();
            }
        }

        protected void gvUser_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = gvUser.SelectedRow.Cells[0].Text;
            int result = md.UpdateAccount(id, "0");
            divMsg.Visible = true;
            divMsg.Style.Add("Background-Color", "Tomato");
            divMsg.InnerHtml = "User Locked";
            DataTable dt = new DataTable();

            dt = md.BindUserDetailLocked();
            gvLocked.DataSource = dt;
            gvLocked.DataBind();
            dt = md.BindUserDetail();

            gvUser.DataSource = dt;
            gvUser.DataBind();
            idStudents.InnerHtml = dt.Rows.Count.ToString();

            gvPenalty.DataSource = md.PenaltyStudents();
            gvPenalty.DataBind();

        }

        protected void gvLocked_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = gvLocked.SelectedRow.Cells[0].Text;
            int result = md.UpdateAccount(id, "1");
            divMsg.Visible = true;
            divMsg.Style.Add("Background-Color", "#8BC34A");
            divMsg.InnerHtml = "User Unlocked";
            DataTable dt = new DataTable();

            dt = md.BindUserDetailLocked();
            gvLocked.DataSource = dt;
            gvLocked.DataBind();
            dt = md.BindUserDetail();

            gvUser.DataSource = dt;
            gvUser.DataBind();
            idStudents.InnerHtml = dt.Rows.Count.ToString();
        }

        protected void gvPenalty_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnExcel_Click(object sender, ImageClickEventArgs e)
        {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "PenaltyStudentDetails_"+DateTime.Now.ToShortDateString()+".xls"));
            Response.ContentType = "application/ms-excel";
            DataTable dt = md.PenaltyStudents();
            string str = string.Empty;
            foreach (DataColumn dtcol in dt.Columns)
            {
                Response.Write(str + dtcol.ColumnName);
                str = "\t";
            }
            Response.Write("\n");
            foreach (DataRow dr in dt.Rows)
            {
                str = "";
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    Response.Write(str + Convert.ToString(dr[j]));
                    str = "\t";
                }
                Response.Write("\n");
            }
            Response.End();
        }

        protected void btnWord_Click(object sender, ImageClickEventArgs e)
        {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "PenaltyStudentDetails_" + DateTime.Now.ToShortDateString() +".docx"));
            Response.ContentType = "application/ms-word";
            DataTable dt = md.PenaltyStudents();
            string str = string.Empty;
            foreach (DataColumn dtcol in dt.Columns)
            {
                Response.Write(str + dtcol.ColumnName);
                str = "\t";
            }
            Response.Write("\n");
            foreach (DataRow dr in dt.Rows)
            {
                str = "";
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    Response.Write(str + Convert.ToString(dr[j]));
                    str = "\t";
                }
                Response.Write("\n");
            }
            Response.End();
        }
    }
}