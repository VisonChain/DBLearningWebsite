<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contextPath = request.getContextPath();
%>
<html lang="en">
<head>
</head>

<body>
<jsp:include page="comm/paperTest.jsp"></jsp:include>
<div class="content-wrapper">
    <div class="container-fluid">

        <a>
            <p>
                welcome!  ${nickname}
            </p>
        </a>

    <footer class="sticky-footer">
        <div class="container">
            <div class="text-center">
                <small>Designed By VisonChain</small>
            </div>
        </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fa fa-angle-up"></i>
    </a>

    <!-- Bootstrap core JavaScript-->
    <script src="<%=contextPath%>/static/adminUI/vendor/jquery/jquery.min.js"></script>
    <script src="<%=contextPath%>/static/adminUI/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="<%=contextPath%>/static/adminUI/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="<%=contextPath%>/static/adminUI/vendor/datatables/jquery.dataTables.js"></script>
    <script src="<%=contextPath%>/static/adminUI/vendor/datatables/dataTables.bootstrap4.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="<%=contextPath%>/static/adminUI/js/sb-admin.min.js"></script>
    <!-- Custom scripts for this page-->
    <script src="<%=contextPath%>/static/adminUI/js/sb-admin-datatables.min.js"></script>
</div>
</body>
</html>
