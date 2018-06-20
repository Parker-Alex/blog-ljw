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
        body{
            /*color: rgba(255, 255, 255, 0.65);*/
            color: black;
            /*background-color: #24292e;*/
        <%--background-image: url(${PATH}/images/star-bg.svg),linear-gradient(#191c20, #24292e 15%);--%>
            font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";
            font-size: 14px;
            line-height: 1.5;
        }
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
        <div class="pos-f-t">
            <div class="collapse" id="navbarToggleExternalContent">
                <nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
                    <a class="navbar-brand" href="/index.jsp">主页</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="/blog/login">登录</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Dropdown
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" href="#">Disabled</a>
                            </li>
                        </ul>
                        <form class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                        </form>
                    </div>
                </nav>
            </div>
            <nav class="navbar navbar-dark bg-secondary">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </nav>
        </div>
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
        <div class="row justify-content-center p-1 mb-1" id="login_alert" role="alert">
            <%--<p id="login_alert"></p>--%>
        </div>
        <div class="row">
            <button type="button" class="btn btn-secondary btn-block" id="login_btn">登录</button>
        </div>
    </div>

    <footer class="text-center">
        <p>© 2018 ljw. web</p>
    </footer>

    <script type="text/javascript">
        $("#login_btn").click(function () {
            if ($("#login_id").val() == '' && $("#login_password").val() == '') {
                $("#login_alert").removeClass("alert-danger")
                    .addClass("alert alert-warning")
                    .text("Id和密码都不能为空!!!");
            }else if ($("#login_id").val() == '') {
                $("#login_alert").removeClass("alert-danger")
                    .addClass("alert alert-warning")
                    .text("Id不能为空!!!");
            }else if ($("#login_password").val() == '') {
                $("#login_alert").removeClass("alert-danger")
                    .addClass("alert alert-warning")
                    .text("密码不能为空!!!");
            }else if (isNaN($("#login_id").val())) {
                $("#login_alert").removeClass("alert-danger")
                    .addClass("alert alert-warning")
                    .text("Id必须为数字!!!");
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
                            $("#login_alert").removeClass("alert-warning")
                                .addClass("alert alert-danger")
                                .text("没有该用户!!!");
                        }else if (result.stateCode == 1) {
                            $("#login_alert").removeClass("alert-warning")
                                .addClass("alert alert-danger")
                                .text("密码错误!!!");
                        }else {
                            window.location.href="/admin/main";
                        }
                    }
                });
            }
        });
    </script>
</body>
</html>
