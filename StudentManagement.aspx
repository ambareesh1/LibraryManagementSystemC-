<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentManagement.aspx.cs" EnableEventValidation="false" Inherits="LibraryManagementSystem.StudentManagement" %>

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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/js/materialize.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
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

    </style>
    </head>
    



    <body>
    <form id="form1" runat="server">
        <nav>
            <div class="nav-wrapper">
                <a style="color: #fff;font-weight: 300;" href="StudentManagement.aspx" class="brand-logo"><i class="material-icons">local_library</i> Management System</a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="Login.Aspx"><i class="material-icons">power_settings_new</i></a></li>
                </ul>
            </div>

        </nav>

        <div class="container">
   

            <div class="card">
                 <div id="divMsg" runat="server" class="card" style="padding: 10px; font-size: 18px; background: rgba(139, 195, 74, 0.98); color: #fff;" visible="false">
           
        </div>
                <div class="card-content" style="padding: 15px">
                    <div class="row">
                        <div class="col s3 m3 l4">
                            <span style="font-size: larger" class="weight">Hi  &nbsp; <span id="idName" runat="server">  </span>  </span>
                        </div>
                        <div class="col s9 m9 l8">
                            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <span class="circle1"> </span>  Books Issued  : <span id="idIssuedBooks" runat="server" class="weight"></span>   &nbsp;&nbsp;&nbsp;&nbsp; <span class="circle2"></span>  Books Retured:  <span id="idReturnBooks" runat="server" class="weight"></span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="circle3"></span> Books Available: <span id="idBooks" class="weight" runat="server"></span>&nbsp;&nbsp;&nbsp;&nbsp; <span class="circle4"></span> <span>  Notifications: </span><span runat="server" id="idNotifications" class="weight"></span>
                        </div>
                    </div>


                </div>

            </div>

            <asp:Button runat="server" Text="test" ID="test" OnClick="test_Click" />
            
                      <div class="row">
    <div class="col s12">
      <div class="row">
        <div class="input-field col s8">
          <i class="material-icons prefix">book</i>
          
           <asp:TextBox ID="autocompleteinput" runat="server" CssClass="autocomplete"></asp:TextBox>
          <label for="autocompleteinput">Search Book</label>
        </div>

           <div class="input-field col s4">
               <asp:Button runat="server" ID="btnSearchBook" Text="Submit" style="background:#ee6e73 !important" CssClass="btn" OnClick="btnSearchBook_Click"/>
             </div>
      </div>
               <div  class="row" id="divSearch" runat="server" visible="false">
            <div class="card" id="divSearchResult" runat="server">
                    <div class="card-content">
                         <span class="card-title">Search Result</span>
                        <asp:GridView runat="server" ID="gvSearchResult" AutoGenerateColumns="false">
                            <Columns>
                          <asp:TemplateField HeaderText="Select">
                            <ItemTemplate>
                                 <asp:CheckBox runat="server" ID="chkSelect" />
                            </ItemTemplate>
                        </asp:TemplateField>
                                <asp:BoundField DataField="BookId" HeaderText="BookId" />
                                <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                                 <asp:BoundField DataField="BookCategory" HeaderText="Book Category" />
                                 <asp:BoundField DataField="BookQty" HeaderText="Book Qty" />

                            </Columns>
                        </asp:GridView>
                       
                        </div>
                <div class="card-action" style="display:flex">
                      <div class="input-field col s5">
                            <asp:TextBox ID="txtReturnDate" runat="server" CssClass="datepicker" ></asp:TextBox>
                            <label for="txtReturnDate">Return date</label>
                        </div>
                    <div class="col s4">
                <asp:Button ID="btnSubmitSelected" runat="server" CssClass="btn" Text="Check Out" OnClick="btnSubmitSelected_Click" />
                        </div>
                    <div class="col s8">
                        <p runat="server" id="errorMsg" style="color:tomato"></p>
                    </div>
                    </div>
                </div>
                             
          </div>

        <div class="row">
            <div class="card">
                <div class="card-content">
                    <span class="card-title">CheckOut Books</span>
                        <asp:GridView runat="server" ID="gvCheckOut" AutoGenerateColumns="false">
                            <Columns>
                      
                                <asp:BoundField DataField="BookId" HeaderText="BookId" />
                                <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                                 <asp:BoundField DataField="LastUpdated" HeaderText="CheckOut On" />
                           

                            </Columns>
                        </asp:GridView>

                   

                </div>
            </div>

        </div>
       
       
    </div>
  </div>

             <ul id="tabs-swipe-demo" class="tabs" style="font-weight:500">
    <li class="tab col s3"><a href="#test-swipe-1">Issued Books</a></li>
    <li class="tab col s3"><a  href="#test-swipe-2">Return Books</a></li>
    <li class="tab col s3"><a class="active" href="#test-swipe-3">Available Books</a></li>
  </ul>
            <div id="test-swipe-1" class="col s12 blue">
                <div class="card">
                    <div class="card-content">
                        <span class="card-title">Issued Books</span>
                        <asp:GridView runat="server" ID="gvBooksIssued" AutoGenerateColumns="false">
                            <Columns>

                                <asp:BoundField DataField="BookId" HeaderText="BookId" />
                                <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                                <asp:BoundField DataField="IssuedOn" HeaderText="Issued On" />
                                <asp:BoundField DataField="ReturnDate" HeaderText="Expected Return Date" />

                            </Columns>
                        </asp:GridView>

                    </div>


                </div>
            </div>
          <div id="test-swipe-2" class="col s12 red">

          <div class="card">
                <div class="card-content">
                    <span class="card-title">Return Books</span>
                    <asp:GridView runat="server" ID="gvReturnBooks" AutoGenerateColumns="false">
                        <Columns>

                            <asp:BoundField DataField="IssueId" HeaderText="Issued Book Id" />
                            <asp:BoundField DataField="BookId" HeaderText="BookId" />
                            <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                            <asp:BoundField DataField="IssuedOn" HeaderText="Issued On" />
                            <asp:BoundField DataField="ReturnDateUpdated" HeaderText="Return Date" />
                        </Columns>
                    </asp:GridView>

                </div>


            </div>
  </div>
      <div id="test-swipe-3" class="col s12 green">
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


                <div class="card">
                <div class="card-content">
                    <span class="card-title">Notifications</span>

                     <form  class="col s12">
                    <div class="row">
                        <div class="input-field col s8">
                            <asp:TextBox runat="server" ID="txtTitle" CssClass="validate" ></asp:TextBox>
                            <label for="txtTitle">Title:</label>
                        </div>

                        <div class="input-field col s8">
                                <asp:TextBox runat="server" ID="txtDescription"  TextMode="MultiLine" Rows="5" class="materialize-textarea" ></asp:TextBox>
                                <label for="txtDescription">Description:</label>
                        </div>
                         <div class="input-field col s8">
                        <asp:Button runat="server" ID="btnSubmit" Text="Submit" style="background:#ee6e73 !important" CssClass="btn" OnClick="btnSubmit_Click" />
                             </div>
                        </div>
                         </form>
                    


                    <asp:GridView runat="server" ID="gvNotifications" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="Id" />
                            <asp:BoundField DataField="Title" HeaderText="Title" />
                            <asp:BoundField DataField="Description" HeaderText="Description" />
                            <asp:BoundField DataField="CommentsByLibrary" HeaderText="Reply from Library Manager" />

                        </Columns>
                    </asp:GridView>

                </div>


            </div>
        </div>



    </form>
 <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="js/materialize.min.js"></script>
    <script src="js/init.js"></script>

    <script>
        $(document).ready(function () {

            $('#slide-out li').click(function () {
               
                $('#slide-out li').removeClass('selected');
                $(this).addClass('selected');
            });

           
            $('ul.tabs').tabs('select_tab', 'tab_id');

            

            $("input.autocomplete").keypress(function()
            {
               books = $("#autocompleteinput").val();
               var dataBooks =  fn_AppendBookNames(books)
                $('input.autocomplete').autocomplete({
                    data: dataBooks,
                    limit: 20, // The max amount of results that can be shown at once. Default: Infinity.
                    onAutocomplete: function (val) {
                        // Callback function when value is autcompleted.
                    },
                    minLength: 1 // The minimum length of the input for the autocomplete to start. Default: 1.
                 
                });

            })
            

        });

      
       
        function fn_AppendBookNames(books) {
            var BindBook = [];
            let searchDataObj = {};
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "StudentManagement.aspx/BindBook",
                data: '{"bookName":"'+books+'"}',
                dataType: "json",
                async: false,
                success: function (data) {
                   
                    for (var i = 0; i < data.d.length; i++) {
                        searchDataObj[data.d[i]]=null;
                    }
                },
                error: function (result) {
                    alert("Something Went Wrong");
                }
            });
            return searchDataObj
        }

        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }

        $('.datepicker').pickadate({
            selectMonths: true, // Creates a dropdown to control month
            selectYears: 15, // Creates a dropdown of 15 years to control year,
            today: 'Today',
            clear: 'Clear',
            close: 'Ok',
            closeOnSelect: false // Close upon selecting a date,
        });

     

    </script>
</body>
</html>
