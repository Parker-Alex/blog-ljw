<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/6/18
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--导入标签库--%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>用户界面</title>
    <meta charset="utf-8">
    <%
        pageContext.setAttribute("PATH",request.getContextPath());
    %>
    <link href="${PATH}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${PATH}/js/jquery-3.3.1.min.js"></script>
    <script src="${PATH}/js/popper.min.js"></script>
    <script src="${PATH}/js/bootstrap.min.js"></script>
    <script src="${PATH}/js/layer/layer.js"></script>
    <style>
        body{
            /*color: rgba(255, 255, 255, 0.65);*/
            /*color: black;*/
            /*background-color: #24292e;*/
            <%--background-image: url(${PATH}/images/star-bg.svg),linear-gradient(#191c20, #24292e 15%);--%>
            font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";
            font-size: 14px;
            line-height: 1.5;
        }
        header{
            width: 100%;
            height: 100px;
            margin: auto;
        }
        footer{
            width: 100%;
            height:40px;   /* footer的高度一定要是固定值*/
            position:absolute;
            bottom:0px;
            color: black;
        }
    </style>
</head>
<body>
    <%--头部--%>
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="/index.jsp">首页</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            新建
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="javascript:void(0)" onclick="addArticle('添加文章','/article/add')">文章</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="/blog/loginOut">退出</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>
    </header>

    <%--中间内容--%>
    <div class="container">
        <div class="row justify-content-start">
            <div class="col-2">
                <div class="list-group" id="list-tab" role="tablist">
                    <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">登录信息</a>
                    <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">上次登录信息</a>
                    <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">修改密码</a>
                    <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">Settings</a>
                </div>
            </div>
            <div class="col-3">
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
                        <ul class="list-group">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                用户名称
                                <span class="badge badge-secondary badge-pill">${adminName}</span>
                            </li>
                            <%--<li class="list-group-item d-flex justify-content-between align-items-center">--%>
                                <%--登录IP--%>
                                <%--<span class="badge badge-secondary badge-pill">${clientIp}</span>--%>
                            <%--</li>--%>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                主机IP
                                <span class="badge badge-secondary badge-pill">${hostIp}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                登录时间
                                <span class="badge badge-secondary badge-pill">${date}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                登录次数
                                <span class="badge badge-secondary badge-pill">${loginNumber}</span>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
                        <ul class="list-group">
                            <%--<li class="list-group-item d-flex justify-content-between align-items-center">--%>
                                <%--用户名称--%>
                                <%--<span class="badge badge-secondary badge-pill">${adminName}</span>--%>
                            <%--</li>--%>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                上次登录IP
                            <span class="badge badge-secondary badge-pill">${adminLoginLog.ip}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                本次登录IP
                                <span class="badge badge-secondary badge-pill">${clientIp}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                上次登录时间
                                <span class="badge badge-secondary badge-pill">${adminLoginLog.lastDate}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                登录端口
                                <span class="badge badge-secondary badge-pill">${port}</span>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">
                        <div class="col-8 justify-content-center">
                            <label class="sr-only" for="inlineFormInputGroupUsername2">Username</label>
                            <div class="input-group mb-2 mr-sm-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">*</div>
                                </div>
                                <input type="text" class="form-control" id="inlineFormInputGroupUsername1" placeholder="Username">
                            </div>
                            <label class="sr-only" for="inlineFormInputGroupUsername2">Username</label>
                            <div class="input-group mb-2 mr-sm-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">*</div>
                                </div>
                                <input type="text" class="form-control" id="inlineFormInputGroupUsername2" placeholder="Username">
                            </div>
                            <div class="input-group mb-2 mr-sm-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">$</div>
                                </div>
                                <input type="text" class="form-control" id="inlineFormInputGroupUsername3" placeholder="Username">
                            </div>
                            <button type="submit" class="btn btn-primary mb-2">Submit</button>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">...</div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">

        </div>
    </div>

    <%--尾部--%>
    <footer class="text-center">
        <p>© 2018 ljw. web</p>
    </footer>

    <script type="text/javascript">
        function addArticle(title,url){
            var index = layer.open({
                type: 2,
                title: title,
                maxmin: true,
                // shadeClose: true, //点击遮罩关闭层
                area : ['70%' , '100%'],
                content: url
            });
            layer.full(index);
        }
        $("#btn_addArticle").click(function () {
            alert("111");
            layer.close();
        });
    </script>
</body>
</html>
