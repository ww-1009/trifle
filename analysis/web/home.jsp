<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <meta charset="utf-8">
    <title>鑫悦数据分析管理系统</title>
    <link rel="stylesheet" href="resource/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="resource/jquery-3.5.1.js"></script>
    <script src="resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
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
<div align="center">
    <div class="alert alert-dismissible alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>你 好 !</strong> 欢迎来到鑫悦数据分析管理系统主页!
    </div>
    <div id="myCarousel" class="carousel slide">
        <!-- 轮播（Carousel）指标 -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner" style="width: 1000px;height: 500px">
            <div class="item active">
                <img src="img/home.jpg"  alt="First slide">
            </div>
            <div class="item">
                <img src="img/home1.jpg"   alt="Second slide">
            </div>
            <div class="item">
                <img src="img/home2.jpg"  alt="Third slide">
            </div>
        </div>
        <!-- 轮播（Carousel）导航 -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div class="jumbotron">
        <h1 class="display-3">欢迎, 光临</h1>
        <p class="lead">首次进入鑫悦数据分析管理系统，请点击左上角的注册按钮，登录点击左上角的登录按钮，欢迎您的下次光临!</p>
        <hr class="my-4">
        <p>copy right?=刘硕刘硕刘硕</p>
        <p class="lead">
            <a class="btn btn-outline-success" href="home.jsp" role="button">了解更多</a>
        </p>
    </div>
</div>
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