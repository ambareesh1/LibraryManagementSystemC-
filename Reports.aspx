<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="LibraryManagementSystem.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <div class="col s12 m9 l9">
            <div id="divMsg" runat="server" class="card" style="padding: 10px; font-size: 18px; background: rgba(139, 195, 74, 0.98); color: #fff;" visible="false">
           <span id="spanMag" runat="server">  <span id="spanStudentId" runat="server"></span></span>
        </div>
        <div class="card">
             <div class="card-content">
                 <div style="float:right">
                     <asp:ImageButton runat="server" ID="btnExcel" ImageUrl="~/Img/excel.png" Width="32px" Height="32px" OnClick="btnExcel_Click" />
                     <asp:ImageButton runat="server" ID="btnWord" ImageUrl="~/Img/word.png" Width="32px" Height="32px" OnClick="btnWord_Click" />
                 </div>
                <span class="card-title">Reports</span>

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

        <div class="card">
             <div class="card-content">
               
                <span class="card-title">Penalty Details</span>

                       <asp:GridView runat="server" ID="gvPenalty" AutoGenerateColumns="false" OnSelectedIndexChanged="gvPenalty_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="StudentId" HeaderText="Student Id" />
                          <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                        <asp:BoundField DataField="BookId" HeaderText="Id" />
                        <asp:BoundField DataField="BookName" HeaderText="Name" />
                        <asp:BoundField DataField="IssuedOn" HeaderText="Issued On" />
                       <asp:BoundField DataField="Penalty" HeaderText="Penalty" />
                            <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button runat="server" ID="btn1" CssClass="btn" style="background:#8BC34A  !important" Text="Unlock"   CommandName="Select" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                 </div>
            </div>

          </div>

     
    
</asp:Content>
