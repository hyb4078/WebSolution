<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaveRecord.aspx.cs" Inherits="FirstWebProject.Three" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
    <link href="Libs/select2/4.0.3/css/theme/0.1.0-beta.10/select2-bootstrap.min.css" rel="stylesheet" />
    <link href="Libs/icheck/1.0.2/skins/square/blue.css" rel="stylesheet" />
    <script src="Libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="Libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="Libs/select2/4.0.3/js/select2.min.js"></script>
    <%--<script src="Libs/select2/4.0.3/js/i18n/zh-CN.js"></script>--%>
    <script src="Libs/icheck/1.0.2/icheck.min.js"></script>
    <script>
        $(function () {
            $("#ddlQuantity,#ddlLabel,#ddlNote,#ddlDamage").select2({
                //language: "zh-CN",
                theme: "bootstrap",
                minimumResultsForSearch: -1,
            }).on("change", function (e) {
                $("#radioYes").iCheck("check");
            });
            $("#radioYes,#radioNo").iCheck({
                //checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });
    </script>
</head>
<body style="font-size: medium">
    <div class="container-fluid">
        <form id="form" runat="server">
            <div>
                <table class="table">
                    <colgroup>
                        <col style="width: 25%" />
                        <col style="width: 75%" />
                    </colgroup>
                    <tr>
                        <td>PID:</td>
                        <td>
                            <asp:Label ID="lblID" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>供应商: </td>
                        <td>
                            <asp:Label ID="lblSupplier" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>零件号: </td>
                        <td>
                            <asp:Label ID="lblPartNumber" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>数量: </td>
                        <td>
                            <asp:Label ID="lblQuantity" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>是否接收</td>
                        <td>
                            <asp:RadioButton ID="radioYes" runat="server" Text="是" GroupName="isReceived" value="1"/>
                            <asp:RadioButton ID="radioNo" runat="server" Text="否" GroupName="isReceived" value="0"/>
                        </td>
                    </tr>
                    <tr>
                        <td>数量</td>
                        <td>
                            <asp:DropDownList ID="ddlQuantity" runat="server" Width="50%" DataTextField="Name" DataValueField="ID" AppendDataBoundItems="true">
                                <asp:ListItem Text="正常" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-md-2">标签</td>
                        <td>
                            <asp:DropDownList ID="ddlLabel" runat="server" Width="50%" DataTextField="Name" DataValueField="ID" AppendDataBoundItems="True">
                                <asp:ListItem Text="正常" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-md-2">送货单</td>
                        <td>
                            <asp:DropDownList ID="ddlNote" runat="server" Width="50%" DataTextField="Name" DataValueField="ID" AppendDataBoundItems="True">
                                <asp:ListItem Text="正常" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-md-2">破损</td>
                        <td>
                            <asp:DropDownList ID="ddlDamage" runat="server" Width="50%" DataTextField="Name" DataValueField="ID" AppendDataBoundItems="True">
                                <asp:ListItem Text="正常" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-center">
                            <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" OnClick="BtnSave_Click" Text="保存" />
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
</body>
</html>
