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
    public partial class ReturnBook : System.Web.UI.Page
    {
        LibraryMiddleLayer md = new LibraryMiddleLayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string Id = txtStudentId.Text;

            if (Id != "")
            {
                DataTable dt = new DataTable();
                dt = md.BindBookDetailIssued(Id);
                if (dt.Rows.Count > 0)
                {
                    divDetails.Visible = true;
                    gvAlreadyIssued.DataSource = dt;
                    gvAlreadyIssued.DataBind();

                    gvReturnBooks.DataSource = md.BindReturnBookDetails(Id);
                    gvReturnBooks.DataBind();
                }
                else
                {
                    divMsg.Visible = true;
                    divMsg.InnerHtml = "Books not issued for respective id : <b> " + Id + "";
                }
            }
            else
            {
                divMsg.InnerHtml = "Please enter Student Id";
            }

        }

        protected void btnReturnBook_Click(object sender, EventArgs e)
        {
            int result = 0;

            foreach (GridViewRow gvrow in gvAlreadyIssued.Rows)
            {
                CheckBox chk = (CheckBox)gvrow.FindControl("chkSelect");
                if (chk != null & chk.Checked)
                {

                    int IssueId = Convert.ToInt32(gvrow.Cells[1].Text);
                    string returnDate = txtReturnDate.Text;
                    result = md.UpdateIssueBookDetails(IssueId, returnDate);
                }
            }

            if (result == 1)
            {
                divMsg.Visible = true;
                divMsg.InnerText = "Updated Books Returned";
            }

        }
    }
}