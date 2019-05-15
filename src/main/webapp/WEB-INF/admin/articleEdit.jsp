<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contextPath = request.getContextPath();
%>
<html>
<head>
    <title>文章编辑</title>
    <script src="<%=contextPath%>/static/adminUI/jquery-3.1.1.js"></script>
    <script src="<%=contextPath%>/static/adminUI/editormd/editormd.js"></script>
    <script src="<%=contextPath%>/static/adminUI/bootstrap/js/bootstrap.js"></script>
    <link href="<%=contextPath%>/static/adminUI/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="<%=contextPath%>/static/adminUI/bootstrap/css/bootstrap-theme.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=contextPath%>/static/adminUI/editormd/css/editormd.css"/>
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon"/>
</head>
<body>
<div class="container">
    <form method="post" action="/ad/write">
        <br>
        <br>
        <div class="row">
            <div class="col-lg-6">
                <div class="input-group">
                    <c:choose>
                        <c:when test="${article==null}">
                            <p>标题<input type="text" class="form-control" placeholder="标题" name="title"></p>
                            <p>作者<input type="text" class="form-control" placeholder="作者" name="author"></p>
                            <p>来源<input type="text" class="form-control" placeholder="来源" name="source"></p>
                        </c:when>
                        <c:otherwise>
                            <input name="id" type="hidden" value="${article.id}">
                            <p>标题<input type="text" class="form-control" placeholder="标题" name="title" value="${article.title}"></p>
                            <p>作者<input type="text" class="form-control" placeholder="作者" name="author" value="${article.author}"></p>
                            <p>来源<input type="text" class="form-control" placeholder="来源" name="source" value="${article.source}"></p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <div id="layout" style="width: 100%;height: 100%">
            <div id="test-editormd">
                <c:choose>
                    <c:when test="${article==null}">
                        <textarea style="display:none;" name="content"></textarea>
                    </c:when>
                    <c:otherwise>
                        <textarea style="display:none;" name="content">${article.content}</textarea>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <script type="text/javascript">
            var testEditor;
            $(function () {
                testEditor = editormd("test-editormd", {
                    width: "100%",
                    height: 640,
                    syncScrolling: "single",
                    path: "/static/adminUI/editormd/lib/",
                    imageUpload: true,
                    imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                    imageUploadURL: "./php/upload.php?test=dfdf"

                });
            });
        </script>
        <div class="row">
            <div class="col-md-6 col-md-offset-6">
                <p>
                    <input type="submit" class="btn btn-primary btn-lg" role="button" value="发表">
                </p>
            </div>
        </div>
    </form>
</div>
</body>
</html>
