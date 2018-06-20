<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/6/20
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<jsp:forward page="/blog/index"/>--%>
<html>
<head>
    <title>首页</title>
    <%
        pageContext.setAttribute("PATH",request.getContextPath());
    %>
    <link href="${PATH}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${PATH}/js/jquery-3.3.1.min.js"></script>
    <script src="${PATH}/js/popper.min.js"></script>
    <script src="${PATH}/js/bootstrap.min.js"></script>
    <style>
        body{
            display: flex;
            color: #fff;
            text-shadow: 0 0.05rem 0.1rem rgba(0, 0, 0, .5);
            box-shadow: inset 0 0 5rem rgba(0, 0, 0, .5);

        }
        html, body {
            height: 100%;
            background-color: #333;
        }
        .lead {
            font-size: 1.25rem;
            font-weight: 300;
        }
        p {
            margin-top: 0;
            margin-bottom: 1rem;
            display: block;
            -webkit-margin-before: 1em;
            -webkit-margin-after: 1em;
            -webkit-margin-start: 0px;
            -webkit-margin-end: 0px;
        }
    </style>
</head>
<body class="text-center">

<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <header class="masthead mb-auto">
        <div class="inner">
            <h3 class="masthead-brand">Go</h3>
            <nav class="nav nav-masthead justify-content-center">
                <a class="nav-link active" href="#">Home</a>
                <a class="nav-link" href="#">Features</a>
                <a class="nav-link" href="#">Contact</a>
            </nav>
        </div>
    </header>

    <main role="main" class="inner cover">
        <h1 class="cover-heading">Go your page.</h1>
        <p class="lead">
            Cover is a one-page template for building simple and beautiful home<br/>
            pages. Download, edit the text, and add your own fullscreen<br/>
            background photo to make it your own."</p>
        <p class="lead">
            <button type="button" class="btn btn-secondary btn-lg" id="btn_go">
                go
            </button>
        </p>
    </main>

    <footer class="mastfoot mt-auto">
        <div class="inner">
            <p>Cover template for <a href="https://getbootstrap.com/">Bootstrap</a>, by <a href="https://twitter.com/mdo">@mdo</a>.</p>
        </div>
    </footer>
</div>
<script type="text/javascript">
    $("#btn_go").click(function () {
        window.location.href="/blog/index";
    });
</script>
</body>
</html>
