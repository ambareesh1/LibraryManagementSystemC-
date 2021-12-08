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
    public partial class AddDepartment : System.Web.UI.Page
    {
        //Intilizing middle layer
        LibraryMiddleLayer md = new LibraryMiddleLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            gvDepartment.DataSource = md.BindDepartmentDetails();
            gvDepartment.DataBind();
        }

        protected void gvDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            divMsg.Visible = false;
            string Id = gvDepartment.SelectedRow.Cells[0].Text;
            btnSubmit.Text = "Update";
            btnSubmit.Style.Add("Background-color", "#FF9800 !important");

            DataTable dt = new DataTable();
            dt = md.GetDepartmentOnSelectedId(Id);
            if (dt.Rows.Count > 0)
            {
                txtDepartment.Text = dt.Rows[0]["Name"].ToString();

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtDepartment.Text;
            if (name != "")
            {

                if (btnSubmit.Text == "Submit")
                {
                    int result = md.InsertDepartment(name);
                    if (result == 1)
                    {
                        divMsg.Visible = true;
                        spanMag.InnerText = "Added Department";
                        txtDepartment.Text = "";

                    }
                }
                else
                {
                    string Id = gvDepartment.SelectedRow.Cells[0].Text;
                    int result = md.UpdateDepartment(Id, name);

                    if (result > 0)
                    {
                        divMsg.Visible = true;
                        spanMag.InnerHtml = "Department Updated Successfully";
                        divMsg.Style.Add("Background-color", "#FF9800");
                        txtDepartment.Text = "";
                    }
                }
            }

            else
            {
                divMsg.Visible = true;
                spanMag.InnerHtml = "Please enter Department name.";
                divMsg.Style.Add("Background-color", "Tomato");
            }

            gvDepartment.DataSource = md.BindDepartmentDetails();
            gvDepartment.DataBind();
            divMsg.Visible = true;
            btnSubmit.Text = "Submit";
            btnSubmit.Style.Add("Background-color", "#00BCD4 !important");
        }
    }
}