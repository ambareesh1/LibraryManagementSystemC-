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
    public partial class Login : System.Web.UI.Page
    {
        LibraryMiddleLayer md = new LibraryMiddleLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ddlUnuiversityId.DataTextField = "Id";
                ddlUnuiversityId.DataTextField = "Id";
                ddlUnuiversityId.DataSource = md.BindUserDetailLoginPage();
                ddlUnuiversityId.DataBind();
                ddlUnuiversityId.Items.Insert(0, "Select");
            }
        }

        protected void btnStudentRegistration_Click(object sender, EventArgs e)
        {
            if(!(idRegistrationForm.Visible))
            {
                idRegistrationForm.Visible = true;
            }
            else
            {
                idRegistrationForm.Visible = false;
            }
           
        }

        protected void ddlUnuiversityId_SelectedIndexChanged(object sender, EventArgs e)
        {
            idRegistrationForm.Visible = true;
            string Id = ddlUnuiversityId.SelectedItem.Text;
            DataTable dt = new DataTable();
            dt = md.GetUserDetailsOnSelectedId(Id);
            if(dt.Rows.Count>0)
            {
                txtName.Text = dt.Rows[0]["Name"].ToString();
                txtEmail.Text = dt.Rows[0]["Email"].ToString();
                txtAddress.Text = dt.Rows[0]["Address"].ToString();
                
            }


           
        }



        protected void btnRegister_Click(object sender, EventArgs e)
        {
            idRegistrationForm.Visible = false;
            string Id = ddlUnuiversityId.SelectedItem.Text;
            string email = txtEmail.Text;
            string pwd = txtPassword.Text;
            string address = txtAddress.Text;
            int result = md.UpdateAccountByUserPassword(email, pwd, address, Id);

            if (result == 1)
            {
                Response.Redirect("StudentManagement.aspx?Id="+Id+"");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            
            string id = txtUniversityId.Text;
            string password = txtLoginPassword.Text;
            //admin registration
            if(id=="67890" && password=="test")
            {
                Response.Redirect("AdminManager.aspx");
            }
            //library manager registra
            else if(id=="12345" && password=="test")
            {
                Response.Redirect("LibraryManager.aspx");
            }
            else
            { 
                //student resistration
            int result = md.CheckLoginCredentials(id, password);

            if(result >0)
            {
                    Response.Redirect("StudentManagement.aspx?Id=" + id + "");
            }
            else
                {
                    divMsg.Visible = true;
                }
            }
        }
    }
}