<%--
  Created by IntelliJ IDEA.
  User: ls
  Date: 2021/1/16
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.*, java.util.*" %>
<%@ page import="com.ls.common.Student" %>
<HTML>
<head>
    <%

        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <title>学生列表</title>
    <meta http-equiv="Content-Type" content="text/html charset=utf-8">  <!-- 此处的charset=utf-8 用于控制浏览器的解码方式，一般情况下可省略 -->
    <!-- 以下部分引入BootStrap框架 -->
    <link rel="stylesheet" href="<%=basePath %>/resource/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="<%=basePath %>/resource/jquery-3.5.1.js"></script>
    <script src="<%=basePath %>/resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
                <a class="nav-link" href="analysis.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">进入数据分析</font></font><span class="sr-only"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">（当前）</font></font></span></a>
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
                <a>当前用户：<span class="badge" id="login"></span></a>
            </li>
            <li class="nav-item">
                <a href="LoginOut">
                    <span class="glyphicon glyphicon-lock"></span>退出登录</a>
            </li>
        </ul>

    </div>
</nav>
<jsp:useBean id="studentHandle" class="com.ls.common.StudentHandle" >
</jsp:useBean>
<h1 class="text-center">用户列表</h1>
<table align="center" class="table table-hover table table-striped table-condensed">
    <tr class="success">
        <th>学号</th>
        <th>姓名</th>
        <th>电话</th>
        <th>功能栏</th>
    </tr>
    <%
        ArrayList<Student> studentList = studentHandle.getAllStudent();
        for(Student student:studentList)
        {
    %>
    <tr class="table-light">
        <td><%=student.getId()%></td>
        <td><%=student.getName()%></td>
        <td><%=student.getTel()%></td>
        <td><a href="/DeleteServlet?id=<%=student.getId()%>">删除</a>|<a href="updateUser.jsp?id=<%=student.getId()%>">修改</a> </td>
    </tr>
    <%
        }
    %>
</table>
</font>
</body>
</HTML>
