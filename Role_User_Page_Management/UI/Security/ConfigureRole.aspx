<%@ Page Language="C#" AutoEventWireup="true" Title="Role_User_Page_Management | ConfigureRole" CodeBehind="ConfigureRole.aspx.cs" MasterPageFile="~/UI/Master/Home.Master" Inherits="Role_User_Page_Management.UI.Security.ConfigureRole" %>

<asp:Content ID="hd" ContentPlaceHolderID="ContHead" runat="server">
    <style>
        #ContBody_gvPInfo > tbody > tr:nth-child(1) > th {
            text-align: center;
        }

        #ContBody_AccessFolder > li > a {
            background-color: #3F5367 ;
            letter-spacing: 2px;
            color: white;
        }
        #ContBody_AccessFolder > li > a .activelist {
        background-color:green;
        }
        /*.tblhead {
     background-color:#3F5367;
     color:white;
   
     }*/

        /*.table-striped>tbody>tr:nth-of-type(odd):hover {
             background-color:#EFFAF8 !important;

     }
.table-striped>tbody>tr:nth-of-type(even):hover {
             background-color:#EFFAF8 !important;
             
     }
.table-striped>tbody>tr:nth-of-type(odd) {
    background-color: #E9F4F2 !important;
    text-align:center !important;
}
.table-striped>tbody>tr:nth-of-type(even) {
  
    text-align:center !important;
}
 #ContBody_gvPInfo > tbody > tr.headerStyle.backcolor > th {
         background-color:#E9F4F2 !important;
     }*/
    </style>
    <script>
     
    </script>
