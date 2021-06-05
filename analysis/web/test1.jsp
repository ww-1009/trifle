<%--
  Created by IntelliJ IDEA.
  User: ls
  Date: 2021/1/19
  Time: 23:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link rel="stylesheet" type="text/css" href="styles/selfimpr.dialog.css">
    <style type="text/css">
    </style>
    <script type="text/javascript" src="scripts/jquery-1.3.2.js"
            charset="utf-8"></script>
    <script type="text/javascript" src="scripts/jquery-ui-1.7.2.custom.js"
            charset="utf-8"></script>
    <script type="text/javascript" src="scripts/selfimpr.dialog.js"
            charset="utf-8"></script>
        <script type="text/javascript">
            $(function() {
                var dialog = new Dialog({
                    target: '#dialog',
                    width: 400,
                    height: 300,
                    title: '测试Dialog的标题栏文字.',
                    draggabled: false
                });
                $('#show').click(function() {
                    dialog.show();
                });
            });
    </script>
</head>
<body>
<input type="button" value="show" id="show" />
<div id="dialog">
    <form action="HandleExcel" enctype="multipart/form-data" method="post">
        选择文件：<input type="file" name="excelfilename"><br>
        <input type="submit" value="显示数据">
    </form>
</div>
</body>


</html>

