<%@ Page Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="LibraryManager.aspx.cs" Inherits="LibraryManagementSystem.LibraryManager" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent" ID="content1">

     <div class="col s12 m9 l9">

        <div class="col s12 m3 l3">
            <div class="card">

                <div class="padding-Card-Content clearfix">

                    <div style="float: left">
                        <h5 runat="server" id="idBookText" style="color: #3f51b5; padding-left: 15px">37</h5>
                    </div>
                    <div style="float: right">
                        <span style="color: #607D8B"><i class="medium material-icons">book</i> </span>
                    </div>
                </div>
                <div class="cardCustomization idCourcesFooter" style="background-color: #00BCD4; margin-top: 22%">
                    <span class="activator">Books </span>
                </div>

            </div>

        </div>

        <div class="col s12 m3 l3">
            <div class="card">

                <div class="padding-Card-Content clearfix">

                    <div style="float: left">
                        <h5 id="idIssuedBooks" runat="server" style="color: #3f51b5; padding-left: 15px">37</h5>
                    </div>
                    <div style="float: right">
                        <span style="color: #607D8B"><i class="medium material-icons">exposure</i> </span>
                    </div>
                </div>
                <div class="cardCustomization idCourcesFooter" style="background-color: #00BCD4; margin-top: 22%">
                    <span class="activator">Issued Books </span>
                </div>

            </div>

        </div>

        <div class="col s12 m3 l3">
            <div class="card">

                <div class="padding-Card-Content clearfix">

                    <div style="float: left">
                        <h5 id="idReturnBooksText" runat="server" style="color: #3f51b5; padding-left: 15px">37</h5>
                    </div>
                    <div style="float: right">
                        <span style="color: #607D8B"><i class="medium material-icons">repeat</i> </span>
                    </div>
                </div>
                <div class="cardCustomization idCourcesFooter" style="background-color: #00BCD4; margin-top: 22%">
                    <span class="activator">Returned Books </span>
                </div>

            </div>

        </div>

        <div class="col s12 m3 l3">
            <div id="divPending" class="card">

                <div class="padding-Card-Content clearfix">

                    <div style="float: left">
                        <h5 runat="server" id="idStudentsText" style="color: #3f51b5; padding-left: 15px">37</h5>
                    </div>
                    <div style="float: right">
                        <span style="color: #607D8B"><i class="medium material-icons">account_circle</i> </span>
                    </div>
                </div>
                <div class="cardCustomization idCourcesFooter" style="background-color: #00BCD4; margin-top: 22%">
                    <span class="activator">Students </span>
                </div>

            </div>

        </div>
            
        <div class="col s12 m12 l12">
            <div class="card">
                <div class="card-content" style="height:100px">
                    <div class="col l4">

                      <asp:Button runat="server" ID="btnRunService" style="background:#3F51B5 !important" CssClass="btn btn-large" Text="Run Service" OnClick="btnRunService_Click"  />
                    </div>
                    <div class="col l8">
                        <div id="msgService" runat="server" visible="false" style="color: #607D8B;font-weight: 500;font-size: large;">

                        </div>
                    </div>
                    </div>
                </div>
            </div>

          <div class="col s12 m12 l12">
            <div class="card">
                <div class="card-content">
                     <span class="card-title">Check Out Books</span>

                             <asp:GridView runat="server" ID="gvCheckOut" CssClass="" AutoGenerateColumns="false" OnSelectedIndexChanged="gvCheckOut_SelectedIndexChanged" OnRowDataBound="gvCheckOut_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="UserId" HeaderText="Student Id" />
                                <asp:BoundField DataField="Name" HeaderText="Name" />
                                <asp:BoundField DataField="BookId" HeaderText="BookId" />
                                <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                                 <asp:BoundField DataField="LastUpdated" HeaderText="Return Date" />
                           
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button runat="server" ID="btnIssue" Text="Issue Book" CssClass="btn" CommandName="Select"  />
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                </div>
                </div>
              </div>
         


        <div class="col s12 m12 l12">
            <div class="card">
                <div class="card-content">
                    <span class="card-title">Books</span>

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
       
        
        <div class="col s12 m12 l12">
            <div class="card">
                <div class="card-content">
                    <span class="card-title">Issued Books</span>
                    <asp:GridView runat="server" ID="gvBooksIssued" AutoGenerateColumns="false">
                        <Columns>
                            
                            <asp:BoundField DataField="BookId" HeaderText="BookId" />
                            <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                            <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                            <asp:BoundField DataField="IssuedOn" HeaderText="Issued On" />
                            <asp:BoundField DataField="ReturnDate" HeaderText="Expected Return Date" />

                        </Columns>
                    </asp:GridView>

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
                            <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                            <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                            <asp:BoundField DataField="IssuedOn" HeaderText="Issued On" />
                            <asp:BoundField DataField="ReturnDateUpdated" HeaderText="Return Date" />
                        </Columns>
                    </asp:GridView>

                </div>


            </div>
        </div>

        <div class="col s12 m12 l12">
            <div class="card">
                <div class="card-content">
                    <span class="card-title">Students</span>
                    <asp:GridView runat="server" ID="gvUser" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="Department" HeaderText="Department" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />

                        </Columns>
                    </asp:GridView>

                </div>


            </div>
        </div>



    </div>
</asp:Content>
