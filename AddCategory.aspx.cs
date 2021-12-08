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
    public partial class AddCategory : System.Web.UI.Page
    {
        //Intilizing middle layer
        LibraryMiddleLayer md = new LibraryMiddleLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                gvCategory.DataSource = md.BindCategoryDetails();
                gvCategory.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           
            string name = txtCategoryName.Text;
            if(name!="")
            { 

            if(btnSubmit.Text == "Submit")
                { 
            int result = md.InsertCategory(name);
            if (result == 1)
            {
                divMsg.Visible = true;
                spanMag.InnerText = "Added Category";
                txtCategoryName.Text = "";
               
            }
            }
            else
                {
                    string Id = gvCategory.SelectedRow.Cells[0].Text;
                    int result = md.UpdateCategory(Id, name);

                    if(result >0)
                    {
                        divMsg.Visible = true;
                        spanMag.InnerHtml = "Category Updated Successfully";
                        divMsg.Style.Add("Background-color", "#FF9800");
                        txtCategoryName.Text = "";
                    }
                }
            }
           
            else
            {
                divMsg.Visible = true;
                spanMag.InnerHtml = "Please enter category name.";
                divMsg.Style.Add("Background-color", "Tomato");
            }

            gvCategory.DataSource = md.BindCategoryDetails();
            gvCategory.DataBind();
            divMsg.Visible = true;
            btnSubmit.Text = "Submit";
            btnSubmit.Style.Add("Background-color", "#00BCD4 !important");
        }

        protected void gvCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

            divMsg.Visible = false;
            string Id = gvCategory.SelectedRow.Cells[0].Text;
            btnSubmit.Text = "Update";
            btnSubmit.Style.Add("Background-color", "#FF9800 !important");

            DataTable dt = new DataTable();
            dt = md.GetCategorysOnSelectedId(Id);
            if (dt.Rows.Count > 0)
            {
                txtCategoryName.Text = dt.Rows[0]["Name"].ToString();

            }
        }
    }
}