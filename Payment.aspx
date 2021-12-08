<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="LibraryManagementSystem.Payment" %>

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
        <div class="container">
     <div class="col l9">
            <div class="card">
                <div id="divMsg" runat="server" class="card" style="padding: 10px; font-size: 18px; background: rgba(139, 195, 74, 0.98); color: #fff;" visible="false">
           
        </div>
                <div class="card-content">
                    <span class="card-title">Pay your Penalty Here.</span>
                          <asp:GridView runat="server" ID="gvPenaltyBooks" CssClass="" AutoGenerateColumns="false" >
                              <Columns>
                                  <asp:BoundField DataField="StudentId" HeaderText="Student Id" />
                                  <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                                  <asp:BoundField DataField="TotalAmount" HeaderText="Total Peanlty" />
                                  
                              </Columns>
                              
                        </asp:GridView>

                    </div>
                </div>

        <p> Total Penalty :  <asp:TextBox runat="server" ID="txtPenalty" ReadOnly="true" style="font-weight:bold;font-size:large"></asp:TextBox> </p>
          <p> Enter your Amount :  <asp:TextBox runat="server" ID="txtStudentAmount" TextMode="Number"  style="font-weight:bold;font-size:large"></asp:TextBox> </p>
         <asp:Button runat="server" ID="btnPenalty" CssClass="btn" Text="Pay Penalty" OnClick="btnPenalty_Click" />

         </div>
</div>


    </form>
</body>
</html>
