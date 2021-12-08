<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="ReturnBook.aspx.cs" Inherits="LibraryManagementSystem.ReturnBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
     <div class="col s12 m9 l9">

        <div class="card">
            <div id="divMsg" runat="server" class="card" style="padding: 10px; font-size: 18px; background: rgba(139, 195, 74, 0.98); color: #fff;" visible="false">
            </div>
            <div class="card-content">
                <span class="card-title">Return Book</span>
                <form class="col s12">
                    <div class="row">
                        <div class="input-field col s6">
                            <asp:TextBox ID="txtStudentId" runat="server" ></asp:TextBox>
                            <label for="txtStudentId">Enter Student Id</label>
                        </div>
                        <div class="input-field col s2">
                            <asp:Button runat="server" ID="btnSubmit" CssClass="btn" Text="Submit" OnClick="btnSubmit_Click" />
                        </div>

                        </div>


                    </form>
                    </div>
            </div>
         <div id="divDetails" runat="server" visible="false">
         <div class="col s12 m12 l12">

        <div class="card">
            <div class="card-content">
                <span class="card-title">Issued Books</span>
                <asp:GridView runat="server" ID="gvAlreadyIssued" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="Select">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="chkSelect" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="IssueId" HeaderText="Issued Book Id" />
                        <asp:BoundField DataField="BookId" HeaderText="BookId" />
                        <asp:BoundField DataField="BookName" HeaderText="Name" />
                        <asp:BoundField DataField="IssuedOn" HeaderText="Issued On" />
                         <asp:BoundField DataField="ReturnDate" HeaderText="Return Date" />
                    </Columns>
                </asp:GridView>
            </div>
            <div class="card-action">
                <div class="input-field">
                    <asp:TextBox ID="txtReturnDate" runat="server" class="datepicker" Width="150"></asp:TextBox>
                    <label for="txtReturnDate">Return Book</label>
                </div>
                <div class="">
                <asp:Button runat="server" ID="btnReturnBook" Text="Return Book" CssClass="btn" OnClick="btnReturnBook_Click" />
                    </div>
            </div>
        </div>
    </div>
           <div class="col s12 m12 l12">

        <div class="card">
            <div class="card-content">
                <span class="card-title">Return Books</span>
                <asp:GridView runat="server" ID="gvReturnBooks" AutoGenerateColumns="false">
                    <Columns>
                        
                        <asp:BoundField DataField="IssueId" HeaderText="Issued Book Id" />
                        <asp:BoundField DataField="BookId" HeaderText="BookId" />
                        <asp:BoundField DataField="BookName" HeaderText="Name" />
                        <asp:BoundField DataField="IssuedOn" HeaderText="Issued On" />
                         <asp:BoundField DataField="ReturnDate" HeaderText="Return Date" />
                    </Columns>
                </asp:GridView>
            </div>
       
        </div>
    </div>
             </div>
         </div>
    


</asp:Content>
