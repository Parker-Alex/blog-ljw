<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/6/20
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加文章界面</title>
    <%
        pageContext.setAttribute("PATH",request.getContextPath());
    %>
    <link href="${PATH}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${PATH}/js/jquery-3.3.1.min.js"></script>
    <script src="${PATH}/js/bootstrap.min.js"></script>
    <script src="${PATH}/js/release/wangEditor.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-8">
                <form method="post" action="">
                    <div class="form-group">
                        <label for="title">文章标题</label>
                        <input type="text" class="form-control" name="title" id="title" placeholder="Example input">
                    </div>
                    <div class="form-group">
                        <label for="keywords">关键字</label>
                        <input type="text" class="form-control" name="keywords" id="keywords" placeholder="Another input">
                    </div>
                    <div class="form-group">
                        <label for="describle">文章描述</label>
                        <input type="text" class="form-control" name="describle" id="describle" placeholder="Another input">
                    </div>
                    <%--<div class="form-group">--%>
                        <%--<label>类型：</label>--%>
                        <%--<div class="custom-control custom-radio custom-control-inline">--%>
                            <%--<input type="radio" id="customRadioInline1" name="catalogId" class="custom-control-input" value="0" checked="checked">--%>
                            <%--<label class="custom-control-label" for="customRadioInline1">列表</label>--%>
                        <%--</div>--%>
                        <%--<div class="custom-control custom-radio custom-control-inline">--%>
                            <%--<input type="radio" id="customRadioInline2" name="catalogId" class="custom-control-input" value="1">--%>
                            <%--<label class="custom-control-label" for="customRadioInline2">留言</label>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <div class="form-group">
                        <label><strong>内容</strong></label>
                        <%--<input type="text" class="form-control" name="content" id="content" placeholder="Another input">--%>
                        <div style="display: none">
                            <textarea id="text1" style="width:100%; height:600px;"></textarea>
                        </div>
                        <div id="div1"></div>
                    </div>
                    <button type="submit" class="btn btn-success" id="btn_addArticle">提交</button>
                    </form>
            </div>
        </div>
    </div>
    <script>
        var E = window.wangEditor
        var editor = new E('#div1')
        var $text1 = $('#text1')
        editor.customConfig.onchange = function (html) {
            // 监控变化，同步更新到 textarea
            $text1.val(html)
        }
        editor.create();
        // 初始化 textarea 的值
        $text1.val(editor.txt.html());

        $("#btn_addArticle").click(function () {
            // alert($("#text1").val());
            <%--$.ajax({--%>
               <%--url:"${PATH}/article/add_do",--%>
               <%--data:{ title:"111"},--%>
               <%--type:"POST",--%>
               <%--success:function (result) {--%>
                   <%--alert(result.title);--%>
               <%--}--%>
            <%--});--%>
        });
    </script>
</body>
</html>
