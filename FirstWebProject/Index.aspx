<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="FirstWebProject.Temp" %>

<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>供应单</title>

    <!-- Bootstrap -->
    <link href="Libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        .item-click {
            background-color: #ea9999;
        }

        .item-hover {
            background-color: #696969;
            color: #FFFFFF;
        }
    </style>
</head>
<body>
    <div class="container" style="width: auto">
        <div class="row">
            <div class="col-xs-8">
                <div class="panel panel-primary">
                    <div class="panel-heading text-center">
                        <div class="panel-title "><span class="h3">日期：</span><asp:Label ID="currentDate" runat="server" CssClass="h3" Text="Label"></asp:Label></div>
                    </div>
                    <div class="table-responsive">
                        <asp:Repeater ID="RptRecv_Schedule" runat="server">
                            <HeaderTemplate>
                                <table class="table table-bordered" id="RptRecv_Schedule">
                                    <colgroup>
                                        <col style="width:5%;"/>
                                        <col style="width:20%;"/>
                                        <col style="width:15%;"/>
                                        <col style="width:10%;"/>
                                        <col style="width:10%;"/>
                                        <col style="width:40%;"/>
                                    </colgroup>
                                    <tr class="success">
                                        <th>#</th>
                                        <th>供应商</th>
                                        <th>零件号</th>
                                        <th>数量</th>
                                        <th>是否接收</th>
                                        <th>异常情况</th>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr id="<%#Eval("pid") %>">
                                    <td><%#Eval("pid") %></td>
                                    <td><%#Eval("provider") %></td>
                                    <td><%#Eval("partNumber") %></td>
                                    <td><%#Eval("count") %></td>
                                    <td><%#(Eval("Received","{0}")=="1")?"是":"否" %></td>
                                    <td><%#Eval("exceptionRecord") %></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="panel-footer">
                        <a class="btn btn-primary" id="add" href="AddRecord.aspx" target="detail" data-toggle="tooltip" data-placement="right" title="新增一个供应商">新增</a>
                    </div>
                </div>
            </div>
            <div class="col-xs-4">
                <iframe name="detail" style="height: 800px; width: 550px" frameborder="0" id="detail"></iframe>
            </div>
        </div>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="Libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript">
        var selector = "#RptRecv_Schedule tr:not(:first)";
        $(selector).click(function () {
            $(selector).removeClass("item-hover item-click");
            $(this).addClass("item-click");
            detail.location.href = "SaveRecord.aspx?pid=" + ($(this).attr("id"));
        }).hover(function () {
            if ($(this).attr("class") != "item-click") {
                $(this).addClass("item-hover");
            }
        }, function () {
            $(this).removeClass("item-hover");
        });
        $("#add").click(function () {
            $(selector).removeClass("item-click");
        });
    </script>
</body>
</html>
