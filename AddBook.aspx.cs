using LibraryManagementSystem.MiddleLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
    public partial class AddBook : System.Web.UI.Page
    {
        //Intilizing middle layer
        LibraryMiddleLayer md = new LibraryMiddleLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvBooks.DataSource = md.BindBookDetail();
                gvBooks.DataBind();
                ddlCategory.DataSource = md.BindCategoryDetails();
                ddlCategory.DataTextField = "Name";
                ddlCategory.DataValueField = "Id";
                ddlCategory.DataBind();
            }
        }

        protected void btnAddBook_Click(object sender, EventArgs e)
        {
            string bookName = txtBookName.Text;
            string bookPrice = txtBookPrice.Text;
            string bookCategory = ddlCategory.SelectedItem.Text;
            string bookQty = txtBookQty.Text;
            string bookRack = txtRack.Text;
            int result = 0;
            if (bookName != "" && bookPrice != "" && bookCategory != "" && bookQty != "" && bookRack != "")
            {
                result = md.InsertBookDetails(bookName, bookPrice, bookCategory, bookQty, bookRack);
            }
            else
            {
                divMsg.Visible = true;
                divMsg.Style.Add("Background-color", "Tomato");
                divMsg.InnerText = "Please provide required inputs";
            }

            if (result == 1)
            {
                divMsg.Visible = true;
                divMsg.InnerText = "Book Added";
                gvBooks.DataSource = md.BindBookDetail();
                gvBooks.DataBind();

                txtBookName.Text = "";
                txtBookPrice.Text = "";
                txtBookQty.Text = "";
                txtRack.Text = "";
            }
        }
    }
}