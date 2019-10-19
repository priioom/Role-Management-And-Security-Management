<%@ Page Language="C#" AutoEventWireup="true" Title="Role_User_Page_Management | CreatePage" CodeBehind="CreatePage.aspx.cs" MasterPageFile="~/UI/Master/Home.Master" Inherits="Role_User_Page_Management.UI.Security.Create_Page" %>

<asp:Content ID="hd" ContentPlaceHolderID="ContHead" runat="server">
    <style>
        .required {
            color: red;
        }

        th {
            text-align: center;
        }

        #ContBody_gvPInfo > tbody > tr.gvPagers.pad > td > table > tbody > tr > td {
            padding: 10px;
        }

        .btnActive {
            color: #333 !important;
            background-color: #fff !important;
            border-color: #ccc !important;
        }

            .btnActive.active {
                color: #fff !important;
                background-color: #337ab7 !important;
                border-color: #2e6da4 !important;
            }
        .color {
        color: #fff !important;
                background-color: #337ab7 !important;
                border-color: #2e6da4 !important;
        }
        .hplstyle {
        color:blue;
        text-decoration:underline;
        }
          .fade {
            opacity: 0;
            -webkit-transition: none;
            -o-transition: none;
            transition: none;
        }
         
    </style>
    <script>
        function hideModal() {

            $('.modal-backdrop.in').remove();
        }
        function dismissModal() {
            ('#myModal').modal('hide');
        }
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
</asp:Content>
<asp:Content ID="bd" ContentPlaceHolderID="ContBody" runat="server">
    <form class="form-horizontal form-label-left" novalidate="novalidate" id="frmCreatePage" runat="server">
               <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="page-title">
                    <div class="title_left">
                        <h3>Create New Page</h3>
                    </div>

                    <div class="title_right">
                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search for..." />
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">Go!</button>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_content">


                            <span class="section">Page Info</span>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="txtName">
                                    Page Name <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <asp:TextBox ID="txtName" CssClass="form-control col-md-7 col-xs-12" data-validate-length-range="100" placeholder="Page Name" required="required" runat="server" TabIndex="0"></asp:TextBox>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="txtURL">
                                    Page URL <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">

                                    <asp:TextBox ID="txtURL" CssClass="form-control col-md-7 col-xs-12" data-validate-length-range="200" placeholder="../../UI/SomeFolder/Something.aspx" required="required" runat="server" TabIndex="1"></asp:TextBox>

                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="ddlModule">
                                    Module <span class="required">*</span><br />
                                    
                                </label>
                                 
                                <div class="col-md-6 col-sm-6 col-xs-12">

                                    <asp:DropDownList ID="ddlModule" required="required" CssClass="form-control col-md-7 col-xs-12" runat="server" TabIndex="2" AutoPostBack="true" OnSelectedIndexChanged="DdlModulSelectedIndexChanged" AppendDataBoundItems="true">
                                      
                                    </asp:DropDownList>
                                   <asp:HyperLink ID="HplAddnewModule" data-toggle="modal" data-target="#myModal" CssClass="hplstyle" runat="server">( Add New Module )</asp:HyperLink>
                                </div>
                                
                               
                            </div>



                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textdesc">
                                    Description <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <asp:TextBox ID="textdesc" CssClass="form-control col-md-7 col-xs-12" data-validate-length-range="200" placeholder="Description" required="required" runat="server" TabIndex="3"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">IsActive <span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div id="IsActive" class="btn-group" data-toggle="buttons" runat="server">
                                        <label class="btn btn-default btnActive" id="lvlrbl1" runat="server"  data-toggle-class="btn-primary" data-toggle-passive-class="btn-default" tabindex="4">
                                            <input type="radio" id="Rdbutton1" runat="server" value="1"  />
                                            YES 
                                        </label>
                                        <label class="btn btn-primary btnActive" id="lvlrbl2" runat="server" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default" tabindex="5">
                                            <input type="radio" id="Rdbutton2" runat="server" value="0" />
                                            NO &nbsp;
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-3">
                                    <button type="button" id="btnSave" runat="server" class="btn btn-success" onserverclick="BtnSaveOnClick" autoeventwireup="false">Save</button>
                                    <button id="btnRefresh" runat="server" type="button" class="btn btn-primary" onserverclick="BtnRefreshOnClick">Refresh</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Page Info</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>

                <div class="x_content">



                    <div class="table-responsive">
                        <asp:Label runat="server" ID="lblMsg"></asp:Label>
                 



                        <%-- OnPageIndexChanging="gvRole_PageIndexChanging" OnRowDataBound="gvRole_RowDataBound"--%>

                        <asp:GridView ID="gvPInfo" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover jambo_table bulk_action"
                            AutoGenerateColumns="False" DataKeyNames="PageId" OnRowDeleting="GvPInfoOnRowDeleting"
                            AllowPaging="True" OnPageIndexChanging="GvPInfo_PageIndexChanging" OnSelectedIndexChanged="GvPInfo_SelectedIndexChanged">
                            <HeaderStyle CssClass="headerStyle" HorizontalAlign="Center" ForeColor="White" BackColor="#3F5367"></HeaderStyle>
                            <RowStyle CssClass="even pointer" HorizontalAlign="Center" BackColor="#E9F4F2"></RowStyle>
                            <Columns>
                                <asp:BoundField DataField="PageId" HeaderText="Page Id">
                                    <ItemStyle CssClass="hidden" />
                                    <HeaderStyle CssClass="hidden" />
                                </asp:BoundField>
                                <asp:BoundField DataField="PageName" ItemStyle-HorizontalAlign="Center" HeaderText="Page Name"></asp:BoundField>
                                <asp:BoundField DataField="URL" ItemStyle-HorizontalAlign="Center" HeaderText="URL" />
                                <asp:BoundField DataField="Description" ItemStyle-HorizontalAlign="Center" HeaderText="Description" />
                                <asp:BoundField DataField="ModuleId" ItemStyle-HorizontalAlign="Center" HeaderText="Module Id">
                                    <ItemStyle CssClass="hidden" />
                                    <HeaderStyle CssClass="hidden" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ModuleName" ItemStyle-HorizontalAlign="Center" HeaderText="Module Name" />
                                <asp:BoundField DataField="IsActive" ItemStyle-HorizontalAlign="Center" HeaderText="Active" />
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="ButtonDelete" runat="server" CausesValidation="False" CommandName="Delete"  ><img src="../../images/delete.png" /></asp:LinkButton>
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
                        <asp:HiddenField ID="HdnPageId" runat="server" />
                        <asp:HiddenField ID="HdnModuleId" runat="server" />
               
                    </div>


                </div>
            </div>
        </div>
