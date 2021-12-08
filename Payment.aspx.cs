using LibraryManagementSystem.MiddleLayer;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
    public partial class Payment : System.Web.UI.Page
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
                Bind();
            }




        }

        public void Bind()
        {
            DataTable dt = new DataTable();
            dt = md.GetPenaultyDetails(Id);
            gvPenaltyBooks.DataSource = dt;
            gvPenaltyBooks.DataBind();
            int result = 0;
            
                result =  Convert.ToInt32(dt.Rows[0]["TotalAmount"].ToString());
            

            txtPenalty.Text = result.ToString();
        }

        protected void btnPenalty_Click(object sender, EventArgs e)
        {
            long totalPenaltyAmount = Convert.ToInt64(txtPenalty.Text);
            long StudentPayedPenaty = Convert.ToInt64(txtStudentAmount.Text);

            if(StudentPayedPenaty==totalPenaltyAmount)
            {
                //int result = md.PayPanalty(Id);
                btnPenalty.Enabled = false;
                int resultDel = md.UpdateStudentPeanlty(Id, 0);
                divMsg.Visible = true;
                divMsg.InnerHtml = "Penalty payed !!!";

                Bind();
            } else if(StudentPayedPenaty > totalPenaltyAmount)
            {
                divMsg.Visible = true;
                divMsg.InnerHtml = "Amount you paying exceeded the penalty Amount !!!";
            }
            else
            {
                long diffAmount = totalPenaltyAmount - StudentPayedPenaty;
                int result = md.UpdateStudentPeanlty(Id, diffAmount);
                divMsg.Visible = true;
                divMsg.InnerHtml = "Penalty payed !!!";

                Bind();

            }

            txtStudentAmount.Text = "0";
        
        }
    }
}