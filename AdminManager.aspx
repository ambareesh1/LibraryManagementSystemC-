<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminManager.aspx.cs" Inherits="LibraryManagementSystem.AdminManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Parallax Template - Materialize</title>

    <!-- CSS  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/js/materialize.min.js"></script>
    
    <style>
        .circle1 {
            width: 10px;
            border-radius: 20px;
            height: 10px;
            background-color: #66bb6a;
            display: inline-block;
        }

         .circle2 {
            width: 10px;
            border-radius: 20px;
            height: 10px;
            background-color: tomato;
            display: inline-block;
        }
           .circle3 {
            width: 10px;
            border-radius: 20px;
            height: 10px;
            background-color: rgba(233, 30, 99, 0.66);
            display: inline-block;
        }
              .circle4 {
            width: 10px;
            border-radius: 20px;
            height: 10px;
            background-color: #FFC107;
            display: inline-block;
        }

              .weight
              {
                  font-weight: 500;
              }
              .info-box {
    display: block;
    min-height: 90px;
    background: #fff;
    width: 100%;
    box-shadow: 0 1px 1px rgba(0,0,0,0.1);
    border-radius: 2px;
    margin-bottom: 15px;
}

.bg-aqua, .callout.callout-info, .alert-info, .label-info, .modal-info .modal-body {
    background-color: #00c0ef !important;
}
.info-box-content {
    padding: 5px 10px;
    margin-left: 90px;
}
.info-box-icon {
    border-top-left-radius: 2px;
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 2px;
    display: block;
    float: left;
    height: 90px;
    width: 90px;
    text-align: center;
    font-size: 45px;
    line-height: 90px;
    background: rgba(0,0,0,0.2);
}
.info-box-number {
    display: block;
    font-weight: bold;
    font-size: 18px;
}
.spanfont
{
    font-size:x-large;
    font-weight:600;
}
    </style>
    </head>

<body>
    <form id="form1" runat="server">
  
        <nav>
            <div class="nav-wrapper" style="background:rgba(244, 67, 54, 0.79)">
                <a style="color: #fff;font-weight: 300;" href="StudentManagement.aspx" class="brand-logo"><i class="material-icons">local_library</i>Library Management System</a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="Login.Aspx"><i class="material-icons">power_settings_new</i></a></li>
                </ul>
            </div>

        </nav>
         
        <div class="row" style="margin-top:3%">

        <div class="col m3  s3 l3">
          <div class="info-box card z-depth-4" style="border:1px solid rgba(96, 125, 139, 0.22)">
            <span class="info-box-icon bg-aqua" style="background:rgba(0, 150, 136, 0.78) !important"> <i class="medium material-icons ion ion-ios-gear-outline" style="color:#fff;line-height: 1.5;">account_box</i> </span>

            <div class="info-box-content">
              <span class="info-box-text">Students</span>
              <span class="info-box-number spanfont" id="idStudents" runat="server"></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
          
        <div class="col m3  s3 l3">
          <div class="info-box card z-depth-4" style="border:1px solid rgba(96, 125, 139, 0.22)">
            <span class="info-box-icon bg-aqua" style="background:rgba(0, 188, 212, 0.86) !important"> <i class="medium material-icons ion ion-ios-gear-outline" style="color:#fff;line-height: 1.5;">library_books</i> </span>

            <div class="info-box-content">
              <span class="info-box-text">Books</span>
              <span class="info-box-number spanfont" id="idBooks" runat="server"></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
          
        <div class="col m3  s3 l3">
          <div class="info-box card z-depth-4" style="border:1px solid rgba(96, 125, 139, 0.22)">
            <span class="info-box-icon bg-aqua" style="background:rgba(139, 195, 74, 0.79) !important"> <i class="medium material-icons ion ion-ios-gear-outline" style="color:#fff;line-height: 1.5;">art_track</i> </span>

            <div class="info-box-content">
              <span class="info-box-text">Category</span>
              <span class="info-box-number spanfont" id="idCategory" runat="server"></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
        <div class="col m3  s3 l3">
          <div class="info-box card z-depth-4" style="border:1px solid rgba(96, 125, 139, 0.22)">
            <span class="info-box-icon bg-aqua" style="background:rgba(244, 67, 54, 0.79) !important"> <i class="medium material-icons ion ion-ios-gear-outline" style="color:#fff;line-height: 1.5;">content_copy</i> </span>

            <div class="info-box-content">
              <span class="info-box-text">Departments</span>
              <span class="info-box-number spanfont" id="idDepartment" runat="server"></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>

        

                </div>

        <div class="container">
            <div id="divMsg" runat="server" class="card" style="padding: 10px; font-size: 18px; background: rgba(139, 195, 74, 0.98); color: #fff;" visible="false"> </div>
             <div class="card">
             <div class="card-content">
                  <span class="card-title">Students</span>
                  <asp:GridView runat="server" ID="gvUser" AutoGenerateColumns="false" OnSelectedIndexChanged="gvUser_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="Department" HeaderText="Department" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="IsActive" HeaderText="IsActive" />
                             <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button runat="server" ID="btn1" CssClass="btn" style="background:tomato !important" Text="Lock"    CommandName="Select" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

             </div>
         </div>

             <div class="card">
             <div class="card-content">
                  <span class="card-title">Students Locked</span>
                  <asp:GridView runat="server" ID="gvLocked" AutoGenerateColumns="false" OnSelectedIndexChanged="gvLocked_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="Department" HeaderText="Department" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="IsActive" HeaderText="IsActive" />
                             <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button runat="server" ID="btn1" CssClass="btn" style="background:#8BC34A  !important" Text="Unlock"   CommandName="Select" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

             </div>
         </div>

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

             <div class="card">
             <div class="card-content">
                    <span class="card-title">Category</span>

                    <asp:GridView runat="server" ID="gvCategory" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            
                           
                        </Columns>
                    </asp:GridView>

             </div>
         </div>

            <div class="card">
             <div class="card-content">
                    <span class="card-title">Department</span>

                    <asp:GridView runat="server" ID="gvDepartment" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            
                             
                        </Columns>
                    </asp:GridView>

             </div>
         </div>
 <div class="card">
             <div class="card-content">
               <div style="float:right">
                     <asp:ImageButton runat="server" ID="btnExcel" ImageUrl="~/Img/excel.png" Width="32px" Height="32px" OnClick="btnExcel_Click" />
                     <asp:ImageButton runat="server" ID="btnWord" ImageUrl="~/Img/word.png" Width="32px" Height="32px" OnClick="btnWord_Click" />
                 </div>
                <span class="card-title">Penalty Details</span>

                       <asp:GridView runat="server" ID="gvPenalty" AutoGenerateColumns="false" OnSelectedIndexChanged="gvPenalty_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="StudentId" HeaderText="Student Id" />
                          <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                        <asp:BoundField DataField="BookId" HeaderText="Id" />
                        <asp:BoundField DataField="BookName" HeaderText="Name" />
                        <asp:BoundField DataField="IssuedOn" HeaderText="Issued On" />
                       <asp:BoundField DataField="Penalty" HeaderText="Penalty ($)" />
                      
                    </Columns>
                </asp:GridView>

                 </div>
            </div>
        </div>
           
        
    </form>
</body>
</html>
