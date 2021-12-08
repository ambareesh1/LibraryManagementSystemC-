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
    public partial class Locked : System.Web.UI.Page
    {

        //Intilizing middle layer
        LibraryMiddleLayer md = new LibraryMiddleLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                DataTable dt = new DataTable();

                dt = md.GetAllPenaltyDetailsOfStudents();
                gvLocked.DataSource = dt;
                gvLocked.DataBind();
                dt = md.BindUserDetail();
            }
        }

        protected void gvLocked_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Id = gvLocked.SelectedRow.Cells[0].Text;
           int result = md.PayPanalty(Id); 
            divMsg.Visible = true;
            spanMag.InnerText = "Account Unlocked";

            gvLocked.DataSource = md.BindUserDetailLocked();
            gvLocked.DataBind();
        }
    }
}