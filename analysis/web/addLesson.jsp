<%--
  Created by IntelliJ IDEA.
  User: ls
  Date: 2021/1/16
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加课程</title>
</head>
<body>
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
