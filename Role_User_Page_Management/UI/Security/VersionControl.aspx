<%@ Page Language="C#" AutoEventWireup="true" Title="Role_User_Page_Management | VersionControl" CodeBehind="VersionControl.aspx.cs" MasterPageFile="~/UI/Master/Home.Master" Inherits="Role_User_Page_Management.UI.Security.VersionControl" %>

<asp:Content ID="hd" ContentPlaceHolderID="ContHead" runat="server">
    <!-- Font Awesome -->
    <link href="../../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />

    <%--    <!-- bootstrap-daterangepicker -->
    <link href="../../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" />--%>
    <!-- bootstrap-datetimepicker -->
    <link href="../../vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" rel="stylesheet" />



    <!-- Custom Theme Style -->
    <link href="../../build/css/custom.min.css" rel="stylesheet" />
    <style>
        .required {
            color: red;
        }

        .dropdown-menu {
            min-width: 288px;
        }

        .bootstrap-datetimepicker-widget table th {
            background-color: #1ABB9C;
            color: white;
        }

        .bootstrap-datetimepicker-widget table td, .bootstrap-datetimepicker-widget table th {
            border-radius: 0px;
        }

        .bootstrap-datetimepicker-widget table {
            color: black;
        }

            .bootstrap-datetimepicker-widget table :hover {
                /*background-color:blue;*/
                color: black;
            }

        .input-group {
            margin: 0px;
            padding: 0px;
        }

        th {
            text-align: center;
        }
    </style>

