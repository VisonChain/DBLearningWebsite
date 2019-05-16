<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contextPath = request.getContextPath();
    int x = 1;
    int w = 0;
    int t = 1;
    int y = 1;
    int u = 1;
    int i = 1;
%>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>测试结果</title>
    <link href="<%=contextPath%>/static/testpaper/main.css" rel="stylesheet" type="text/css"/>
    <link href="<%=contextPath%>/static/testpaper/iconfont.css" rel="stylesheet" type="text/css"/>
    <link href="<%=contextPath%>/static/testpaper/test.css" rel="stylesheet" type="text/css"/>

    <style>
        .hasBeenAnswer {
            background: #5d9cec;
            color: #fff;
        }

    </style>
</head>
<script>

</script>

<body>
<div class="main">
    <!--nr start-->
    <div class="test_main">
        <div class="nr_left">
            <div class="test">
                    <div class="test_content">
                        <div class="test_content_title">
                            <h2>本次答题错题</h2>
                        </div>
                    </div>
                <div class="test_content_nr">
                    <ul>
                        <c:forEach var="testpaper" items="${errorTestpapers}" begin="0" step="1">
                            <li id="qu_0_<%=w++%>">
                                <div class="test_content_nr_tt">
                                    <i><%=x++%>
                                    </i><span>(${testpaper.fenshu}分)</span><font>${testpaper.question}(正确答案 ${testpaper.answer})</font><b
                                        class="icon iconfont">&#xe881;</b>
                                </div>

                                <div class="test_content_nr_main">
                                    <ul>
                                        <li class="option">
                                            <label>
                                                A.
                                                <p class="ue" style="display: inline;">${testpaper.a}</p>
                                            </label>
                                        </li>

                                        <li class="option">
                                            <label>
                                                B.
                                                <p class="ue" style="display: inline;">${testpaper.b}</p>
                                            </label>
                                        </li>

                                        <li class="option">
                                            <label>
                                                C.
                                                <p class="ue" style="display: inline;">${testpaper.c}</p>
                                            </label>
                                        </li>

                                        <li class="option">
                                            <label>
                                                D.
                                                <p class="ue" style="display: inline;">${testpaper.d}</p>
                                            </label>
                                        </li>

                                    </ul>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

        <div class="nr_right">
            <div class="nr_rt_main">
                <div class="rt_nr1">
                    <div class="rt_nr1_title">
                        得分:${count}
                    </div>

                    <div class="rt_content">


                    </div>

                </div>
            </div>
        </div>
    </div>
    <!--nr end-->
    <div class="foot"></div>
</div>

<script src="<%=contextPath%>/static/testpaper/jquery-1.11.3.min.js"></script>
<script src="<%=contextPath%>/static/testpaper/jquery.easy-pie-chart.js"></script>
<!--时间js-->
<script src="<%=contextPath%>/static/testpaper/time/jquery.countdown.js"></script>
<script>
    window.jQuery(function ($) {
        "use strict";

        $('time').countDown({
            with_separators: false
        });
        $('.alt-1').countDown({
            css_class: 'countdown-alt-1'
        });
        $('.alt-2').countDown({
            css_class: 'countdown-alt-2'
        });

    });

</script>
<div style="text-align:center;">
</div>

</body>

</html>