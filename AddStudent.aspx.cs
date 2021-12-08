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
    public partial class AddStudent : System.Web.UI.Page
    {
        //Intilizing middle layer
        LibraryMiddleLayer md = new LibraryMiddleLayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                gvUser.DataSource = md.BindUserDetail();
                gvUser.DataBind();
                ddlDepartment.DataTextField = "Name";
                ddlDepartment.DataValueField = "Id";
                ddlDepartment.DataSource = md.BindDepartmentDetails();
                ddlDepartment.DataBind();
            }
        }

        protected void btnAddStudent_Click(object sender, EventArgs e)
        {
            

            string name = txtName.Text;
            string department = ddlDepartment.SelectedItem.Text;
            string email =txtEmail.Text;
            string phone = txtPhone.Text;
            string address = txtAddress.Text;
            if(name!= "" && department!= "" && email!= "" && phone!= "" && address!="")
         { 
            int emailExist = 0;
            if (btnAddStudent.Text == "Add Student")
            {
                 emailExist = md.CheckEmailId(email);
                if (emailExist == 0)
                {
                    int result = md.InsertUserDetails(name, department, email, phone, address);

                    if (result == 1)
                    {
                        divMsg.Visible = true;
                        spanMag.InnerHtml = "Student Added and student Id # " + md.GenarateId() + "";
                        divMsg.Style.Add("Background-color", "#8BC34A");

                        txtName.Text = "";
                        txtEmail.Text = "";
                        txtPhone.Text = "";
                        txtAddress.Text = "";

                        gvUser.DataSource = md.BindUserDetail();
                        gvUser.DataBind();


                    }
                }
                else
                {
                    divMsg.Visible = true;
                    spanMag.InnerHtml = "Email Id already Exits.";
                    divMsg.Style.Add("Background-color", "Tomato");
                   

                }
            }
            else
            {
               
                int result = md.UpdateUserDeatils(txtName.Text, ddlDepartment.SelectedItem.Text, txtEmail.Text, txtPhone.Text, txtAddress.Text);
                if(result > 0)
                {
                    divMsg.Visible = true;
                    spanMag.InnerHtml = "Student Details Updated Successfully";
                    divMsg.Style.Add("Background-color", "#FF9800");
                    txtName.Text = "";
                    txtEmail.Text = "";
                    txtPhone.Text = "";
                    txtAddress.Text = "";

                     gvUser.DataSource = md.BindUserDetail();
                     gvUser.DataBind();
                     btnAddStudent.Text = "Add Student";
                     btnAddStudent.Style.Add("Background-color", "#00BCD4");
                    }
              
            }
            }else
            {
                divMsg.Visible = true;
                spanMag.InnerHtml = "Please fill all the required fields.";
                divMsg.Style.Add("Background-color", "Tomato");
            }

        }

        protected void gvUser_SelectedIndexChanged(object sender, EventArgs e)
        {
            divMsg.Visible = false;
            string Id = gvUser.SelectedRow.Cells[0].Text;
            string btnTextLock = gvUser.SelectedRow.Cells[4].ClientID;
           

                btnAddStudent.Text = "Update";
                btnAddStudent.Style.Add("Background-color", "#FF9800 !important");

                DataTable dt = new DataTable();
                dt = md.GetUserDetailsOnSelectedId(Id);
                if (dt.Rows.Count > 0)
                {
                    txtName.Text = dt.Rows[0]["Name"].ToString();
                    txtEmail.Text = dt.Rows[0]["Email"].ToString();
                    txtPhone.Text = dt.Rows[0]["Phone"].ToString();
                    ddlDepartment.SelectedItem.Text = dt.Rows[0]["Department"].ToString();
                    txtAddress.Text = dt.Rows[0]["Address"].ToString();

                }
            }

        }

       
    
}