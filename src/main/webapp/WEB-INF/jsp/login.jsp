<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/6/18
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录界面</title>
    <meta charset="utf-8">
    <%
        pageContext.setAttribute("PATH",request.getContextPath());
    %>
    <link href="${PATH}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${PATH}/js/jquery-3.3.1.min.js"></script>
    <script src="${PATH}/js/bootstrap.min.js"></script>
    <style>
        header{
            width: 100%;
            height: 200px;
        }
        footer{
            width: 100%;
            height:50px;   /* footer的高度一定要是固定值*/
            position:absolute;
            bottom:0px;
        }
    </style>
</head>
<body>
    <header>

    </header>
    <div class="container justify-content-center">
        <div class="row">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="">Id and Password</span>
                </div>
                <input type="text" class="form-control" placeholder="Id" id="login_id" name="id">
                <input type="password" class="form-control" placeholder="Password" id="login_password" name="password">
            </div>
        </div>
        <div class="row justify-content-center" id="login_alert">
            <%--<p id="login_alert"></p>--%>
        </div>
        <div class="row">
            <button type="button" class="btn btn-secondary btn-block" id="login_btn">登录</button>
        </div>
    </div>
    <script type="text/javascript">
        $("#login_btn").click(function () {
            if ($("#login_id").val() == '' && $("#login_password").val() == '') {
                $("#login_alert").addClass("p-1 mb-1 bg-warning text-dark").text("Id和密码都不能为空!!!");
            }else if ($("#login_id").val() == '') {
                $("#login_alert").addClass("p-1 mb-1 bg-warning text-dark").text("Id不能为空!!!");
            }else if ($("#login_password").val() == '') {
                $("#login_alert").addClass("p-1 mb-1 bg-warning text-dark").text("密码不能为空!!!");
            }else if (isNaN($("#login_id").val())) {
                $("#login_alert").addClass("p-1 mb-1 bg-warning text-dark").text("Id必须为数字!!!");
            }else{
                $.ajax({
                    url:"${PATH}/admin/login",
                    type:"POST",
                    data:{
                        id:$("#login_id").val(),
                        password:$("#login_password").val()
                    },
                    dataType:"json",
                    success:function (result) {
                        // alert(result.stateCode);
                        if (result.stateCode == 0) {
                            $("#login_alert").removeClass("p-1 mb-1 bg-warning text-dark")
                                .addClass("p-1 mb-1 bg-danger text-white").text("没有该用户!!!");
                        }else if (result.stateCode == 1) {
                            $("#login_alert").removeClass("p-1 mb-1 bg-warning text-dark")
                                .addClass("p-1 mb-1 bg-danger text-white").text("密码错误!!!");
                        }else {
                            window.location.href="/main";
                        }
                    }
                });
            }
        });
    </script>
</body>
</html>
