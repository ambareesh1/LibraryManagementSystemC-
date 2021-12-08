<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDepartment.aspx.cs" EnableEventValidation="false" MasterPageFile="~/Library.Master" Inherits="LibraryManagementSystem.AddDepartment" %>

<asp:Content ID="content4" runat="server" ContentPlaceHolderID="MainContent">
<div class="col s12 m9 l9">
    <div class="card">
     <div id="divMsg" runat="server" class="card" style="padding: 10px; font-size: 18px; background: rgba(139, 195, 74, 0.98); color: #fff;" visible="false">
           <span id="spanMag" runat="server">  <span id="spanStudentId" runat="server"></span></span>
        </div>
     <div class="card-content">
                <span class="card-title">Add Department</span>
                <form class="col s12">
                    <div class="row">
                        <div class="input-field col s5">
                            <asp:TextBox ID="txtDepartment" runat="server" ></asp:TextBox>
                            <label for="txtDepartment">Department Name</label>
                        </div>

                        <div class="col s3">
                           
                            <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="btn"  style="margin-top: 2%" OnClick="btnSubmit_Click"/>
                        </div>

                    </div>
                </form>
            </div>
    </div>
         <div class="col s12 m12 l12">
           <div class="card">
            <div class="card-content">
                <span class="card-title"><i class="small material-icons">list</i>  List of Departments</span>

                     <asp:GridView runat="server" ID="gvDepartment"  AutoGenerateColumns="false" OnSelectedIndexChanged="gvDepartment_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" />
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        
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