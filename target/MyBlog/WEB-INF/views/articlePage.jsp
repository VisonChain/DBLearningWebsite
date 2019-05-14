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

<title>Article Page</title>


<body>
<jsp:include page="comm/head.jsp"></jsp:include>

<!-- Page Header -->
<header class="masthead" style="background-image: url('<%=contextPath%>/static/ui/img/about-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                <div class="page-heading">
                    <h1>Database Artiles</h1>
                    <span class="subheading">This is a total of articles.</span>
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
                <c:forEach var="article" items="${articles}" begin="0" step="1">
                    <a href="detail/${article.id}">
                        <h2 class="post-title">
                                ${article.title}
                        </h2>
                        <h3 class="post-subtitle">
                                ${article.summary}
                        </h3>
                    </a>
                    <p class="post-meta">Posted by
                        <a>${article.author}</a>
                        on<a> ${article.source}</a>
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
