using LibraryManagementSystem.MiddleLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
    public partial class Notifications : System.Web.UI.Page
    {  //Intilizing middle layer
        LibraryMiddleLayer md = new LibraryMiddleLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                gvNotifications.DataSource = md.BindNotificationDetailsLibrary();
                gvNotifications.DataBind();
            }
        }

        protected void gvNotifications_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtId.Text = gvNotifications.SelectedRow.Cells[1].Text;
            txtTitle.Text = gvNotifications.SelectedRow.Cells[3].Text;
            txtDescription.Text = gvNotifications.SelectedRow.Cells[4].Text;
           


        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string id = gvNotifications.SelectedRow.Cells[0].Text;
            string reply = txtReply.Text;
            int result = md.UpdateNotification(id, reply);
            if(result>0)
            {
                divMsg.Visible = true;
                divMsg.InnerHtml = "Replyed Successfully";
                gvNotifications.DataSource = md.BindNotificationDetailsLibrary();
                gvNotifications.DataBind();
            }

        }
    }
}