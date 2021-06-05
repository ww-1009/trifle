<%--
  Created by IntelliJ IDEA.
  User: ls
  Date: 2021/1/18
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="js/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
    <script>
        $(function() {
            $("#btn").button().click(function() {
                alert("btn 被点击啦！");

               $("#dialog-confirm").dialog("open")
            });
            var dialog = $("#dialog-confirm").dialog(
                {
                    modal: true,
                    position: 'center',
                    autoOpen: false,
                    buttons: {
                        "Ok": function() {
                            dialog.dialog('close');
                        },
                        "Cancel": function() {
                            dialog.dialog('close');
                        }
                    }
                });
        });
    </script>
</head>
<body>
<button id="btn">点击弹出对话框</button>
<div style="text-align: center;">
<div id="dialog-confirm" title="Empty the recycle bin?" style="display: none">
    <p>
        <span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>
        These items will be permanently deleted and cannot be recovered. Are you sure?</p>
</div>
</div>
</body>
</html>
