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
    <meta name="author" content="VisonChain">
    <title>试题测试</title>
    <!-- Bootstrap core CSS-->
    <link href="<%=contextPath%>/static/adminUI/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="<%=contextPath%>/static/adminUI/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Page level plugin CSS-->
    <link href="<%=contextPath%>/static/adminUI/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="<%=contextPath%>/static/adminUI/css/sb-admin.css" rel="stylesheet">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="">Testpaper Page</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
            data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="开始测试">
                <a class="nav-link" href="/testpaperStart">
                    <i class="fa fa-fw fa-dashboard"></i>
                    <span class="nav-link-text">开始测试</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="错题回顾">
                <a class="nav-link" href="/testpaperReview">
                    <i class="fa fa-fw fa-area-chart"></i>
                    <span class="nav-link-text">错题回顾</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="成绩查询">
                <a class="nav-link" href="/scoreQuery">
                    <i class="fa fa-fw fa-table"></i>
                    <span class="nav-link-text">成绩查询</span>
                </a>
            </li>
        </ul>
    </div>
</nav>


</body>
</html>

