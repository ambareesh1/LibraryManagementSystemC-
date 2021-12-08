<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="AddStudent.aspx.cs" Inherits="LibraryManagementSystem.AddStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="col s12 m9 l9">
        <div id="divMsg" runat="server" class="card" style="padding: 10px; font-size: 18px; background: rgba(139, 195, 74, 0.98); color: #fff;" visible="false">
           <span id="spanMag" runat="server"> Student Added and student Id# : <span id="spanStudentId" runat="server"></span></span>
        </div>
        <div class="card">
            <div class="card-content">
                <span class="card-title">Add Student</span>
                <form  class="col s12">
                    <div class="row">
                        <div class="input-field col s6">
                            <asp:TextBox runat="server" ID="txtName" CssClass="validate" ></asp:TextBox>
                            <label for="txtName">Student Name</label>
                        </div>

                        <div id="divCources" class="col s6 m6 l6">
                            <div class="col s12">
                                <label for="ddlDepartment">Department</label>
                                <asp:DropDownList ID="ddlDepartment" runat="server" Style="display: block; margin-bottom: 2%">
                                   
                                </asp:DropDownList>

                            </div>
                        </div>

                        <div class="input-field col s6">
                            <asp:TextBox runat="server" TextMode="Email" ID="txtEmail" CssClass="validate" ></asp:TextBox>
                            <label for="txtEmail">Email</label>
                        </div>

                        <div class="input-field col s6">
                            <asp:TextBox runat="server" ID="txtPhone" TextMode="Phone" CssClass="validate" onkeypress="return isNumber(event)" MaxLength="10" ></asp:TextBox>
                            <label for="txtPhone">Phone</label>
                        </div>

                        <div class="input-field col s12">
                            <asp:TextBox runat="server" ID="txtAddress" Rows="4" CssClass="validate materialize-textarea" ></asp:TextBox>
                            <label for="txtAddress">Address</label>
                        </div>

                        <asp:Button runat="server" ID="btnAddStudent" CssClass="btn" Text="Add Student" OnClick="btnAddStudent_Click" />

                    </div>
                </form>
            </div>

        </div>

         <div class="col s12 m12 l12">
           <div class="card">
            <div class="card-content">
                <span class="card-title"><i class="small material-icons">list</i>  List of Categories</span>
                
                <asp:GridView runat="server" ID="gvUser" AutoGenerateColumns="false" OnSelectedIndexChanged="gvUser_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" />
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Department" HeaderText="Department" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Phone" HeaderText="Contact No" />
                         <asp:BoundField DataField="Address" HeaderText="Address" />
                        
                        
                           <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button runat="server" ID="btn1" CssClass="btn" Text="Edit" style="background:#3F51B5 !important" CommandName="Select" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

               

            </div>

        </div>
            </div>



    
    </div>


</asp:Content>
