<%@ page pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/view/layout/jspHead.jsp"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>500</title>

    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="<%=basePath%>css/animate.css" rel="stylesheet">
    <link href="<%=basePath%>css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">


    <div class="middle-box text-center animated fadeInDown">
        <h1>500</h1>
        <h3 class="font-bold">服务器错误<br />Error</h3>

        <div class="error-desc">
            很抱歉，服务器发生异常<br/>
            Sorry, there are something wrong<br/>
            <a href="<%=basePath%>home" class="btn btn-primary m-t">返回首页/back to home</a>
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="<%=basePath%>js/jquery-2.1.1.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>

</body>

</html>
