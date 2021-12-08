<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" EnableEventValidation="false" Inherits="LibraryManagementSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Parallax Template - Materialize</title>

    <!-- CSS  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="white" role="navigation">
            <div class="nav-wrapper container">
                <a id="logo-container" href="#" class="brand-logo">Library Management System</a>
                <ul class="right hide-on-med-and-down">
                    <li><asp:Button runat="server" ID="btnStudentRegistration" CssClass="btn" Text="Student Registration" OnClick="btnStudentRegistration_Click" UseSubmitBehavior="false" /> </li>
                </ul>

                <ul id="nav-mobile" class="side-nav">
                    <li><a href="#">Navbar Link</a></li>
                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
        </nav>

        <div class="row" id="idRegistrationForm" runat="server" visible="false">
            <div class="col l4 m4 s12" style="position: absolute; margin-left: 66%; z-index: 1;">
                <div class="card z-depth-5">
                    <div class="card-content">
                        <span style="background: #00BCD4 !important; color: #fff; padding: 10px; font-weight: 400;" class="card-title">Registration</span>
                        <div class="row">
                            <form class="col s12">
                                <div id="divCources" class="row">
                                    <div class="col s12">
                                        <label for="ddlUniversityId">University Id</label>
                                        <asp:DropDownList AutoPostBack="true" ID="ddlUnuiversityId" runat="server" OnSelectedIndexChanged="ddlUnuiversityId_SelectedIndexChanged" Style="display: block; margin-bottom: 2%">
                                          
                                        </asp:DropDownList>

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="input-field col s12">
                                        <asp:TextBox runat="server" ID="txtName" CssClass="validate" disabled ></asp:TextBox>
                                        <label class="active" for="txtName">Student Name</label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="input-field col s12">
                                       <asp:TextBox runat="server" CssClass="validate" ID="txtEmail"></asp:TextBox>
                                        <label class="active" for="txtEmail">Email</label>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="input-field col s12">
                                        <asp:TextBox runat="server" TextMode="Password" CssClass="validate" ID="txtPassword"></asp:TextBox>
                                        <label for="password">
                                            Password</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                      <asp:TextBox runat="server" TextMode="Password" CssClass="validate" ID="txtConfPassword"></asp:TextBox>
                                        <label for="password">
                                            Conform Password</label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="input-field col s12">
                                      <asp:TextBox runat="server" ID="txtAddress" Rows="4" CssClass="validate"></asp:TextBox>
                                        <label for="txtAddress">
                                           Address</label>
                                    </div>
                                </div>

                               


                            </form>
                        </div>
                    </div>
                    <div class="card-action">
                        <div class="row">
                            <div class="col s12">
                                
                                 <asp:Button runat="server" ID="btnRegister" Text="Register" CssClass="btn" OnClick="btnRegister_Click" UseSubmitBehavior="false" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="index-banner" class="parallax-container">
            <div class="section no-pad-bot">
                <div class="container">
                    <br>
                    <br>
                    <h3 style="color: rgba(0, 0, 0, 0.56)!important" class="header center teal-text text-lighten-2">Get your Books Here...</h3>
                    <div class="row center">
                        <h5 style="color: rgba(0, 0, 0, 0.7)" class="header col s12 light">We provide lot of books in different categories in large quantity.</h5>
                    </div>

                    <br>
                    <br>
                </div>
            </div>
            <div class="parallax">
                <img src="img/background1.jpg" alt="Unsplashed background img 1">
            </div>
        </div>


        <div class="">
            <div class="section">

                <!--   Icon Section   -->
                <div class="row">
                    <div class="col s12 m4">
                        <div class="icon-block">
                            <h2 class="center brown-text"><i class="material-icons">info</i></h2>
                            <h5 class="center">Student Registration</h5>

                            <p class="light">Students need to register before they going to take books from library. They need to provide correct inputs while filling registration form</p>
                        </div>
                    </div>

                    <div class="col s12 m4" style="margin-top: -8%">
                        <div class="card">
                            <div id="divMsg" runat="server" class="card" style="padding: 10px; font-size: 18px; background: tomato; color: #fff;" visible="false">
                                Invalid Credentials 
                            </div>

                            <div class="card-content">
                                <span style="background: #00BCD4 !important; color: #fff; padding: 10px; font-weight: 400;" class="card-title">Log In</span>
                                <div class="row">
                                    <form class="col s12">
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <asp:TextBox runat="server" ID="txtUniversityId" CssClass="validate" onkeypress="return isNumber(event)" MaxLength="10"></asp:TextBox>
                                                <label for="first_name">
                                                    University Id#</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <asp:TextBox runat="server" ID="txtLoginPassword" CssClass="validate" TextMode="Password"></asp:TextBox>
                                                <label for="password">
                                                    Password</label>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="card-action">
                                <div class="row">
                                    <div class="col s12">
                                        <asp:Button runat="server" ID="btnLogin" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col s12 m4">
                        <div class="icon-block">
                            <h2 class="center brown-text"><i class="material-icons">alarm_on</i></h2>
                            <h5 class="center">Return books on time</h5>

                            <p class="light">Please return the books on time. Incase fine will be filled on the required book with two times the cost of book.</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>


        <div class="parallax-container valign-wrapper">
            <div class="section no-pad-bot">
                <div class="container">
                    <div class="row center">
                        <h5 class="header col s12 light">We have provided large quantity of books in good quality with latest updated versions.</h5>
                    </div>
                </div>
            </div>
            <div class="parallax">
                <img src="img/background2.jpg" alt="Unsplashed background img 2">
            </div>
        </div>

        <div class="container">
            <div class="section">

                <div class="row">
                    <div class="col s12">
                        <h3><i class="mdi-content-send brown-text"></i></h3>
                        <h4>Contact Us</h4>
                        <p class="left-align light">
                            As library is near to cafteria you can contact the librarian for any quires or you can mail your query to below contact Details .

                        </p>
                        <div class="col s6">
                            <ul class="collection">
                                <li class="collection-item"><i class="material-icons">email</i> Nitin@gmail.com</li>
                                <li class="collection-item"><i class="material-icons">contact_phone</i> +91 080-978-7828</li>

                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </div>


        <div class="parallax-container valign-wrapper">
            <div class="section no-pad-bot">
                <div class="container">
                    <div class="row center">
                        <h5 class="header col s12 light">The library is the temple of learning, and learning has liberated more people than all the wars in history.</h5>
                    </div>
                </div>
            </div>
            <div class="parallax">
                <img src="img/background3.jpg" alt="Unsplashed background img 3">
            </div>
        </div>

        <footer class="page-footer teal">
            <div class="container">
                <div class="row">
                    <div class="col l10 s12">
                        <h5 class="white-text">Library Management System</h5>
                        <p class="grey-text text-lighten-4">Online system we provided to track the books issued by the librarian and store the books in maintained quality provied with different category in updated versions.</p>

                    </div>

                </div>
            </div>
            <div class="footer-copyright">
                <div class="container">
                    Made by Nitin  @2017
                </div>
            </div>
        </footer>


        <!--  Scripts-->
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="js/materialize.js"></script>
        <script src="js/init.js"></script>

        <script>
            function isNumber(evt) {
                evt = (evt) ? evt : window.event;
                var charCode = (evt.which) ? evt.which : evt.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
                return true;
            }
        </script>
    </form>
</body>
</html>
