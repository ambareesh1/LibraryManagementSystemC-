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
    public partial class Reports : System.Web.UI.Page
    {//Intilizing middle layer
        LibraryMiddleLayer md = new LibraryMiddleLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                gvBooks.DataSource = md.BindBookDetail();
                gvBooks.DataBind();

                gvPenalty.DataSource = md.PenaltyStudents();
                gvPenalty.DataBind();
            }
        }

        protected void btnExcel_Click(object sender, ImageClickEventArgs e)
        {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Customers.xls"));
            Response.ContentType = "application/ms-excel";
            DataTable dt = md.BindBookDetail(); 
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
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Customers.docx"));
            Response.ContentType = "application/ms-word";
            DataTable dt = md.BindBookDetail();
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

        protected void gvPenalty_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Id = gvPenalty.SelectedRow.Cells[0].Text;
          
            DataTable dt = new DataTable();
            dt = md.UnlockPenaulty(Id);
            divMsg.Visible = true;
            divMsg.InnerText = "Penalty Updated";

            gvPenalty.DataSource = md.PenaltyStudents();
            gvPenalty.DataBind();
        }
    }
}