<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contextPath = request.getContextPath();
%>
<html>
<head>
    <title>试题编辑</title>
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
    <form method="post" action="/ad/testpaperwrite">
        <br>
        <br>
        <div class="row">
            <div class="col-lg-6">
                <div class="input-group">
                    <c:choose>
                        <c:when test="${testpaper==null}">
                            <input type="text" class="form-control" placeholder="问题" name="question">
                            <input type="text" class="form-control" placeholder="答案" name="answer">
                            <input type="text" class="form-control" placeholder="分值" name="value">
                        </c:when>
                        <c:otherwise>
                            <input name="id" type="hidden" value="${testpaper.id}">
                            <input type="text" class="form-control" placeholder="问题" name="question"
                                   value="${testpaper.question}">

                            <input type="text" class="form-control" placeholder="答案" name="answer"
                                   value="${testpaper.answer}">

                            <input type="text" class="form-control" placeholder="分值" name="value"
                                   value="${testpaper.value}">
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <div id="layout" style="width: 100%;height: 100%">
            <div id="test-editormd">
                <c:choose>
                    <c:when test="${testpaper==null}">
                        <textarea style="display:none;" name="category"></textarea>
                    </c:when>
                    <c:otherwise>
                        <textarea style="display:none;" name="category">${testpaper.category}</textarea>
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
