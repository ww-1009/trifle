<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link rel="stylesheet" href="<%=basePath%>/css/source/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="<%=basePath%>/css/source/jquery-3.5.1.js"></script>
    <script src="<%=basePath%>/css/source/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <base href="<%=basePath%>">

    <title>My JSP 'a.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>
<form action="UploadServlet" method="post" enctype="multipart/form-data">
    <font color="white" size="5px">文件上传功能(将你的照片，音乐，视频或者文档等经过上传分享到我的电脑)</font><br><br>
    学号：<input name="sno"><br><br>
    姓名：<input name="sname"><br><br>
    上传文件：<input type="file" name="spicture"><br><br>
    <input type="submit" value="上传"><br><br>
    <font color="white" size="5px">文件下载功能(可以下载我在tomcat服务器上传的文件)</font><br><br>
</form>
</body>
</html>
