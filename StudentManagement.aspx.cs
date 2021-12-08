using LibraryManagementSystem.MiddleLayer;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
   
    public partial class StudentManagement : System.Web.UI.Page
    {
        //Connection strings to connect with database
        static string strconWFMS = ConfigurationManager.ConnectionStrings["conLibrary"].ConnectionString;
        static SqlConnection con = new SqlConnection(strconWFMS);

        static string Id = string.Empty;
        //Intilizing middle layer
        LibraryMiddleLayer md = new LibraryMiddleLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {
                Id = Request.QueryString["Id"].ToString().Trim();
                DataTable dt = new DataTable();
                dt = md.BindUserDetailWithId(Id);
                idName.InnerHtml = dt.Rows[0]["Name"].ToString();

                //Bind Issued Books 
                dt = md.BindBookDetailIssued(Id);
                gvBooksIssued.DataSource = dt;
                gvBooksIssued.DataBind();
                idIssuedBooks.InnerHtml = dt.Rows.Count.ToString();

                //logic to hide check out button if penalty>0

                for(int i=0;i<dt.Rows.Count;i++)
                {
                    if(Convert.ToInt32(dt.Rows[i]["penalty"]) >0)
                    {
                        btnSubmitSelected.Enabled = false;
                        errorMsg.InnerText = "Please pay penalty in order to check out the books";
                    }
                }
                //bind data on page load
                Bind();

            }
        }

        public void Bind()
        {
            DataTable dt = new DataTable();
            //Bind Return Books
            dt = md.BindReturnBookDetails(Id);
            gvReturnBooks.DataSource = dt;
            gvReturnBooks.DataBind();
            idReturnBooks.InnerHtml = dt.Rows.Count.ToString();

            //Bind book Details
            dt = md.BindBookDetail();
            gvBooks.DataSource = dt;
            gvBooks.DataBind();
            idBooks.InnerHtml = dt.Rows.Count.ToString();

            //Bind notifications 
            dt = md.BindNotificationDetails(Id);
            gvNotifications.DataSource = dt;
            gvNotifications.DataBind();
            idNotifications.InnerHtml = dt.Rows.Count.ToString();

            //Bind Check Out Books
            dt = md.BindCheckOutbooks(Id);
            gvCheckOut.DataSource = dt;
            gvCheckOut.DataBind();
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string studentId = Id;
            string name = idName.InnerText;
            string title = txtTitle.Text;
            string Description = txtDescription.Text;
            if (title != "" && Description != "")
            {
                int result = md.InsertNotificationDetails(title, Description, studentId, name);
                if (result == 1)
                {
                    divMsg.Visible = true;
                    divMsg.InnerHtml = "Notification send";
                    txtDescription.Text = "";
                    txtTitle.Text = "";

                    //Bind notifications 
                    DataTable dt = new DataTable();
                    dt = md.BindNotificationDetails(studentId);
                    gvNotifications.DataSource = dt;
                    gvNotifications.DataBind();
                    idNotifications.InnerHtml = dt.Rows.Count.ToString();
                    Bind();
                }
            }
            else
            {
                divMsg.Visible = true;
                divMsg.Style.Add("Background-color", "tomato");
                divMsg.InnerHtml = "Please fill required fileds";
            }
        }

        [WebMethod]
        public static List<string> BindBook(string bookName)
        {
            List<string> result = new List<string>();

            DataTable dt = new DataTable();

            SqlCommand cmd = new SqlCommand("select  BookName,BookId from [tbl_AddABooks] where BookName LIKE '%'+@SearchText+'%' OR BookId  LIKE '%'+@SearchText+'%' And BookQty >0", con);
            cmd.Parameters.AddWithValue("@SearchText", bookName);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    result.Add(dr["BookName"].ToString()+"  -   "+dr["BookId"].ToString());
                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex; //TODO: Please log it or remove the catch

            }
            finally
            {
                con.Close();
            }


        }

        protected void btnSearchBook_Click(object sender, EventArgs e)
        {
            
            if(autocompleteinput.Text.Trim().Equals(""))
            {

            }
            else
            {
                divSearch.Visible = true;
                string[] searchText = autocompleteinput.Text.Split('-');
                string bookId = searchText[1].Trim();
                DataTable dt = new DataTable();
                dt = md.BindSearchDetail(bookId);
                gvSearchResult.DataSource = dt;
                gvSearchResult.DataBind();
            }
        }

        protected void btnSubmitSelected_Click(object sender, EventArgs e)
        {
            int result = 0;
            int id = 0;
            string name = string.Empty;
            StringBuilder sb = new StringBuilder();
            foreach (GridViewRow gvrow in gvSearchResult.Rows)
            {
                CheckBox chk = (CheckBox)gvrow.FindControl("chkSelect");
                if (chk != null & chk.Checked)
                {
                     id =  Convert.ToInt32(Request.QueryString["Id"]);
                     name = idName.InnerText;
                    int bookId = Convert.ToInt32(gvrow.Cells[1].Text);
                    string bookName = gvrow.Cells[2].Text;
                    string returnDate = txtReturnDate.Text;
                    sb.Append("Book Id : "+bookId+" Book Name :"+bookName+"");
                    result = md.InsertCheckOutBookDetails(bookId, bookName, id,returnDate);
                    Bind();
                }
            }

            if (result == 1)
            {
                divMsg.Visible = true;
                divMsg.InnerText = "Book Cheked Out";
                DataTable dt = new DataTable();
                 dt = md.BindUserDetailWithId(Id);
                string emailFrom = string.Empty;
                if(dt.Rows.Count>0)
                {
                    emailFrom = dt.Rows[0]["email"].ToString();
                }
                string subject = "Book Check Out : " + Id + "" + name;
                string body = "<p> Hi </p> <p>The following books are check out by " + name + "  </p> <p>" + sb + " </p> ";
               // md.sendMail(subject,body, emailFrom, id.ToString(),name);
               

                //Bind Check Out Books
             
                gvCheckOut.DataSource = md.BindCheckOutbooks(Id); ;
                gvCheckOut.DataBind();

                autocompleteinput.Text = string.Empty;

                txtReturnDate.Text = string.Empty;

                foreach (GridViewRow row in gvSearchResult.Rows)
                { if (row.RowType == DataControlRowType.DataRow)
                    { CheckBox chkrow = (CheckBox)row.FindControl("chkSelect");
                        if (chkrow.Checked) chkrow.Checked = false; } }

            }

        }

        protected void test_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx?Id=" + Id + "");
        }
    }
}