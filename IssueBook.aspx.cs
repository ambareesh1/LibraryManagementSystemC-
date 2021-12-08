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
    public partial class IssueBook : System.Web.UI.Page
    {
        //Intilizing middle layer
        LibraryMiddleLayer md = new LibraryMiddleLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvBooksIssued.DataSource = md.BindBookDetail();
                gvBooksIssued.DataBind();

                txtIssueDate.Text = DateTime.Now.ToShortDateString();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {


            string id = txtBookName.Text;
            DataTable dt = new DataTable();
            if (id != "")
            {

                dt = md.BindUserDetailWithId(id);
                if (dt.Rows.Count <= 0)
                {
                    divMsg.Visible = true;
                    divMsg.Style.Add("Background-color", "Tomato");
                    divMsg.InnerText = "Student Details Not Found. Please enter correct Student Id";
                }
                else
                {
                    divDetails.Visible = true;
                    lblId.Text = dt.Rows[0]["Id"].ToString();
                    lblName.Text = dt.Rows[0]["Name"].ToString();
                    lblEmail.Text = dt.Rows[0]["Email"].ToString();
                    lblDepartment.Text = dt.Rows[0]["Department"].ToString();
                    lblPhone.Text = dt.Rows[0]["Phone"].ToString();
                    gvAlreadyIssued.DataSource = md.BindBookDetailIssued(lblId.Text);
                    gvAlreadyIssued.DataBind();

                }
            }
            else
            {
                divMsg.Visible = true;
                divMsg.Style.Add("Background-color", "Tomato");
                divMsg.InnerText = "Please enter Student Id";
            }

        }

        protected void btnSubmitSelected_Click(object sender, EventArgs e)
        {
            int result = 0;
            int id = 0;
            foreach (GridViewRow gvrow in gvBooksIssued.Rows)
            {
                CheckBox chk = (CheckBox)gvrow.FindControl("chkSelect");
                if (chk != null & chk.Checked)
                {
                     id = Convert.ToInt32(lblId.Text);
                    string name = lblName.Text;
                    int bookId = Convert.ToInt32(gvrow.Cells[1].Text);
                    string bookName = gvrow.Cells[2].Text;
                    string issuedDate = txtIssueDate.Text;
                    string returnDate = txtReturnDate.Text;

                    result = md.InsertIssueBookDetails(bookId, bookName, id, name, issuedDate, returnDate);
                    result = md.UpdateQty(1, bookId);
                }
            }

            if (result == 1)
            {
                divMsg.Visible = true;
                divMsg.InnerText = "Books Issued";
                gvBooksIssued.DataSource = md.BindBookDetailIssued(id.ToString());
            }

        }
    }
}