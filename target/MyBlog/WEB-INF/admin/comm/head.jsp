<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contextPath = request.getContextPath();
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>数据库学习网站后台</title>
    <!-- Bootstrap core CSS-->
    <link href="<%=contextPath%>/static/adminUI/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="<%=contextPath%>/static/adminUI/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet"
          type="text/css">
    <!-- Page level plugin CSS-->
    <link href="<%=contextPath%>/static/adminUI/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="<%=contextPath%>/static/adminUI/css/sb-admin.css" rel="stylesheet">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand">DBLearning Manger</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
            data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="文章管理">
                <a class="nav-link" href="/ad/articleManger">
                    <i class="fa fa-fw fa-dashboard"></i>
                    <span class="nav-link-text">文章管理</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="资源管理">
                <a class="nav-link" href="/ad/resManger">
                    <i class="fa fa-fw fa-area-chart"></i>
                    <span class="nav-link-text">资源管理</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="视频管理">
                <a class="nav-link" href="/ad/videoManger">
                    <i class="fa fa-fw fa-table"></i>
                    <span class="nav-link-text">视频管理</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="试题管理">
                <a class="nav-link" href="/ad/testpaperManger">
                    <i class="fa fa-fw fa-table"></i>
                    <span class="nav-link-text">试题管理</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
                    <i class="fa fa-fw fa-sign-out"></i>Logout</a>
            </li>
        </ul>
    </div>
</nav>