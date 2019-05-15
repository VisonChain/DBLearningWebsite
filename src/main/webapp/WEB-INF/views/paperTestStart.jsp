<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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

    <title>在线测试</title>
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
                <form action="" method="post">
                    <div class="test_title">
                        <p class="test_time">
                            <i class="icon iconfont">&#xe6fb;</i><b class="alt-1">01:40</b>
                        </p>
                        <font><input type="button" name="test_jiaojuan" value="交卷"></font>
                    </div>

                    <div class="test_content">
                        <div class="test_content_title">
                            <h2>单选题</h2>
                            <p>
                                <span>共</span><i class="content_lit">20</i><span>题，</span><span>合计</span><i
                                    class="content_fs">100</i><span>分</span>
                            </p>
                        </div>
                    </div>
                    <div class="test_content_nr">
                        <ul>
                            <c:forEach var="testpaper" items="${testpapers}" begin="0" step="1">
                                <li id="qu_0_<%=w++%>">
                                    <div class="test_content_nr_tt">
                                        <i><%=x++%></i><span>(${testpaper.value}分)</span><font>${testpaper.question}</font><b
                                            class="icon iconfont">&#xe881;</b>
                                    </div>

                                    <div class="test_content_nr_main">
                                        <ul>
                                            <li class="option">
                                                <input type="radio" class="radioOrCheck" name="a<%=t++%>"
                                                       id="0_answer_1_option_1" value="A"
                                                />
                                                <label for="0_answer_1_option_1">
                                                    A.
                                                    <p class="ue" style="display: inline;">${testpaper.a}</p>
                                                </label>
                                            </li>

                                            <li class="option">

                                                <input type="radio" class="radioOrCheck" name="a<%=y++%>"
                                                       id="0_answer_1_option_2" value="B"
                                                />
                                                <label for="0_answer_1_option_2">
                                                    B.
                                                    <p class="ue" style="display: inline;">${testpaper.b}</p>
                                                </label>
                                            </li>

                                            <li class="option">

                                                <input type="radio" class="radioOrCheck" name="a<%=u++%>"
                                                       id="0_answer_1_option_3" value="C"
                                                />
                                                <label for="0_answer_1_option_3">
                                                    C.
                                                    <p class="ue" style="display: inline;">${testpaper.c}</p>
                                                </label>
                                            </li>

                                            <li class="option">

                                                <input type="radio" class="radioOrCheck" name="a<%=i++%>"
                                                       id="0_answer_1_option_4" value="D"
                                                />
                                                <label for="0_answer_1_option_4">
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
                </form>
            </div>
        </div>

        <div class="nr_right">
            <div class="nr_rt_main">
                <div class="rt_nr1">
                    <div class="rt_nr1_title">
                        <h1>
                            <i class="icon iconfont">&#xe692;</i>答题卡
                        </h1>
                        <p class="test_time">
                            <i class="icon iconfont">&#xe6fb;</i><b class="alt-1">01:40</b>
                        </p>
                    </div>

                    <div class="rt_content">
                        <div class="rt_content_tt">
                            <h2>单选题</h2>
                            <p>
                                <span>共</span><i class="content_lit">20</i><span>题</span>
                            </p>
                        </div>
                        <div class="rt_content_nr answerSheet">
                            <ul>
                                <li><a href="#qu_0_0">1</a></li>

                                <li><a href="#qu_0_1">2</a></li>

                                <li><a href="#qu_0_2">3</a></li>

                                <li><a href="#qu_0_3">4</a></li>

                                <li><a href="#qu_0_4">5</a></li>

                                <li><a href="#qu_0_5">6</a></li>

                                <li><a href="#qu_0_6">7</a></li>

                                <li><a href="#qu_0_7">8</a></li>

                                <li><a href="#qu_0_8">9</a></li>

                                <li><a href="#qu_0_9">10</a></li>

                                <li><a href="#qu_0_10">11</a></li>

                                <li><a href="#qu_0_11">12</a></li>

                                <li><a href="#qu_0_12">13</a></li>

                                <li><a href="#qu_0_13">14</a></li>

                                <li><a href="#qu_0_14">15</a></li>

                                <li><a href="#qu_0_15">16</a></li>

                                <li><a href="#qu_0_16">17</a></li>

                                <li><a href="#qu_0_17">18</a></li>

                                <li><a href="#qu_0_18">19</a></li>

                                <li><a href="#qu_0_19">20</a></li>

                            </ul>
                        </div>
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


    $(function () {
        $('li.option label').click(function () {
            debugger;
            var examId = $(this).closest('.test_content_nr_main').closest('li').attr('id'); // 得到题目ID
            var cardLi = $('a[href=#' + examId + ']'); // 根据题目ID找到对应答题卡
            // 设置已答题
            if (!cardLi.hasClass('hasBeenAnswer')) {
                cardLi.addClass('hasBeenAnswer');
            }

        });
    });
</script>
<div style="text-align:center;">
</div>

</body>

</html>