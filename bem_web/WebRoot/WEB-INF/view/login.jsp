<%@ page pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/view/layout/jspHead.jsp"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>login</title>

    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="<%=basePath%>css/animate.css" rel="stylesheet">
    <link href="<%=basePath%>css/style.css" rel="stylesheet">
    
    <link href="<%=basePath%>css/my_style.css" rel="stylesheet">
    
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/login/component.css" />
    
    <!--[if IE]>
		<script src="<%=basePath%>js/login/html5.js"></script>
	<![endif]-->
    
    <sec:csrfMetaTags/>

</head>

<body class="gray-bg">
	<div id="large-header" class="large-header" style="position: fixed; z-index: 0;
				width: 100%; height: 100%;">
	<canvas id="demo-canvas"></canvas>
	</div>
	<div class="container">
	<div class="row animated fadeInDown">
		<!-- <div class="col-md-6 col-md-offset-3">
			<h1 class="logo-name">Auchan</h1>
		</div> -->
		<div class="col-md-12 logoPic">
			<img src="<%=basePath%>img/Auchan-logo.png">
		</div>
	</div>
	
    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <h3>欢迎使用bem系统</h3>
            <h3>Welcome bem System</h3>
            <p>
                <!--Continually expanded and constantly improved Inspinia Admin Them (IN+)-->
            </p>
            <!-- <p>现在登录</p> -->
            <form class="m-t" role="form" action="<%=basePath%>login" method="post">
            	
            	<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
            	
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="username" required="" name="username" value="${username}">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="password" required="" name="password">
                </div>
                <c:if test="${error}">
                	<p class="text-muted text-center animated shake" style="color: #ed5565;">
                		<strong>用户名/密码错误！！<br/>username/password wrong !!</strong>
               		</p>
                </c:if>
                <button type="submit" class="btn btn-primary block full-width m-b">登录/Login</button>
                <!-- <a href="#"><small style="cursor: pointer;">忘记密码?</small></a>
                <p class="text-muted text-center"><small>没有账户?</small></p>
                <a class="btn btn-sm btn-white btn-block" href="#">创建账户</a> -->
            </form>
            <p class="m-t"> <small><strong>Copyright</strong> Auchan All Rights Reserved. &copy; <span id="copyRightYear"></span></small> </p>
            <p class="m-t"> <small><strong>Designed By</strong> INSPINIA v2.4 &copy; 2014-2015</small></p>
        </div>
    </div>
    </div>

    <!-- Mainly scripts -->
    <script src="<%=basePath%>js/jquery-2.1.1.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    
    <script src="<%=basePath%>js/login/TweenLite.min.js"></script>
	<script src="<%=basePath%>js/login/EasePack.min.js"></script>
	<script src="<%=basePath%>js/login/rAF.js"></script>
	<script src="<%=basePath%>js/login/demo-3.js"></script>
    
    <script>
    	//copyright year
		$("#copyRightYear").html((new Date()).getFullYear());
    </script>

</body>

</html>
