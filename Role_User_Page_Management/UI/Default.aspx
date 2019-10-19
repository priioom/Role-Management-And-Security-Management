<%@ Page Language="C#" AutoEventWireup="true" Title="Role_User_Page_Management | Default" CodeBehind="Default.aspx.cs" Inherits="Role_User_Page_Management.UI.Default" MasterPageFile="~/UI/Master/Home.Master" %>


<asp:Content ID="hd" ContentPlaceHolderID="ContHead" runat="server">
    <script src="../../vendors/jquery/dist/jquery.min.js"></script>

    <%--      <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>--%>
    <%--    <script src="Scripts/jquery-1.8.2.js"></script>--%>
    <%--    <script src="jquery/jquery.Jcrop.js" type="text/javascript"></script>--%>
    <script> $.noConflict();</script>
    <script type="text/javascript" src="http://jcrop-cdn.tapmodo.com/v0.9.12/js/jquery.Jcrop.js"></script>

    <link rel="stylesheet" href="http://jcrop-cdn.tapmodo.com/v0.9.12/css/jquery.Jcrop.css" />
    <%-- <link href="jquery/jquery.Jcrop.css" rel="stylesheet" type="text/css" />--%>
    <script type="text/javascript">

        //$(function () {
        //    $('#imgDynamiccrop').Jcrop({
        //        onSelect: getcroparea
        //    });
        //})
        //function getcroparea(c) {
        //    $('#hdnx').val(c.x);
        //    $('#hdny').val(c.y);
        //    $('#hdnw').val(c.w);
        //    $('#hdnh').val(c.h);
        //};

        $(document).ready(function () {
            $('#<%=imgDynamiccrop.ClientID%>').Jcrop({
            onSelect: getcroparea
        });
    });

    function getcroparea(c) {
        $('#<%=hdnx.ClientID%>').val(parseInt(c.x));
            $('#<%=hdny.ClientID%>').val(parseInt(c.y));
            $('#<%=hdnw.ClientID%>').val(parseInt(c.w));
            $('#<%=hdnh.ClientID%>').val(parseInt(c.h));
        }


        function UploadFile(fileUpload) {
            if (fileUpload.value != '') {
                document.getElementById("<%=btnGetImage.ClientID %>").click();
            }
        }
    </script>

</asp:Content>
<asp:Content ID="bd" ContentPlaceHolderID="ContBody" runat="server">
    <form id="form1" runat="server">
        <div>
            <table align="Center">
                <tr>
                    <td>
                        <b><u style="font-size: x-large; color: maroon">Dynamic Image Croping</u></b>
                    </td>
                </tr>
                <tr>
                    <td>Select Image :
                        <asp:FileUpload runat="server" ID="fuImages" /></td>
                    <td>
                        <asp:Button runat="server" ID="btnGetImage" Text="GetImage" OnClick="BtnGetImage_OnClick" Style="display: none" />
                        Crop Image :
                        <asp:Button ID="btncrop" runat="server" OnClick="BtnDynamiccrop_Click" Text="Crop Images" /></td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <img runat="server" id="imgDynamiccrop" alt="sample image" />
                        <input type="hidden" id="hdnx" runat="server" />
                        <input type="hidden" id="hdny" runat="server" />
                        <input type="hidden" id="hdnw" runat="server" />
                        <input type="hidden" id="hdnh" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    Crop Image :
                </tr>
                <tr>
                    <td colspan="2">
                        <img id="imgDynamiccropped" runat="server" visible="false" />
                    </td>
                </tr>
            </table>
        </div>
    </form>

</asp:Content>
