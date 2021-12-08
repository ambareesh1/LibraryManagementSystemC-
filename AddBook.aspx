<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" EnableEventValidation="false" MasterPageFile="~/Library.Master" Inherits="LibraryManagementSystem.AddBook" %>

<asp:Content runat="server" ID="content3" ContentPlaceHolderID="MainContent">
     <div class="col s12 m9 l9">

        <div class="card">
            <div id="divMsg" runat="server" class="card" style="padding: 10px; font-size: 18px; background: rgba(139, 195, 74, 0.98); color: #fff;" visible="false">
            
        </div>
            <div class="card-content">
                <span class="card-title">Add Book</span>
                <form class="col s12">
                    <div class="row">
                        <div class="input-field col s6">
                            <asp:TextBox ID="txtBookName" runat="server"></asp:TextBox>
                            <label for="txtBookName">Book Name</label>
                        </div>
                        <div class="input-field col s6">
                            <asp:TextBox ID="txtBookPrice" runat="server" TextMode="Number"></asp:TextBox>
                            <label for="txtBookName">Book Price</label>
                        </div>
                        <div class="col s6 m6 l6">
                            <div class="col s12">
                                <label for="ddlCategory">Category</label>
                                <asp:DropDownList ID="ddlCategory" runat="server" Style="display: block; margin-bottom: 2%">
                                </asp:DropDownList>

                            </div>
                        </div>



                        <div class="input-field col s6">
                            <asp:TextBox ID="txtBookQty" runat="server" TextMode="Number"></asp:TextBox>
                            <label for="txtBookName">Book Qty</label>
                        </div>
                        <div class="col s6 m6 l6">
                            <div class="input-field">
                                <asp:TextBox ID="txtRack" runat="server" TextMode="Number"></asp:TextBox>
                                <label for="txtBookName">Book Rack</label>
                            </div>
                        </div>

                        <asp:Button runat="server" ID="btnAddBook" CssClass="btn" Text="Add Book" OnClick="btnAddBook_Click" />

                    </div>
                </form>
            </div>

        </div>

         <div class="col s12 m12 l12">
           <div class="card">
            <div class="card-content">
                <span class="card-title"><i class="small material-icons">list</i>  List of Books</span>

                 <asp:GridView runat="server" ID="gvBooks" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="BookId" HeaderText="Id" />
                        <asp:BoundField DataField="BookName" HeaderText="Name" />
                        <asp:BoundField DataField="BookCategory" HeaderText="Category" />
                        <asp:BoundField DataField="BookPrice" HeaderText="Price" />
                        <asp:BoundField DataField="BookQty" HeaderText="Qty" />
                        <asp:BoundField DataField="BookRack" HeaderText="Rack" />
                       
                    </Columns>
                </asp:GridView>


            </div>

        </div>
            </div>

   

    
    </div>
</asp:Content>