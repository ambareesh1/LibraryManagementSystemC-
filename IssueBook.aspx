<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="IssueBook.aspx.cs" Inherits="LibraryManagementSystem.IssueBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="col s12 m9 l9">

        <div class="card">
            <div id="divMsg" runat="server" class="card" style="padding: 10px; font-size: 18px; background: rgba(139, 195, 74, 0.98); color: #fff;" visible="false">
            
        </div>
            <div class="card-content">
                <span class="card-title">Issue Book</span>
                <form class="col s12">
                    <div class="row">
                        <div class="input-field col s6">
                            <asp:TextBox ID="txtBookName" runat="server" ></asp:TextBox>
                            <label for="txtBookName">Enter Student Id</label>
                        </div>
                        <div class="input-field col s2">
                            <asp:Button runat="server" ID="btnSubmit" CssClass="btn" Text="Submit" OnClick="btnSubmit_Click" />
                        </div>

                        </div>


                    </form>
                    </div>
            </div>

       <div id="divDetails" runat="server" visible="false">        
            <div class="col s4 m4 l5">
           <div class="card" id="divStudentDetails" runat="server">

            <div class="card-content">
                <span class="card-title">Student Details</span>

                <p> Student Id  : <asp:Label runat="server" ID="lblId"></asp:Label></p>
                 <p>Student Name: <asp:Label runat="server" ID="lblName"></asp:Label> </p>
                <p> Email       : <asp:Label runat="server" ID="lblEmail"></asp:Label></p>
                <p> Department  : <asp:Label runat="server" ID="lblDepartment"></asp:Label></p>
                <p> Phone       : <asp:label runat="server" ID="lblPhone"></asp:label></p>
                 
                </div>
        </div>
             </div>
            <div class="col s7 m7 l7">

                <div class="card">
                    <div class="card-content">
                         <span class="card-title">Issued Books</span>
                         <asp:GridView runat="server" ID="gvAlreadyIssued" AutoGenerateColumns="false">
                    <Columns>
                     
                        <asp:BoundField DataField="BookId" HeaderText="BookId" />
                        <asp:BoundField DataField="BookName" HeaderText="Name" />
                        <asp:BoundField DataField="IssuedOn" HeaderText="Issued On" />
                        </Columns>
                        </asp:GridView>

                    </div>
                </div>

            </div>
         

               <div class="col s12 m12 l12">
           <div class="card">
            <div class="card-content">
                <span class="card-title"><i class="small material-icons">list</i>Books to be Issued</span>

                 <asp:GridView runat="server" ID="gvBooksIssued" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="Select">
                            <ItemTemplate>
                                 <asp:CheckBox runat="server" ID="chkSelect" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="BookId" HeaderText="BookId" />
                        <asp:BoundField DataField="BookName" HeaderText="Name" />
                        <asp:BoundField DataField="BookCategory" HeaderText="Category" />
                        <asp:BoundField DataField="BookQty" HeaderText="Qty" />
                       
                    </Columns>
                </asp:GridView>

               
                <div class="row">
                        <div class="input-field col s6">
                            <asp:TextBox ID="txtIssueDate" runat="server" class="datepicker"></asp:TextBox>
                            <label for="txtIssueDate">Book Issue Date</label>
                        </div>

                    <div class="input-field col s6">
                            <asp:TextBox ID="txtReturnDate" runat="server" class="datepicker"></asp:TextBox>
                            <label for="txtReturnDate">Return Book</label>
                        </div>

                    <asp:Button ID="btnSubmitSelected" runat="server" CssClass="btn" Text="Submit" OnClick="btnSubmitSelected_Click" />
                </div>

            </div>

        </div>
            </div>

         </div>
         </div>
</asp:Content>
