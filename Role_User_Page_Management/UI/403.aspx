<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="403.aspx.cs" Inherits="Role_User_Page_Management.UI._404" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="icon" href="../../images/favicon.ico" type="image/ico" />
    <title>Role_User_Page_Management | PageNotFound </title>

    <!-- Bootstrap -->
    <link href="../../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Font Awesome -->
    <link href="../../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <!-- NProgress -->
    <link href="../../vendors/nprogress/nprogress.css" rel="stylesheet"/>

    <!-- Custom Theme Style -->
    <link href="../../build/css/custom.min.css" rel="stylesheet"/>
  </head>
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <!-- page content -->
        <div class="col-md-12">
          <div class="col-middle">
            <div class="text-center text-center">
              <h1 class="error-number">403</h1>
              <h2>Access denied</h2>
              <p>Full authentication is required to access this resource. Thank you.
              </p>
              <div class="mid_center">
                
                <form id ="frm403" runat="server" >
                  <div class="col-xs-12 form-group">
                    <div >
<%--                      <input type="text" class="form-control" placeholder="Search for...">--%>
                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-success" Text="Back To Home" OnClick="btnBackOnClick" />
                     <%-- <span class="input-group-btn">
                              <button class="btn btn-default" type="button">Go!</button>
                          </span>--%>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="../../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../../vendors/nprogress/nprogress.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../../build/js/custom.min.js"></script>
  </body>
</html>
