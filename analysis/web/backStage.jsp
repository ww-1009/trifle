<%@ page import="com.ls.common.Lesson" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ls.common.LessonHandle" %><%--
  Created by IntelliJ IDEA.
  User: ls
  Date: 2021/1/16
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据分析管理后台</title>
    <link rel="stylesheet" href="resource/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="resource/jquery-3.5.1.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="css/jquery-ui.css"></script>
    <script src="resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
        <ul class="navbar-nav mr-auto nav-justified">
            <li class="nav-item active">
                <a class="nav-link" href="backsta.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">进入数据分析</font></font><span class="sr-only"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">（当前）</font></font></span></a>
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
            <li class="nav-item">
                <a class="nav-link" href="allUser.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">查看所有用户</font></font></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="allStudent.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">查看所有学生</font></font></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="allTeacher.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">查看所有教师</font></font></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="allLesson.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">查看所有课程</font></font></a>
            </li>
            <li class="nav-item" role="presentation">
                <a href="#">当前用户：<span class="badge" id="login"></span></a>
            </li>
            <li class="nav-item">
                <a href="LoginOut">
                    <span class="glyphicon glyphicon-lock"></span>退出登录</a>
            </li>
        </ul>
    </div>
</nav>
<div class="col-sm-2">
    <div class="list-group">
        <a href="#" class="list-group-item bg-success">
            课程管理
        </a>
        <a href="#" class="list-group-item" onclick="AddLesson()">添加课程</a>
        <a href="#" class="list-group-item" onclick="DeleteLesson()">删除课程</a>
        <a href="#" class="list-group-item" onclick="UpdateLesson()">更新课程</a>
    </div>
</div>
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
        <td><a href="DeleteLessonServlet?l_id=<%=lesson.getL_id()%>">删除</a>|<a href="updateLesson.jsp?id=<%=lesson.getL_id()%>">修改</a>|<a href="download/<%=lesson.getL_name()%>.xls">下载文件</a></td>
    </tr>
    <%
        }
    %>
</table>
<script>
    function AddLesson(){
        var l_id = prompt("请输入添加的课程ID","");
        var l_name = prompt("请输入添加的课程名称:","");
        var l_teacher_name = prompt("请输入授课老师名字","");
        window.location.href="AddLessonServlet?l_id="+l_id+"&l_name="+l_name+"&l_teacher_name="+l_teacher_name;
    }
    function DeleteLesson() {
        var l_id = prompt("请输入要删除的课程ID","");
        window.location.href="DeleteLessonServlet?l_id="+l_id;
    }
    function UpdateLesson() {
        var l_id = prompt("请输入添加的课程ID","");
        var l_name = prompt("请输入添加的课程名称:","");
        var l_teacher_name = prompt("请输入授课老师名字","");
        window.location.href="UpdateLessonServlet?l_id="+l_id+"&l_name="+l_name+"&l_teacher_name="+l_teacher_name;
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
