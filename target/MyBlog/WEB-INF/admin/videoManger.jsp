<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contextPath = request.getContextPath();
%>
<html lang="en">
<head>
</head>

<body>
<jsp:include page="comm/head.jsp"></jsp:include>

<div class="content-wrapper">
    <div class="container-fluid">
        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a>后台页面</a>
            </li>
            <li class="breadcrumb-item active">视频管理</li>
        </ol>


        <!-- Example DataTables Card-->
        <div class="card mb-3">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>格式</th>
                            <th>名称</th>
                            <td>大小</td>
                            <td>操作1</td>
                            <td>操作2</td>

                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>编号</th>
                            <th>格式</th>
                            <th>名称</th>
                            <td>大小</td>
                            <td>操作1</td>
                            <td>操作2</td>
                        </tr>
                        </tfoot>
                        <tbody>
                        <c:forEach begin="0" var="video" items="${videos}" step="1">
                            <tr>
                                <td>${video.id}</td>
                                <td>${video.suffix}</td>
                                <td>${video.prefix}</td>
                                <td>${video.size}</td>
                                <td>
                                    <form action="${contextPath}/download/videoDownload" method="post">
                                        <input type="hidden" name="filename" value="${video.name}">
                                        <input class="btn btn-success" type="submit" value="下载">
                                    </form>
                                </td>
                                <td><a href="/ad/videoDelete/${video.id}" class="btn btn-danger">删除</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card-footer small text-muted">
                <form action="/upload/videoUpload" method="post" enctype="multipart/form-data">
                    <input type="file" name="upload_videofile">
                    <input class="btn btn-primary btn-block" type="submit" value="视频上传">

                    <div><%=request.getAttribute("error")%></div>
                </form>
            </div>
        </div>
    </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
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
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="/ad/adminLogin">Logout</a>
                </div>
            </div>
        </div>
    </div>
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
