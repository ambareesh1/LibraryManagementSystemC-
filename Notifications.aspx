<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Notifications.aspx.cs" Inherits="LibraryManagementSystem.Notifications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div class="col s12 m9 l9">
         
        <div class="card">
            <div id="divMsg" runat="server" class="card" style="padding: 10px; font-size: 18px; background: rgba(139, 195, 74, 0.98); color: #fff;" visible="false">
            
        </div>
            <div class="card-content">
                <span class="card-title">Notifications</span>

                  <asp:GridView runat="server" ID="gvNotifications" AutoGenerateColumns="false" OnSelectedIndexChanged="gvNotifications_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="Id" />
                            <asp:BoundField DataField="StudentId" HeaderText="Stu. Id" />
                            <asp:BoundField DataField="StudentName" HeaderText="Name" />
                            <asp:BoundField DataField="Title" HeaderText="Title" />
                            <asp:BoundField DataField="Description" HeaderText="Description" />
                            <asp:BoundField DataField="CommentsByLibrary" HeaderText="Reply from Library Manager" />
                             <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button runat="server" ID="btn1" CssClass="btn" Text="Reply"  CommandName="Select" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
         
        
        <div class="card">

            <div class="card-content">
            <form>
                   <div class="row">
                        <div class="input-field col s6">
                            <asp:TextBox ID="txtId" runat="server" Enabled="false" style="font-weight: 500;" ></asp:TextBox>
                            <label for="txtId">Student Id</label>
                        </div>
                        <div class="input-field col s6">
                            <asp:TextBox ID="txtTitle" runat="server" Enabled="false" style="font-weight: 500;" ></asp:TextBox>
                            <label for="txtTitle">Title</label>
                        </div>

                        <div class="input-field col s6">
                            <asp:TextBox ID="txtDescription" runat="server" Enabled="false" TextMode="MultiLine"  style="font-weight: 500;" Rows="5" CssClass="materialize-textarea" ></asp:TextBox>
                            <label for="txtDescription">Description</label>
                        </div>

                      <div class="input-field col s6">
                            <asp:TextBox ID="txtReply" runat="server" TextMode="MultiLine" Rows="5"  CssClass="materialize-textarea" ></asp:TextBox>
                            <label for="txtDescription">Reply</label>
                        </div>

                       <asp:Button runat="server" ID="btnSend" CssClass="btn" Text="Submit" OnClick="btnSend_Click" />

                       </div>
            </form>
            </div>
            </div>
            

         </div>
    

</asp:Content>
