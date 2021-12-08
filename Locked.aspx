<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="Locked.aspx.cs" Inherits="LibraryManagementSystem.Locked" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div class="col s12 m9 l9">

        <div class="card">
              <div id="divMsg" runat="server" class="card" style="padding: 10px; font-size: 18px; background: rgba(139, 195, 74, 0.98); color: #fff;" visible="false">
           <span id="spanMag" runat="server"> </span>
        </div>
             <div class="card-content">
                <span class="card-title">Penalty Payed</span>

                  <asp:GridView runat="server" ID="gvLocked" AutoGenerateColumns="false" OnSelectedIndexChanged="gvLocked_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="StudentId" HeaderText="StudentId" />
                            <asp:BoundField DataField="StudentName" HeaderText="StudentName" />
                             <asp:BoundField DataField="TotalAmount" HeaderText="Total Penalty" />
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
