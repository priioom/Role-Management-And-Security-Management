<%@ Page Language="C#" AutoEventWireup="true" Title="Role_User_Page_Management | User Registration" CodeBehind="Registration.aspx.cs" MasterPageFile="~/UI/Master/Home.Master" Inherits="Role_User_Page_Management.UI.UserManagement.Registration" %>

<asp:Content ID="hd" ContentPlaceHolderID="ContHead" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

    <style>
        .required {
            color: red;
        }

        .form-control-feedback {
            color: #2A3F54;
        }

        th {
            text-align: center;
        }

        .pre-scrollable {
            min-height: 450px;
        }
    </style>

    <script>

        function ValidateRegForm() {
            var $result = $("#result");
            var email = document.getElementById("<%=txtEmail.ClientID%>");
                var filter = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;
                if (!filter.test(email.value)) {
                    if (email == "") {
                        $result.text(" ");
                        email.focus;
                        return true;
                    }
                    else {
                        $result.text(email.value + " is not valid :(");
                        email.focus;
                        return false;
                    }
                }
                else {
                    $result.text(email.value + " is valid :(");
                    return true;

                }
            
            
             //var $email = $('form input[name="email'); //change form to id or containment selector
             //var re = /[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}/igm;
             //if ($email.val() == '' || !re.test($email.val())) {
             //    alert('Please enter a valid email address.');
             //    return false;
             //}

         }
        //$('input').on('focus', function (obj) { // disable autofill
        //    $('input').removeAttr('autocomplete');
        //    $(this).attr('autocomplete', 'new-password');
        //})
        function isNumberKey(evt, obj) {

            var charCode = (evt.which) ? evt.which : event.keyCode
            var value = obj.value;
            var dotcontains = value.indexOf(".") == -1;
            if (dotcontains)
                if (charCode == 46) return false;
            if (charCode == 46) return true;
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
    </script>
    <link href="../../vendors/fontawesome/css/font-awesome.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="bd" ContentPlaceHolderID="ContBody" runat="server">
    <form id="form1" runat="server" class="form-horizontal form-label-left" novalidate  autocomplete ="off">
          <input autocomplete="off" name="hidden" type="text" style="display:none;"/>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <%--page content--%>
                <div class="" role="main">
                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h3>User Registration</h3>
                            </div>


                        </div>
                        <br />
                        <br />
                        <div class="clearfix"></div>

                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Personal Info </h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>

                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">


                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group item">
                                            <input type="text" class="form-control has-feedback-left" id="txtFirstName" runat="server" required="required" placeholder="First Name" />

                                            <span class="fa fa-user form-control-feedback left " aria-hidden="true"></span>
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group item">
                                            <input type="text" class="form-control" id="txtLastName" required="required" runat="server" placeholder="Last Name" />
                                            <span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group item">
                                            <input type="text" class="form-control has-feedback-left" id="txtUserName" autocomplete="off" runat="server" required="required" placeholder="User Name" />

                                            <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group item " id="pass" runat="server">
                                            <input type="password" class="form-control" id="txtPassword" required="required" autocomplete="off" runat="server" placeholder="Password" />
                                            <span class="fa fa-key form-control-feedback right" aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group item">
                                            <input type="text" class="form-control has-feedback-left" id="txtEmail" runat="server" required="required" placeholder="Email" onkeyup ="return ValidateRegForm();" />

                                            <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>
                                        </div>
                                        <h2 id='result'></h2>

                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group item">
                                            <input type="text" class="form-control" id="txtEmpId" required="required" runat="server" placeholder="Employee Id" />
                                            <span class="fa fa-id-card form-control-feedback right" aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group item">
                                            <input type="text" class="form-control has-feedback-left" id="txtPhoneOff" onkeypress="return isNumberKey(event,this)" runat="server" required="required" placeholder="Phone Office" />

                                            <span class="fa fa-phone form-control-feedback left" aria-hidden="true"></span>
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group item">
                                            <input type="text" class="form-control" id="txtPhonePersonal" onkeypress="return isNumberKey(event,this)" required="required" runat="server" placeholder="Phone Personal" />
                                            <span class="fa fa-mobile form-control-feedback right" aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group item">
                                            <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control has-feedback-left">
                                                <asp:ListItem Text="Select A Role"></asp:ListItem>
                                            </asp:DropDownList>
                                            <span class="fa fa-tasks form-control-feedback left" aria-hidden="true"></span>
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group item">
                                            <asp:DropDownList ID="DDLBranch" runat="server" CssClass="form-control has-feedback-left">
                                                <asp:ListItem Text="Select A Branch"></asp:ListItem>
                                            </asp:DropDownList>
                                            <span class="fa fa-code-branch form-control-feedback left" aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group item">
                                            <asp:TextBox ID="txtPresentAddress" required="required" CssClass="form-control has-feedback-left" placeholder="Present Address" runat="server" TextMode="MultiLine"></asp:TextBox>

                                            <span class="fa fa-home form-control-feedback left" aria-hidden="true"></span>
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group item">
                                            <asp:TextBox ID="txtPermanentAdress" required="required" CssClass="form-control has-feedback-left " placeholder="Permanent Address" runat="server" TextMode="MultiLine"></asp:TextBox>
                                            <span class="form-control-feedback fa fa-home left" aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="clearfix"></div>
                                        </div>


                                        <div class="ln_solid"></div>
                                        <div class="form-group ">
                                            <div class="col-md-6 ">
                                                <button type="button" id="btnSave" runat="server" class="btn btn-success" autoeventwireup="false" onserverclick="BtnSaveOnClick">Save</button>
                                                <button id="btnRefresh" runat="server" type="button" class="btn btn-primary" onserverclick="BtnRefreshOnClick">Refresh</button>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <br />

                                <div class="page-title">
                                    <div class="title_left">
                                        <h3>User Information</h3>
                                    </div>


                                </div>
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Personal Info </h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>

                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content pre-scrollable">
                                        <asp:Label ID="lblMsg" runat="server"></asp:Label>
                                        <asp:GridView ID="gvRegInfo" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover jambo_table bulk_action"
                                            AutoGenerateColumns="False" DataKeyNames="UserId" OnPageIndexChanging="GvRegInfo_PageIndexChanging" OnSelectedIndexChanged="GvRegInfo_OnSelectedIndexChanged"
                                            AllowPaging="True" OnRowDeleting="GvRegInfo_OnRowDeleting">
                                            <HeaderStyle CssClass="headerStyle" HorizontalAlign="Center" ForeColor="White" BackColor="#3F5367"></HeaderStyle>
                                            <RowStyle CssClass="even pointer" HorizontalAlign="Center" BackColor="#E9F4F2"></RowStyle>
                                            <Columns>
                                                <asp:BoundField DataField="UserId" HeaderText="User Id">
                                                    <ItemStyle CssClass="hidden" />
                                                    <HeaderStyle CssClass="hidden" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="FirstName" ItemStyle-HorizontalAlign="Center" HeaderText="First Name"></asp:BoundField>
                                                <asp:BoundField DataField="LastName" ItemStyle-HorizontalAlign="Center" HeaderText="Last Name" />
                                                <asp:BoundField DataField="UserName" ItemStyle-HorizontalAlign="Center" HeaderText="User Name"></asp:BoundField>
                                                <asp:BoundField DataField="Password" ItemStyle-HorizontalAlign="Center" HeaderText="Password">
                                                     <ItemStyle CssClass="hidden" />
                                                    <HeaderStyle CssClass="hidden" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="PhoneOffice" ItemStyle-HorizontalAlign="Center" HeaderText="Phone Office" />
                                                <asp:BoundField DataField="PhonePersonal" ItemStyle-HorizontalAlign="Center" HeaderText="Phone Personal"></asp:BoundField>
                                                <asp:BoundField DataField="Email" ItemStyle-HorizontalAlign="Center" HeaderText="Email" />
                                                <asp:BoundField DataField="EmpId" ItemStyle-HorizontalAlign="Center" HeaderText="Employee Id">
                                                    <ItemStyle CssClass="hidden" />
                                                    <HeaderStyle CssClass="hidden" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="PresentAddress" ItemStyle-HorizontalAlign="Center" HeaderText="Present Address" />
                                                <asp:BoundField DataField="ParmanentAddress" ItemStyle-HorizontalAlign="Center" HeaderText="Parmanent Address"></asp:BoundField>
                                                <asp:BoundField DataField="RoleId" ItemStyle-HorizontalAlign="Center" HeaderText="Role Id">
                                                    <ItemStyle CssClass="hidden" />
                                                    <HeaderStyle CssClass="hidden" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="RoleName" ItemStyle-HorizontalAlign="Center" HeaderText="Role Name"></asp:BoundField>
                                                <asp:BoundField DataField="BranchId" ItemStyle-HorizontalAlign="Center" HeaderText="Branch Id">
                                                    <ItemStyle CssClass="hidden" />
                                                    <HeaderStyle CssClass="hidden" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="BranchName" ItemStyle-HorizontalAlign="Center" HeaderText="Branch Name"></asp:BoundField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Delete">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="ButtonDelete" runat="server" CausesValidation="False" CommandName="Delete"><img src="../../images/delete.png" /></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:CommandField HeaderText="Edit" ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/images/Edit.png" ItemStyle-Height="5px" ItemStyle-HorizontalAlign="Center"></asp:CommandField>
                                            </Columns>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <SelectedRowStyle BackColor="#CFF0E9" Font-Bold="True" ForeColor="#333333" BorderColor="#1ABC9C" />
                                            <HeaderStyle BackColor="#3F5367" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                            <EditRowStyle BackColor="#2461BF" />
                                            <AlternatingRowStyle BackColor="white" />
                                            <PagerStyle HorizontalAlign="Left" ForeColor="#3F5367" CssClass="gvPagers pad" />
                                            <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="First" LastPageText="Last" />
                                        </asp:GridView>
                                        <asp:HiddenField ID="HdnUserID" runat="server" />
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
<%--<script src="../../vendors/jquery/dist/jquery.min.js"></script>--%>
