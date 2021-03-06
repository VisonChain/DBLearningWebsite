<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contextPath = request.getContextPath();
%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Downlaod Page</title>

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

    <style>
        canvas {
            margin: 50px auto;
        }
    </style>


</head>

<body>

<jsp:include page="comm/head.jsp"></jsp:include>
<!-- Page Header -->
<header class="masthead" style="background-image: url('<%=contextPath%>/static/ui/img/home-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                <div class="site-heading">
                    <h1>Resource Download</h1>
                    <span class="subheading">Let's Go Downloading.</span>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Main Content -->
<div class="container">
    <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
            <div class="post-preview">
                <c:forEach begin="0" var="resource" items="${resources}" step="1">
                    <a>
                        <h2 class="post-title">
                                ${resource.prefix}
                        </h2>
                    </a>
                    <p class="post-meta">
                        文件格式：<a>${resource.suffix}</a>
                        <br>
                        文件大小：<a>${resource.size}</a>
                    </p>
                    <form action="${contextPath}/download/resDownload" method="post">
                        <input type="hidden" name="filename" value="${resource.name}">

                        <input class="btn btn-success" type="submit" value="下载">
                    </form>
                    <hr>
                </c:forEach>

            </div>
        </div>
    </div>
</div>

<jsp:include page="comm/foot.jsp"></jsp:include>

</body>

</html>