using LibraryManagementSystem.MiddleLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
    public partial class LibraryManager : System.Web.UI.Page
    {
        //Intilizing middle layer
        LibraryMiddleLayer md = new LibraryMiddleLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Bind(); //bind on page load
            }


        }

        public void Bind()
        {
            DataTable dt = new DataTable();

            //Bind Book Details
            dt = md.BindBookDetail();
            gvBooks.DataSource = dt;
            gvBooks.DataBind();
            idBookText.InnerHtml = dt.Rows.Count.ToString();

            //Bind Books issued
            dt = md.BindBookDetailIssuedHome();
            gvBooksIssued.DataSource = dt;
            gvBooksIssued.DataBind();
            idIssuedBooks.InnerHtml = dt.Rows.Count.ToString();


            //Bind Return Book Details
            dt = md.BindReturnBookDetailsHome();
            gvReturnBooks.DataSource = dt;
            gvReturnBooks.DataBind();
            idReturnBooksText.InnerText = dt.Rows.Count.ToString();

            //Bind Student details
            dt = md.BindUserDetail();
            gvUser.DataSource = dt;
            gvUser.DataBind();
            idStudentsText.InnerHtml = dt.Rows.Count.ToString();

            //Bind Check Out books
            gvCheckOut.DataSource = md.CheckOutbooks();
            gvCheckOut.DataBind();
        }


        protected void btnRunService_Click(object sender, EventArgs e)
        {
            SendMail();
        }

        public void SendMail()
        {
            DataTable dt = new DataTable();
            dt = md.GetPenaltyDataMail();
            if (dt.Rows.Count > 0)
            {
                int[] arr = new int[dt.Rows.Count];
                string StudentIdStored = string.Empty;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string bookId = dt.Rows[i]["IssueId"].ToString();
                    string userId = dt.Rows[i]["StudentId"].ToString();
                    string name = dt.Rows[i]["StudentName"].ToString();
                    string email = dt.Rows[i]["Email"].ToString();

                    string subject = string.Empty;
                    DataTable dt1 = new DataTable();

                    dt1 = md.GetPenaultyBooks(userId);

                    if(userId != StudentIdStored)
                    {
                        StudentIdStored = userId;
                        StringBuilder sb1 = new StringBuilder();
                        int penalty=0;
                        string IssuedId = string.Empty;
                        string userIdEmail = string.Empty;
                        string nameEmail = string.Empty;
                        string emailEmail = string.Empty;
                       
                        sb1.Append("<table border='1'> <tr> <th>Book Id </th> <th>Book Name </th> <th>Issue On </th> <th>Return Date </th> <th>Penalty</th>");
                        for (int j = 0; j < dt1.Rows.Count; j++)
                        {
                             IssuedId = dt1.Rows[j]["IssueId"].ToString();
                             userIdEmail = dt1.Rows[j]["StudentId"].ToString();
                             nameEmail = dt1.Rows[j]["StudentName"].ToString();
                             emailEmail = dt1.Rows[j]["Email"].ToString();
                            int res = md.UpdatePenaultyMail(IssuedId);
                            sb1.Append("<tr> <td> " + dt1.Rows[j]["bookID"] + "" + "</td> <td> " + dt1.Rows[j]["bookName"] + "</td> <td>  " + dt1.Rows[j]["issuedOn"] + "</td><td>" + dt1.Rows[j]["ReturnDate"] + " </td><td>  " + dt1.Rows[j]["penalty"] + "</td></tr>");
                           
                            if (Convert.ToInt32(dt1.Rows[j]["penalty"].ToString())>=10)
                            {
                                penalty = 1;
                            }
                        }
                        sb1.Append("</table>");

                        //Insertion of penalty 
                        DataTable dt2 = new DataTable();
                        dt2= md.GetPenaultyBooks(userId);
                        long totalPenalty = 0;
                       if(dt2.Rows.Count>0)
                        { 
                        for(int m=0;m<dt.Rows.Count;m++)
                        {
                            totalPenalty = totalPenalty + Convert.ToInt64(dt2.Rows[i]["Penalty"].ToString());
                        }
                        }

                        //Delete in the table if already student exists
                        if (dt2.Rows.Count > 0)
                        {
                            int resultDel = md.DeleteStudentPenaltyExists(userIdEmail);
                            int resultInsert = md.InsertPenaltyBookDetails(userIdEmail, nameEmail, totalPenalty.ToString());
                        }


                        if (penalty == 1)
                        {
                            subject = "Account Locked: " + userIdEmail + "- " + nameEmail + "";
                            string body = "<p>HI " + nameEmail + " </p> <p> Account locked because you have exceded the penaulty $10 </p> <p> If you want to unlock the account please pay the penaulty </p><p> Inorder to pay your penalty <a href='http://localhost:50178/Payment.aspx?Id=" + userIdEmail+ "' target='_blank'> click here </a> </p><p> Thanks, </p> <p> Library management </p>";
                             md.sendMail(subject, body, email, userId, name);
                            
                        }
                        else 
                        {
                            subject = "Return date exceeded : " + userIdEmail + "- " + nameEmail + "";
                            string body = "<p>HI " + name + " </p> <p> Please return the book on time as it exceeded the return date </p><p> <p> Inorder to pay your penalty <a href='http://localhost:50178/Payment.aspx?Id=" + userIdEmail + "' target='_blank'> click here </a> Thanks, </p> <p> Library management </p>";
                             md.sendMail(subject, body, email, userId, name);
                          
                        }
                    }

                 
                }
                
            }
            msgService.Visible = true;
            msgService.InnerHtml = "Successfully updated the details";
            Bind();
        }

        protected void gvCheckOut_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //DataTable dt = new DataTable();
            //dt = md.CheckOutbooks();
            //string userId = string.Empty;
            
            //    for(int i=0;i<dt.Rows.Count;i++)
            //  { 
            //    for(int j=0;j<dt.Rows.Count;j++)
            //    {

            //    }
            //    if (userId != dt.Rows[i]["UserId"].ToString())
            //    {
            //        userId = dt.Rows[i]["UserId"].ToString();
            //    }

            //}
               
            




           
        }

        protected void gvCheckOut_SelectedIndexChanged(object sender, EventArgs e)
        {
            msgService.Visible = true;
            int StudentId = Convert.ToInt32(gvCheckOut.SelectedRow.Cells[0].Text);
            string StudentName = gvCheckOut.SelectedRow.Cells[1].Text;
            int BookId = Convert.ToInt32(gvCheckOut.SelectedRow.Cells[2].Text);
            string BookName = gvCheckOut.SelectedRow.Cells[3].Text;
            string ReturnDate = gvCheckOut.SelectedRow.Cells[4].Text;

            int result = md.InsertIssueBookDetails(BookId, BookName, StudentId, StudentName, DateTime.Now.ToShortDateString(), ReturnDate);
            result = md.UpdateQty(1, BookId);
            result = md.UpdateCheckOutBooks(BookId, StudentId);
            if (result >=1)
            {
                msgService.InnerHtml = "Book Id <b>" +BookId+ "</b> is issued to <b>" + StudentId+ "</b> ";
                gvCheckOut.DataSource = md.CheckOutbooks();
                gvCheckOut.DataBind();
                Bind();
            }


        }
    }
}