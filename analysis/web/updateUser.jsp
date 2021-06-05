<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>顾客信息</title>
    <link rel="stylesheet" href="<%=basePath %>/resource/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="<%=basePath %>/resource/jquery-3.5.1.js"></script>
    <script src="<%=basePath %>/resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
    </script>
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
        </ul>
    </div>
</nav>
<jsp:useBean id="user" class="com.ls.common.User" scope="request"></jsp:useBean>
<jsp:useBean id="userHandle" class="com.ls.common.UserHandle" scope="request"></jsp:useBean>
<%
    String id = request.getParameter("id");
    user = userHandle.getUser(Integer.parseInt(id));
%>

<div class="container">
    <div class="row">
        <div class="page-header">
            <h1><small>修改用户信息</small></h1>
        </div>
    </div>

    <form action="UpdateServlet" method="post" class="form-horizontal" role="form">
        <input type="hidden"  name="id" value="<%=user.getId()%>" >
        <div class="form-group">
            <label for="name" class="col-sm-3 control-label">用户姓名</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="name" name="name" value="<%=user.getName()%>" required autofocus>
            </div>
        </div>
        <div class="form-group">
            <label for="pwd" class="col-sm-3 control-label">用户密码</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="pwd" name="pwd" value="<%=user.getPassword()%>">
            </div>
        </div>
        <div class="form-group">
            <label for="tel" class="col-sm-3 control-label">手机号</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="tel" name="tel" value="<%=user.getTel()%>">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">选择类别</label>
            <div class="col-sm-5">
                <label><input type="radio" value="student" class="form-control" id="category1" name="category">student</label>
                <label><input type="radio" value="teacher" class="form-control" id="category2" name="category">teacher</label>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-5">
                <button type="submit" class="btn btn-success btn-lg col-sm-6">确认修改</button>
            </div>
        </div>
        <input type="hidden" name="callback" value="<%=request.getParameter("callback")%>"/>
    </form>
</div>
<script>
    var category = '<%=user.getCategory()%>';
    var category1 = document.getElementById('category1');
    var category2 = document.getElementById('category2');
    if (category=='student')
    {
        category1.setAttribute("checked","checked");
        category2.removeAttribute("checked");
    }
    else
    {
        category2.setAttribute("checked","checked");
        category1.removeAttribute("checked");
    }
</script>
</body>
</html>
