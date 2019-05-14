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

    <title>Video Page</title>

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

<jsp:include page="comm/head.jsp"></jsp:include>
<!-- Page Header -->
<header class="masthead" style="background-image: url('<%=contextPath%>/static/ui/img/home-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                <div class="site-heading">
                    <h1>Video Play</h1>
                    <span class="subheading">Let's Go Watching.</span>
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
                <c:forEach var="video" items="${videos}" begin="0" step="1">
                    <a href="/videoPlay/${video.id}" target="_blank">
                        <h2 class="post-title">
                                ${video.prefix}
                        </h2>
                    </a>
                    <p class="post-meta">
                        视频格式：<a>${video.suffix}</a>
                        <br>
                        视频大小：<a>${video.size}</a>
                    </p>
                    <hr>
                </c:forEach>
            </div>
        </div>
    </div>
</div>


<jsp:include page="comm/foot.jsp"></jsp:include>

</body>

</html>