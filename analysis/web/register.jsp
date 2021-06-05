<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="Dao.*, bean.*, java.util.*" %>
<HTML>
<head>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<title>注册信息</title>
<meta http-equiv="Content-Type" content="text/html charset=utf-8">  <!-- 此处的charset=utf-8 用于控制浏览器的解码方式，一般情况下可省略 -->
		<!-- 以下部分引入BootStrap框架 -->
		<link rel="stylesheet" href="<%=basePath %>/resource/bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
     <script src="<%=basePath %>/resource/jquery-3.5.1.js"></script>
     <script src="<%=basePath %>/resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
        <a class="nav-link" href="buy.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">进入数据分析</font></font><span class="sr-only"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">（当前）</font></font></span></a>
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
  </div>
</nav>
<br>
<div class="container">
    <div class="row">
        <div class="page-header">
            <h1><small>请填写系统注册信息</small></h1>
        </div>
    </div>
   <form action="AddServlet" method="post" class="form-horizontal" style="border: 3px solid azure;background-color: #f1efef" >
       <div class="form-group">
           <label for="id" class="col-sm-3 control-label">学号</label>
           <div class="col-sm-5">
               <input type="text" class="form-control" id="id" name="id" placeholder="请输入学号" >
           </div>
       </div>
        <div class="form-group">
            <label for="name" class="col-sm-3 control-label">用户名</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="name" name="name" placeholder="请输入您的姓名" required autofocus>
            </div>
        </div>
       <div class="form-group">
           <%--@declare id="pwd"--%><label for="pwd" class="col-sm-3 control-label">密码</label>
           <div class="col-sm-3">
               <input type=password value="" name="pwd" class="form-control" size=30 placeholder="请输入您的密码">
           </div>
       </div>
        <div class="form-group">
            <label for="tel" class="col-sm-3 control-label">手机号</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="tel" name="tel" placeholder="请输入手机号" >
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
                <button type="submit" class="btn btn-info col-sm-6">确定</button>
                <button type="reset" class="btn  btn-default  col-sm-6">重置</button>
            </div>
        </div>

    </form>
</div>
</body>
</html>
