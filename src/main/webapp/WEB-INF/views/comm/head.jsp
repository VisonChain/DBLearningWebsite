<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contextPath = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="VisonChain">

    <title>Database Learning Website</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=contextPath%>/static/ui/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="<%=contextPath%>/static/ui/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet'
          type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
          rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="<%=contextPath%>/static/ui/css/clean-blog.min.css" rel="stylesheet">

</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand" href="/">DBLearning Website</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/articlePage">文章阅读</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/videoPage">视频观看</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/resDownloadPage">资源下载</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/paperTestPage" target="_blank">在线检测</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/chatRoom" target="_blank">在线聊天</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