</asp:Content>
<asp:Content ID="bd" ContentPlaceHolderID="ContBody" runat="server">
    <form id="frmConfig" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />

        <div class="col-md-12 col-xs-12 col-sm-12">
            <%--  <div class="col-md-6 col-sm-6 col-xs-12">--%>
            <div class="x_panel ">
                <div class="x_title">
                    <h2>User Role Configuration</h2>
                    <ul class="nav navbar-right panel_toolbox ">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="col-md-12 col-xs-12">
                        <%-- <div class="col-md-6 col-sm-6 col-xs-12">--%>
                        <div class="x_panel">
                            <div class="x_title">
                                <h2><i class="fa fa-cog"></i> Define User Roles</h2>
                                <%--   <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                  
                    
                  </ul>--%>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="item form-group">

                                    <div class="col-md-4  col-sm-4 col-xs-12">

                                        <asp:DropDownList ID="ddlUserRoleSelection" runat="server" CssClass="form-control col-md-12 col-xs-12" OnSelectedIndexChanged="ddlURSOnSelectedEventChange" AutoPostBack="true"></asp:DropDownList>

                                    </div>
                                    <div class="col-md-6  col-sm-6 col-xs-12">
                                        <asp:Label ID="lblDescription" CssClass="form-control col-md-12 col-xs-12" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-2  col-sm-2 col-xs-12">
                                    </div>


                                </div>


                            </div>
                        </div>
                        <%--         </div>--%>
                    </div>

                    <div class="col-xs-3 " id="myTabs">
                        <!-- required for floating -->
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs tabs-left " id="AccessFolder" runat="server">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ul>
                    </div>

                    <div class="col-xs-9" id="DivtblContnt">

                        <!-- Tab panes -->
                        <div class="tab-content" id="content">
                            <div class="tab-pane active" id="home">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="gvPInfo" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover jambo_table bulk_action"
                                            AutoGenerateColumns="False" DataKeyNames="UserRoleDetailId" OnRowDataBound="gvAccessinfoRowdataBOund" OnSelectedIndexChanged="gvAccessSelectedIndex"
                                             OnRowCommand="gvAccessOnRowCommand"
                                            AllowPaging="True">
                                            <HeaderStyle HorizontalAlign="Center" ForeColor="White" BackColor="#3F5367"></HeaderStyle>
                                            <RowStyle CssClass="even pointer " HorizontalAlign="Center" BackColor="#E9F4F2"></RowStyle>
                                            <Columns>
                                                <asp:BoundField DataField="UserRoleDetailId" HeaderText="UserRoleDetailId">
                                                    <ItemStyle CssClass="hidden" />
                                                    <HeaderStyle CssClass="hidden" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ModuleId" ItemStyle-HorizontalAlign="Center" HeaderText="Module Id">
                                                    <ItemStyle CssClass="hidden" />
                                                    <HeaderStyle CssClass="hidden" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="PageId" ItemStyle-HorizontalAlign="Center" HeaderText="Page Id">
                                                    <ItemStyle CssClass="hidden" />
                                                    <HeaderStyle CssClass="hidden" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="AccessAreaId" ItemStyle-HorizontalAlign="Center" HeaderText="AccessArea Id">
                                                    <ItemStyle CssClass="hidden" />
                                                    <HeaderStyle CssClass="hidden" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="PageName" ItemStyle-HorizontalAlign="Center" HeaderText="Page Name"></asp:BoundField>
                                                <asp:TemplateField HeaderText="IsAccess" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                          <asp:LinkButton ID="img" runat="server" CommandName="IsAccessClick" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="IsWrite" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                            <asp:LinkButton ID="img2" runat="server" CommandName="IsWriteClick" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="IsEdit" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                         <asp:LinkButton ID="img4" runat="server" CommandName="IsEditClick" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="IsRead" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="img6" runat="server" CommandName="IsReadClick" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                                                                <asp:BoundField DataField="AceessArea" ItemStyle-HorizontalAlign="Center" HeaderText="Aceess Area"></asp:BoundField>
                                                <asp:TemplateField HeaderText="AceessArea" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:DropDownList ID="ddlAccessArea" runat="server" Autopostback="true" OnSelectedIndexChanged="ddlAccessAreaOnSelectedindexChange"></asp:DropDownList>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                
                                                </Columns>
                                                <EditRowStyle BackColor="#2461BF" />
                                            <AlternatingRowStyle BackColor="white" />
                                             </asp:GridView>
                                       
                                                <%--asp:BoundField DataField="IsAccess" ItemStyle-HorizontalAlign="Center" HeaderText="IsAccess" />
                                <asp:BoundField DataField="IsWrite" ItemStyle-HorizontalAlign="Center" HeaderText="IsWrite" />
                                  <asp:BoundField DataField="IsEdit" ItemStyle-HorizontalAlign="Center" HeaderText="IsEdit" />
                                <asp:BoundField DataField="IsRead" ItemStyle-HorizontalAlign="Center" HeaderText="IsRead" />
                                <asp:BoundField DataField="AceessArea" ItemStyle-HorizontalAlign="Center" HeaderText="Aceess Area" />--%>
                                               <%-- <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Delete">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="ButtonDelete" runat="server" CausesValidation="False" CommandName="Delete"><img src="../../images/delete.png" /></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:CommandField HeaderText="Edit" ShowSelectButton="true" ButtonType="Image" SelectImageUrl="~/images/Edit.png" ItemStyle-Height="5px" ItemStyle-HorizontalAlign="Center"></asp:CommandField>--%>
                              
                                            <%--<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <SelectedRowStyle BackColor="#CFF0E9" Font-Bold="True" ForeColor="#333333" BorderColor="#1ABC9C" />
                            <HeaderStyle BackColor="#E9F4F2" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />--%>
                                        
                                            <%-- <PagerStyle HorizontalAlign="Left" ForeColor="#3F5367" CssClass="gvPagers pad" />
                            <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="First" LastPageText="Last" />--%>
                                       
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </div>


                        </div>

                    </div>
                    <asp:HiddenField ID="hfTab" runat="server" />


                </div>
            </div>
            <%--</div>--%>
        </div>

    </form>
    <script src="../../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <%-- <script src="../../vendors/bootstrap/dist/js/bootstrap.min.js"></script>--%>
    <script src="../../vendors/validator/validator.js"></script>
    <script src="../vendors/iCheck/icheck.min.js"></script>
    <script type="text/javascript">
        function hidePanel() {
            $('#myTabs').on("click", "li", function (event) {
               
                var activeTab = $(this).find('a').attr('href').split('#')[1];
                //$(this).addClass('activelist');

                __doPostBack('CheckHideShow', activeTab);
            });

        }
        //function hidePanel2() {
        //    $("#myTabs > ul > li a").click(function () {
        //        $('#myTabs > ul > li a').removeClass('activelist');
        //        var activeTab = $(this).find('a').attr('href').split('#')[1];
        //        $(this).addClass('activelist');
        //        alert(activeTab);
        //    });
        //};
        //function InsertLabelData() {

        //   $('#myTabs').on("click", "li", function (event) {
        //        var activeTab = $(this).find('a').attr('href').split('#')[1];
        //        $("#hfTab").val(activeTab);
        //        alert(activeTab);

        //   });

        //}
        hidePanel();
       

    </script>
</asp:Content>
