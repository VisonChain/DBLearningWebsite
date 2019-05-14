<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String contextPath = request.getContextPath();
%>
<html lang="en" class="no-js">

<head>
  <meta charset="utf-8">
  <title>Admin Login</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="VisonChain">

  <!-- CSS -->
  <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
  <link rel="stylesheet" href="<%=contextPath%>/static/assets/css/reset.css">
  <link rel="stylesheet" href="<%=contextPath%>/static/assets/css/supersized.css">
  <link rel="stylesheet" href="<%=contextPath%>/static/assets/css/style.css">

  <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
  <!--[if lt IE 9]>
  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

</head>

<body>

<div class="page-container">
  <h1>Login</h1>
  <form action="/ad/adminLoginAction" method="post">
    <input type="text" name="username" class="username" placeholder="Username">
    <input type="password" name="password" class="password" placeholder="Password">
    <button type="submit">登录</button>
    <div class="error"><span>+</span></div>
  </form>
</div>


<!-- Javascript -->
<script src="<%=contextPath%>/static/assets/js/jquery-1.8.2.min.js"></script>
<script src="<%=contextPath%>/static/assets/js/supersized.3.2.7.min.js"></script>
<script src="<%=contextPath%>/static/assets/js/supersized-init.js"></script>
<script src="<%=contextPath%>/static/assets/js/scripts.js"></script>

</body>

</html>