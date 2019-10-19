<%@ Page Language="C#" AutoEventWireup="true" Title="Role_User_Page_Management | CreateRole" CodeBehind="CreateRole.aspx.cs"  MasterPageFile="~/UI/Master/Home.Master" Inherits="Role_User_Page_Management.UI.Security.Create_Role" %>

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
</asp:Content>
<asp:Content ID="bd" ContentPlaceHolderID="ContBody" runat="server">
   <form class="form-horizontal form-label-left" novalidate="novalidate" id="frmCreateRole" runat="server">
               <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
       <div class="col-md-12 col-sm-12 col-xs-12" style="margin:0;padding:0;">
           <div class="col-md-5 col-sm-5-col-xs-12" style="margin-left:0;padding-left:0;">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="page-title">
                    <div class="title_left">
                        <h4>Create New Role</h4>
                    </div>

                    
                </div>
                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_content">


                            <%--<span class="section">Page Info</span>--%>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="txtName" style="font-size: 12px;">
                                    Role Name <span class="required">*</span>
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <asp:TextBox ID="txtName" CssClass="form-control col-md-7 col-xs-12" data-validate-length-range="100" placeholder="Page Name" required="required" runat="server" TabIndex="0"></asp:TextBox>
                                </div>
                                <div class="col-md-3"></div>
                            </div>
                         
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textdesc" style="font-size: 12px;">
                                    Description<span class="required">*</span>
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <asp:TextBox ID="textdesc" CssClass="form-control col-md-7 col-xs-12"  data-validate-length-range="200" placeholder="Description" required="required" runat="server" TabIndex="3"></asp:TextBox>
                                </div>
                                <div class="col-md-3"></div>
                            </div>
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-12 "><%----%>
                                    <button type="button" id="btnSave" runat="server" class="btn btn-success"  autoeventwireup="false" onserverclick="BtnSaveOnClick">Save</button>
                                    <button id="btnRefresh" runat="server" type="button" class="btn btn-primary" onserverclick="BtnRefreshOnClick">Refresh</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
               </div>
        <div class="col-md-7 col-sm-7 col-xs-12" style="margin-right:0;padding-right:0;">
        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-right:0;padding-right:0;">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Role Info</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>

                <div class="x_content">



                 <%--   <div class="table-responsive">
                        <asp:Label runat="server" ID="lblMsg"></asp:Label>--%>
                 


                    <%--OnRowDeleting="GvRoleInfoOnRowDeleting"    OnSelectedIndexChanged="GvPInfo_SelectedIndexChanged"--%>

                         <asp:Label ID="lblMsg" runat="server"></asp:Label>
                        <asp:GridView ID="gvRoleInfo" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover jambo_table bulk_action"
                            AutoGenerateColumns="False" DataKeyNames="RoleId" 
                            AllowPaging="True" OnPageIndexChanging="GvRoleInfo_PageIndexChanging" OnSelectedIndexChanged="GvRoleInfo_SelectedIndexChanged"
                            OnRowDeleting="GvRoleInfoOnRowDeleting"
                            >
                            <HeaderStyle CssClass="headerStyle" HorizontalAlign="Center" ForeColor="White" BackColor="#3F5367"></HeaderStyle>
                            <RowStyle CssClass="even pointer" HorizontalAlign="Center" BackColor="#E9F4F2"></RowStyle>
                            <Columns>
                                <asp:BoundField DataField="RoleId" HeaderText="Role Id">
                                    <ItemStyle CssClass="hidden" />
                                    <HeaderStyle CssClass="hidden" />
                                </asp:BoundField>
                                <asp:BoundField DataField="RoleName" ItemStyle-HorizontalAlign="Center" HeaderText="Role Name"></asp:BoundField>
                                <asp:BoundField DataField="Description" ItemStyle-HorizontalAlign="Center" HeaderText="Description" />
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
                      <asp:HiddenField ID="HdnRoleID" runat="server" />
                         <%-- <asp:HiddenField ID="HdnModuleId" runat="server" />--%>
               
                    </div>


                </div>
            </div>
            </div>
           
                
        </div>
</ContentTemplate>
                            </asp:UpdatePanel>

                <%--============================================Modal Starter========================================--%>


<!-- Modal -->


                 
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
</asp:Content>