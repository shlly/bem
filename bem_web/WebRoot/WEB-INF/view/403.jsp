<%@ page pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/view/layout/jspHead.jsp"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>403</title>

    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="<%=basePath%>css/animate.css" rel="stylesheet">
    <link href="<%=basePath%>css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">


    <div class="middle-box text-center animated fadeInDown">
        <h1>403</h1>
        <h3 class="font-bold">您没有权限<br />Hasn't got authorize</h3>

        <div class="error-desc">
            对不起，您没有权限访问此网页。<br />
            Sorry, you haven't got enough authorize.
            <form class="form-inline m-t" role="form">
                <a type="button" href="<%=basePath%>home" class="btn btn-primary">返回首页/back to home</a>
            </form>
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="<%=basePath%>js/jquery-2.1.1.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>

</body>

</html>
