<%@ Page Language="C#" AutoEventWireup="true" Title="Role_User_Page_Management | Change PassWord" CodeBehind="ChangePassWord.aspx.cs" MasterPageFile="~/UI/Master/Home.Master" Inherits="Role_User_Page_Management.UI.UserManagement.ChangePassWord" %>

<asp:Content ID="hd" ContentPlaceHolderID="ContHead" runat="server">
    <style>
        .border {
            border: 0px;
            box-shadow: none;
        }
    </style>
</asp:Content>
<asp:Content ID="bd" ContentPlaceHolderID="ContBody" runat="server">
    <form id="form1" runat="server" class="form-horizontal form-label-left" novalidate>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="" role="main">
                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h3>Change Password
                                </h3>
                            </div>


                        </div>
                        <br />
                        <br />
                        <div class="clearfix"></div>

                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Change </h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>

                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">


                                        <div class="col-md-3 col-sm-3 col-xs-12 form-group item">
                                            <asp:Label ID="lblUser" runat="server" CssClass="form-control border has-feedback-left">
                                        <%--<asp:ListItem Text="Select An User"></asp:ListItem>--%>
                                            </asp:Label>
                                            <span class="fa fa-user  form-control-feedback left" aria-hidden="true"></span>
                                        </div>

                                        <div class="col-md-3 col-sm-3 col-xs-12 form-group item">
                                            <input type="password" class="form-control  has-feedback-left" id="txtCurrPassword" required="required" runat="server" placeholder="Current Password" />
                                            <span class="fa fa-key form-control-feedback left" aria-hidden="true"></span>
                                        </div>

                                        <div class="col-md-3 col-sm-3 col-xs-12 form-group item">
                                            <input type="password" class="form-control  has-feedback-left" id="txtNewPassword" required="required" runat="server" placeholder="New Password" />
                                            <span class="fa fa-key form-control-feedback left" aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-12 form-group item">
                                            <input type="password" class="form-control  has-feedback-left" id="txtConPassword" required="required" runat="server" placeholder="Confirm Password" />
                                            <span class="fa fa-key form-control-feedback left" aria-hidden="true"></span>
                                        </div>
                                        <%--  onserverclick="BtnRefreshOnClick" onserverclick="BtnSaveOnClick"--%>
                                        <br />
                                        <br />
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="ln_solid"></div>
                                        <div class="form-group ">
                                            <div class="col-md-6 ">
                                                <button type="button" id="btnSave" runat="server" class="btn btn-success" autoeventwireup="false" onserverclick="BtnChangeOnClick">Change</button>
                                                <button id="btnRefresh" runat="server" type="button" class="btn btn-primary" onserverclick="BtnRefreshOnClick">Refresh</button>

                                            </div>
                                        </div>

                                    </div>
                                </div>


                                <div class="x_panel" id="Reset" runat="server">
                                    <div class="x_title">
                                        <h2>Reset</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>

                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">


                                        <div class="col-md-4 col-sm-4 col-xs-12 form-group item">
                                            <asp:DropDownList ID="ddlUser" runat="server" CssClass="form-control  has-feedback-left">
                                                <asp:ListItem Text="Select An User"></asp:ListItem>
                                            </asp:DropDownList>
                                            <span class="fa fa-user  form-control-feedback left" aria-hidden="true"></span>
                                        </div>

                                        <div class="col-md-4 col-sm-4 col-xs-12 form-group item">
                                            <input type="password" class="form-control  has-feedback-left" id="txtRNewPassword" required="required" runat="server" placeholder="New Password" />
                                            <span class="fa fa-key form-control-feedback left" aria-hidden="true"></span>
                                        </div>

                                        <div class="col-md-4 col-sm-4 col-xs-12 form-group item">
                                            <input type="password" class="form-control  has-feedback-left" id="txtRConPassword" required="required" runat="server" placeholder="Confirm Password" />
                                            <span class="fa fa-key form-control-feedback left" aria-hidden="true"></span>
                                        </div>

                                        <%--  onserverclick="BtnSaveOnClick"--%>
                                        <br />
                                        <br />
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="ln_solid"></div>
                                        <div class="form-group ">
                                            <div class="col-md-6 ">
                                                <button type="button" id="btnReset" runat="server" class="btn btn-success" autoeventwireup="false" onserverclick="BtnResetOnClick">Save</button>
                                                <button id="Button2" runat="server" type="button" class="btn btn-primary" onserverclick="BtnRefreshOnClick">Refresh</button>

                                            </div>
                                        </div>

                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>



            </ContentTemplate>
        </asp:UpdatePanel>
        <!-- jQuery -->
        <script src="../vendors/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap -->
        <!-- FastClick -->
        <%--<script src="../../vendors/fastclick/lib/fastclick.js"></script>--%>
        <!-- NProgress -->
        <!-- NProgress -->
        <%--<script src="../vendors/nprogress/nprogress.js"></script>--%>
        <!-- validator -->
        <script src="../../vendors/validator/validator.js"></script>
        <script src="../vendors/iCheck/icheck.min.js"></script>


        <!-- Custom Theme Scripts -->
        <%--   <script src="../../build/js/custom.min.js"></script>--%>
    </form>
</asp:Content>
