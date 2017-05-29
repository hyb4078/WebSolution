<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddRecord.aspx.cs" Inherits="FirstWebProject.Four" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
    <link href="Libs/select2/4.0.3/css/theme/0.1.0-beta.10/select2-bootstrap.min.css" rel="stylesheet" />
    <link href="Libs/icheck/1.0.2/skins/square/blue.css" rel="stylesheet" />
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="Libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="Libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="Libs/select2/4.0.3/js/select2.min.js"></script>
<%--    <script src="Libs/bootstrap-3-typeahead/4.0.2/bootstrap3-typeahead.min.js"></script>--%>
    <script src="Libs/icheck/1.0.2/icheck.min.js"></script>
    <%--<script src="Libs/select2/4.0.3/js/i18n/zh-CN.js"></script>--%>
    <script>
        $(function () {
            $("#radioYes,#radioNo").iCheck({
                radioClass: 'iradio_square-blue',
                increaseArea: '20%'
            });

            $("#ddlQuantity,#ddlLabel,#ddlNote,#ddlDamage").select2({
                //language: "zh-CN",
                theme: "bootstrap",
                placeholder: "Select a state",
                //minimumResultsForSearch: -1  //去除搜索框
                //minimumResultsForSearch: Infinity  //同上
                
            }).on("change", function () {
                $("#radioYes").iCheck("check");
            });;
        });
    </script>
    <!--[if IE]>
    <script type="text/javascript">
        $(function () {
            $("#btnAdd").click(function () {
                var supplier = $("#supplier").val();
                var partNumber = $("#partNumber").val();
                var quantity = $("#quantity").val();
                if (supplier == "" || partNumber == "" || quantity == "") {
                    alert("必填信息未填写!");
                    return false;
                }
            });
        });    
    </script>
    <![endif]-->
    <style>
        .required {
            color: red;
            padding-left: 5px;
            font-size: 20px;
        }

        span {
            /*color: red;*/
        }

        .form-control {
            width: 90%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-group">
            <table class="table ">
                <tr>
                    <td>
                        <label>供应商</label></td>
                    <td>
                        <input type="text" name="supplier" id="supplier" class="form-control pull-left" autocomplete="off" data-provide="typeahead" required="required" oninvalid="setCustomValidity('供应商必须填写！')" oninput="setCustomValidity('');" /><span class="required">*</span></td>
                </tr>
                <tr>
                    <td>
                        <label>零件号</label></td>
                    <td>
                        <input type="text" name="partNumber" id="partNumber" class="form-control pull-left" autocomplete="off" required="required" oninvalid="setCustomValidity('零件号也要填！');" oninput="setCustomValidity('');" /><span class="required">*</span></td>
                </tr>
                <tr>
                    <td>
                        <label>数量</label></td>
                    <td>
                        <input type="text" name="quantity" id="quantity" class="form-control pull-left" autocomplete="off" required="required" oninvalid="setCustomValidity('。。。同上！');" oninput="setCustomValidity('');" /><span class="required">*</span></td>
                </tr>
                <tr>
                    <td>是否接收</td>
                    <td>
                        <asp:RadioButton ID="radioYes" runat="server" Text="是" GroupName="isReceived" value="1" Checked="true" />
                        <asp:RadioButton ID="radioNo" runat="server" Text="否" GroupName="isReceived" value="0" />
                    </td>
                </tr>
                <tr>
                    <td>数量</td>
                    <td>
                        <asp:DropDownList ID="ddlQuantity" runat="server" DataTextField="Name" DataValueField="ID" Width="50%" AppendDataBoundItems="true">
                            <asp:ListItem Text="正常" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>标签</td>
                    <td>
                        <asp:DropDownList Width="50%" ID="ddlLabel" runat="server" DataTextField="Name" DataValueField="ID" AppendDataBoundItems="True">
                            <asp:ListItem Text="正常" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>送货单</td>
                    <td>
                        <asp:DropDownList Width="50%" ID="ddlNote" runat="server" DataTextField="Name" DataValueField="ID" AppendDataBoundItems="True">
                            <asp:ListItem Text="正常" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>破损</td>
                    <td>
                        <asp:DropDownList Width="50%" ID="ddlDamage" runat="server" DataTextField="Name" DataValueField="ID" AppendDataBoundItems="True">
                            <asp:ListItem Text="正常" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr class="text-center">
                    <td colspan="2">
                        <asp:Button ID="btnAdd" runat="server" Text="添加" OnClick="BtnAdd_Click" CssClass="btn btn-primary" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
