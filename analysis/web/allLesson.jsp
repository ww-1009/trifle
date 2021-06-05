<%@ page import="com.ls.common.Lesson" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ls
  Date: 2021/1/16
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%

        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <title>课程列表</title>
    <meta http-equiv="Content-Type" content="text/html charset=utf-8">  <!-- 此处的charset=utf-8 用于控制浏览器的解码方式，一般情况下可省略 -->
    <!-- 以下部分引入BootStrap框架 -->
    <link rel="stylesheet" type="text/css" href="styles/selfimpr.dialog.css">
    <style type="text/css">
    </style>
    <script type="text/javascript" src="scripts/jquery-1.3.2.js"
            charset="utf-8"></script>
    <script type="text/javascript" src="scripts/jquery-ui-1.7.2.custom.js"
            charset="utf-8"></script>
    <script type="text/javascript" src="scripts/selfimpr.dialog.js"
            charset="utf-8"></script>
    <link rel="stylesheet" href="<%=basePath %>/resource/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="<%=basePath %>/resource/jquery-3.5.1.js"></script>
    <script src="<%=basePath %>/resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="js/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <style type="text/css">
        body{
            background: url("${pageContext.request.contextPath}/img/bk1.jpg");
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="home.jsp">
        <font style="vertical-align: inherit;">
            <font style="vertical-align: inherit;">主页</font></font></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="切换导航">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarColor03">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="addLesson.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">进入数据分析</font></font><span class="sr-only"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">（当前）</font></font></span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="backStage.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">后台管理系统</font></font></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">登录</font></font></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="register.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">注册</font></font></a>
            </li>
        </ul>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li role="presentation">
                    <a>当前用户：<span class="badge" id="login"></span></a>
                </li>
                <li>
                    <a href="LoginOut">
                        <span class="glyphicon glyphicon-lock"></span>退出登录</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<jsp:useBean id="lessonHandle" class="com.ls.common.LessonHandle" >
</jsp:useBean>
<h1 class="text-center">课程列表</h1>
<table align="center" class="table table-hover table table-striped table-condensed">
    <tr class="success">
        <th>课程代码</th>
        <th>课程名称</th>
        <th>教师名字</th>
        <th>功能栏</th>
    </tr>
    <%
        ArrayList<Lesson> lessonList = lessonHandle.getAllLesson();
        for(Lesson lesson:lessonList)
        {
    %>
    <tr class="table-light">
        <td><%=lesson.getL_id()%></td>
        <td><%=lesson.getL_name()%></td>
        <td><%=lesson.getL_teacher_name()%></td>
        <td><a href="download/<%=lesson.getL_name()%>.xls">下载源文件</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id="upload" class="btn  btn-info">提交文件</button></a></td>
    </tr>
    <%
        }
    %>
</table>
</font>
<script>
    $(document).ready(function () {
        var dialog = new Dialog({
            target: '#dialog',
            width: 400,
            height: 300,
            title: '提交你的文件.',
            draggabled: false
        });
        $("button[id='upload']").click(function () {
            dialog.show();
        })
    })
</script>
<div id="dialog" style="display: none">
    <form action="HandleExcel" enctype="multipart/form-data" method="post">
        选择文件：<input type="file" name="excelfilename"><br>
        <input type="submit" value="点击提交" onclick="submit()">
    </form>
</div>
<script>
    function submit() {
        alert("success");
    }
    var accuracy = '<%=request.getAttribute("accuracy")%>';
    var precision = '<%=request.getAttribute("precision")%>';
    var recall = '<%=request.getAttribute("recall")%>';
    var f1 = '<%=request.getAttribute("f1")%>';
    if(accuracy!='null')
       {
           alert("accuracy "+accuracy+'\n'+"precision "+precision+'\n'+"recall "+recall+'\n'+"F1score "+f1+'\n'+'Please try harder ^^');
       }
</script>
<script>
    var name = '<%=session.getAttribute("name")%>';
    var login = document.getElementById("login");
    if(name=="null")
    {
        login.innerHTML='无';
    }
    else
    {
        login.innerText='<%=session.getAttribute("name")%>'
    }
</script>
</body>
</html>