</asp:Content>
<asp:Content ID="bd" ContentPlaceHolderID="ContBody" runat="server">
    <form id="FrmVrsnCntrl" runat="server" class="form-horizontal form-label-left" novalidate="novalidate">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="col-md-12 col-sm-12 col-xs-12" style="margin: 0; padding: 0;">
                    <div class="col-md-6 col-sm-6-col-xs-12" style="margin-left: 0; padding-left: 0;">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="page-title">
                                    <div class="title_left">
                                        <h4>Software Version Control</h4>
                                    </div>


                                </div>
                                <div class="clearfix"></div>

                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="x_content">


                                            <%--<span class="section">Page Info</span>--%>

                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="txtProTitle">
                                                    Project Title <span class="required">*</span>
                                                </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <asp:TextBox ID="txtProTitle" CssClass="form-control col-md-12 col-sm-12 col-xs-12" data-validate-length-range="100" placeholder="Project Title" required="required" runat="server" TabIndex="0"></asp:TextBox>
                                                </div>
                                                <div class="col-md-3"></div>
                                            </div>

                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="ddlActivity">
                                                    Activity<span class="required"> *</span>
                                                </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <asp:DropDownList ID="ddlActivity" runat="server" CssClass="form-control col-md-12 col-sm-12 col-xs-12">
                                                        <asp:ListItem Value="0" Text="Select An Activity"></asp:ListItem>
                                                        <asp:ListItem Value="1" Text="Addition"></asp:ListItem>
                                                        <asp:ListItem Value="2" Text="Modification"></asp:ListItem>
                                                        <asp:ListItem Value="1" Text="Debug"></asp:ListItem>
                                                        <asp:ListItem Value="1" Text="Addition & Modification"></asp:ListItem>
                                                        <asp:ListItem Value="1" Text="Addition & Debug"></asp:ListItem>
                                                        <asp:ListItem Value="1" Text="Modification & Debug"></asp:ListItem>
                                                        <asp:ListItem Value="1" Text="Addition & Modification & Debug"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="col-md-3"></div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="txtRealeaseDate">
                                                    Realease Date<span class="required">*</span>
                                                </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <%-- <div class="form-group">--%>
                                                    <div class='input-group date' id='myDatepicker2'>
                                                        <asp:TextBox ID="txtRealeaseDate" type="text" placeholder="dd/mm/yyyy" CssClass="form-control" runat="server" required="required"></asp:TextBox>

                                                        <%--                                                        <input type='text' ID="txtRealeaseDate"  placeholder="dd/mm/yyyy" runat="server" required="required"  class="form-control"  />--%>
                                                        <%--<%--<asp:TextBox ID="txtRealeaseDate"   Enabled="false" CssClass="form-control col-md-12 col-sm-12 col-xs-12"  placeholder="Page Name" required="required" runat="server" TabIndex="0"></asp:TextBox>--%>
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </span>
                                                    </div>
                                                    <%--   </div>--%>
                                                </div>
                                                <div class="col-md-3"></div>
                                            </div>

                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="txtDescription">
                                                    Description <span class="required">*</span>
                                                </label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <asp:TextBox ID="txtDescription" type="text" CssClass="form-control col-md-12 col-sm-12 col-xs-12" data-validate-length-range="100" placeholder="Description" required="required" runat="server"></asp:TextBox>

                                                </div>
                                                <div class="col-md-3"></div>
                                            </div>
                                            <div class="ln_solid"></div>
                                            <div class="form-group">
                                                <div class="col-md-12 ">
                                                    <%-- --%>
                                                    <button type="button" id="btnSave" runat="server" class="btn btn-success" autoeventwireup="false" onserverclick="BtnSaveOnClick">Save</button>
                                                    <button id="btnReferesh" runat="server" type="button" class="btn btn-primary" onserverclick="BtnRefreshOnClick">Refresh</button>
                                                </div>
                                            </div>

                                        </div>



                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-6-col-xs-12" style="margin-left: 0; padding-left: 0;">
                        <asp:Label ID="lblMsg" runat="server"></asp:Label>

                        <asp:GridView ID="gvVersionInfo" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover jambo_table bulk_action"
                            AutoGenerateColumns="False" DataKeyNames="TaskNo"  OnPageIndexChanging="GvVersionInfo_PageIndexChanging" OnSelectedIndexChanged="GvVersionInfo_SelectedIndexChanged"
                            OnRowDeleting="GvVersionInfoOnRowDeleting"
                            AllowPaging="True">
                            <HeaderStyle CssClass="headerStyle" HorizontalAlign="Center" ForeColor="White" BackColor="#3F5367"></HeaderStyle>
                            <RowStyle CssClass="even pointer" HorizontalAlign="Center" BackColor="#E9F4F2"></RowStyle>
                            <Columns>
                                <asp:BoundField DataField="TaskNo" HeaderText="Task Id">
                                    <ItemStyle CssClass="hidden" />
                                    <HeaderStyle CssClass="hidden" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ProjectTitle" ItemStyle-HorizontalAlign="Center" HeaderText="Project Title"></asp:BoundField>
                                <asp:BoundField DataField="VersionNo" ItemStyle-HorizontalAlign="Center" HeaderText="Version" />
                                <asp:BoundField DataField="Description" ItemStyle-HorizontalAlign="Center" HeaderText="Description" />
                                <asp:BoundField DataField="ReleaseDate" ItemStyle-HorizontalAlign="Center" HeaderText="Release Date" />
                                    <asp:BoundField DataField="VersionTitle" HeaderText="Version Title">
                                    <ItemStyle CssClass="hidden" />
                                    <HeaderStyle CssClass="hidden" />
                                </asp:BoundField>
                              <%--      <asp:BoundField DataField="TaskNo" HeaderText="Task Id">
                                    <ItemStyle CssClass="hidden" />
                                    <HeaderStyle CssClass="hidden" />
                                </asp:BoundField>--%>
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


                        <asp:HiddenField ID="HdnTaskId" runat="server" />


                    </div>

                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <%--         OnPageIndexChanging="GvRoleInfo_PageIndexChanging" "
                            --%>
     <%--   --%>
        <%--    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>--%>

        <%--  </ContentTemplate>
        </asp:UpdatePanel>--%>
        
        <script src="../../vendors/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap -->
        <!-- FastClick -->
        <%--<script src="../../vendors/fastclick/lib/fastclick.js"></script>--%>
        <!-- NProgress -->



        <!-- jQuery -->
        <!-- Bootstrap -->
        <%-- <script src="../../vendors/bootstrap/dist/js/bootstrap.min.js"></script>--%>
        <!-- FastClick -->
        <%--        <script src="../../vendors/fastclick/lib/fastclick.js"></script>--%>

        <!-- bootstrap-daterangepicker -->
        <script src="../../vendors/moment/min/moment.min.js"></script>
        <script src="../../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
        <!-- bootstrap-datetimepicker -->
        <script src="../../vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>




        <!-- validator -->
        <script src="../../vendors/validator/validator.js"></script>
        <script src="../vendors/iCheck/icheck.min.js"></script>

        <!-- Custom Theme Scripts -->
        <%--        <script src="../../build/js/custom.min.js"></script>--%>

        <!-- Initialize datetimepicker -->
        <script>
            $('#myDatepicker2').datetimepicker({
                format: 'YYYY.MM.DD',
                ignoreReadonly: true,
                allowInputToggle: true
            });
        </script>
    </form>
</asp:Content>
