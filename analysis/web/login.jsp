<%--
  Created by IntelliJ IDEA.
  User: ls
  Date: 2021/1/15
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <title>用户登录</title>
    <meta http-equiv="Content-Type" content="text/html charset=utf-8">  <!-- 此处的charset=utf-8 用于控制浏览器的解码方式，一般情况下可省略 -->
    <!-- 以下部分引入BootStrap框架 -->
    <!-- 以下部分引入BootStrap框架 -->
    <link rel="stylesheet" href="<%=basePath %>/resource/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="<%=basePath %>/resource/jquery-3.5.1.js"></script>
    <script src="<%=basePath %>/resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        function changeImg(){
            var imgObj=document.getElementById("img");
            imgObj.src="CheckCodeServlet?ran="+Math.random();
        }
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
                <a class="nav-link" href="analysis.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">进入数据分析</font></font><span class="sr-only"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">（当前）</font></font></span></a>
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
<div class="container">
    <div class="row">
        <div class="page-header">
            <h1><small>请填写您的信息</small></h1>
        </div>
    </div>
    <form action="LoginServlet" Method="post" role="form"  class="form-horizontal" >
        <div class="form-group">
            <label for="name" class="col-sm-3 control-label">用户名:</label>
            <div class="col-sm-3">
                <input type=text  value="" name="name" id="name" class="form-control" size=30 placeholder="请输入姓名">
            </div>
        </div>
        <div class="form-group">
            <%--@declare id="pwd"--%><label for="pwd" class="col-sm-3 control-label">密码</label>
            <div class="col-sm-3">
                <input type=password value="" name="pwd" class="form-control" size=30 placeholder="请输入您的密码">
            </div>
        </div>
        <div class="form-group">
            <%--@declare id="code"--%><label for="code" class="col-sm-3 control-label">验证码:</label>
            <div class="col-sm-3">
                <input type="text" name="code" class="form-control" placeholder="请输入验证码" >
            </div>
                <span id="Msg"></span><br>
                <img src="code" onclick="this.src=this.src+'?'+Math.random()" id="img">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        <br>
        <div align="center">
            <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-5">
                        <button type="submit" class="btn btn-info col-sm-6" style="">提交</button>
                        <button type="reset" class="btn  btn-default  col-sm-6 active">重置</button>
                </div></div>
        </div>
    </form>
</div>
<script>
    alert("输入账户和密码错误");
    function change() {
        var img = document.getElementById('img');
        img.src = "code";
        alert(img.src)
    }
    var Msg = '<%=request.getAttribute("Msg")%>';
    var message = document.getElementById('Msg');
    if(Msg=='null')
    {
        message.innerHTML=''
    }
    else
    {
        message.innerHTML='<%=session.getAttribute("Msg")%>';
        setTimeout(function () {
            message.innerHTML='';
        },2000)
    }
</script>
</body>
</html>