</ContentTemplate>
                            </asp:UpdatePanel>

                <%--============================================Modal Starter========================================--%>


<!-- Modal -->
                <div class="clearfix"></div>

 <div class="modal fade"  id="myModal" tabindex="-1"  role="dialog"  aria-labelledby="myModalLabel">

  <div class="modal-dialog" role="document" >
              <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
               <div class="x_title">
                    <h2>Create New Module</h2>
                   <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
      <%--     <li><a type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">X</span></a></li>--%>
                       <li><a class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-close"></i></span></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>

                <div class="x_content">
                       
   <%--   <div class="modal-header">
           
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Create New Module</h4>
         
      </div>--%>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>                
      <div class="modal-body">
                  <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="txtMdlName">
                                    Module Name <span class="required">*</span>
                                </label>
                                <div class="col-md-9 col-sm-6 col-xs-12">
                                    <asp:TextBox ID="txtMdlName" CssClass="form-control col-md-7 col-xs-12" data-validate-length-range="100" placeholder="Module Name" required="required" runat="server" ></asp:TextBox>
                                </div>
                      <div class="col-md-3"></div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="txtMdlURl">
                                    Module URL
                                </label>
                                <div class="col-md-9 col-sm-6 col-xs-12">

                                    <asp:TextBox ID="txtMdlURl" CssClass="form-control col-md-7 col-xs-12" data-validate-length-range="200" placeholder="../../UI/SomeFolder/Something.aspx" runat="server" ></asp:TextBox>

                                </div>
                                <div class="col-md-3"></div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="txtModuleIco">
                                    Module Icon<span class="required">*</span>
                                </label>
                                <div class="col-md-9 col-sm-6 col-xs-12">

                                    <asp:TextBox ID="txtModuleIco" CssClass="form-control col-md-7 col-xs-12" data-validate-length-range="100" placeholder="fa fa-something" runat="server" required="required"></asp:TextBox>

                                </div>
                               <div class="col-md-3"></div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="txtParentModule">
                                  Parent Module Id
                                </label>
                                <div class="col-md-9 col-sm-6 col-xs-12">
                                    <%--<asp:TextBox ID="txtParentModule" CssClass="form-control col-md-7 col-xs-12"    data-validate-length-range="3" placeholder="Parent Module id"  runat="server" ></asp:TextBox>--%>
                                    <asp:DropDownList ID="ddlParentModule" CssClass="form-control col-md-7 col-xs-12" runat="server"  AutoPostBack="true" >
                                      
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-3"></div>
                            </div>


                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="txtPriority">
                                    Priority <span class="required">*</span>
                                </label>
                                <div class="col-md-9 col-sm-6 col-xs-12">
                                    <asp:TextBox ID="txtPriority" CssClass="form-control col-md-7 col-xs-12" onkeypress="return isNumberKey(event,this)" data-validate-length-range="200" placeholder="Priority" required="required" runat="server" ></asp:TextBox>
                                </div>
                                <div class="col-md-3"></div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">IsActive <span class="required">*</span></label>
                                <div class="col-md-9 col-sm-6 col-xs-12">
                                    <div id="divRdbIsActive" class="btn-group" data-toggle="buttons" runat="server">
                                        <label class="btn btn-default btnActive" id="lblYes" runat="server" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default" >
                                            <input type="radio" id="rdbYes" runat="server" value="1" />
                                            YES 
                                        </label>
                                        <label class="btn btn-primary btnActive" id="lblNo" runat="server" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default" >
                                            <input type="radio" id="rdbNo" runat="server" value="0" />
                                            NO &nbsp;
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-3"></div>
                            </div>
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-3">
                                    <button type="button" id="btnModuleSave" runat="server" class="btn btn-success" onserverclick="BtnModuleSaveOnClick" autoeventwireup="false">Save</button>
                                    <button id="btnModuleRefresh" runat="server" type="button" class="btn btn-primary" onserverclick="BtnModuleRefreshOnClick">Refresh</button>
                                </div>
                            </div>
      </div>
    </ContentTemplate>
                            </asp:UpdatePanel>
                </div>
            
            </div>
  
  </div>
            

        </div>
</div>

                 
    </form>
    <!-- jQuery -->
    <script src="../../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <!-- FastClick -->
    <%--<script src="../../vendors/fastclick/lib/fastclick.js"></script>--%>
    <!-- NProgress -->

    <!-- validator -->
    <script src="../../vendors/validator/validator.js"></script>
    <script src="../vendors/iCheck/icheck.min.js"></script>
    <!-- Custom Theme Scripts -->
    <%--   <script src="../../build/js/custom.min.js"></script>--%>
</asp:Content>
