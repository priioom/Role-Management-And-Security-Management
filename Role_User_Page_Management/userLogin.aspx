<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userLogin.aspx.cs" Inherits="Role_User_Page_Management.userLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
        
    <title>Role_User_Page_Management! | Login </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet"/>
    <!-- Animate.css -->
    <link href="../vendors/animate.css/animate.min.css" rel="stylesheet"/>

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet"/>
</head>
<body class="login">
       <div>
<%--      <a class="hiddenanchor" id="signup"></a>--%>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form id="form1" runat="server">
              <h1>Login Form</h1>
              <div class="col-md-12">
                <input type="text" class="form-control" id="USName" runat="server" placeholder="Username" autocomplete="off" required="" />
              </div>
              <div class="col-md-12">
                <input type="password" class="form-control" id="USPass" runat="server" placeholder="Password" autocomplete="off" required="" />
              </div>
                <asp:Label ID ="logFailed" runat="server" style="margin-left:0px;padding-left:0px; text-align:left;color:red;background-color:#F7F7F7;"></asp:Label>
              <div class="col-md-12" >
                  <div class="col-md-6" style="margin-left:0px;padding-left:0px; text-align:left;">
<%--                      <a  onclick="loginOnclick">Log in</a>--%>
                      <%--<asp:Button class="btn btn-default submit" ID="login" runat="server" />--%>
                      
                      <asp:Button ID="btnlog" CssClass="btn btn-default submit" runat="server" Text="Log in" OnClick="LoginOnclick"/>
                  </div>
                  <div class="col-md-6 " style="margin-right:0px;padding-right:0px; text-align:right;">
                      <a class="reset_pass" href="#"  style="margin-right:0px;padding-right:0px" id="reset" runat="server">Lost your password?</a>
                      
                  </div>
                
             
              </div>

              <div class="clearfix"></div>

              <div class="separator">
               <%-- <p class="change_link">New to site?
                  <a href="#signup" class="to_register"> Create Account </a>
                </p>--%>

                <div class="clearfix"></div>
                <br />

              <div>
                  <p>&copy; All Rights Reserved by Priom Sarkar || 2019</p>
                </div>
              </div>
            </form>
          </section>
        </div>


      </div>
    </div>
</body>
</html>
