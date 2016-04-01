<%@ page pageEncoding="utf-8" %>

<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element"> <span>
                    <%-- <img alt="image" class="img-circle" src="<%=basePath%>img/profile_small.jpg" /> --%>
                    <i class="fa fa-user" style="font-size: 45px; color: white;"></i>
                     </span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="javascript:void()">
                    <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold"><sec:authentication property="principal.username" /></strong>
                     </span> <span class="text-muted text-xs block">${role} <!-- <b class="caret"></b> --></span> </span> </a>
                    <!-- <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a href="profile.html">个人信息</a></li>
                        <li><a href="contacts.html">联系方式</a></li>
                        <li><a href="mailbox.html">邮箱</a></li>
                        <li class="divider"></li>
                        <li><a href="login.html">退出登录</a></li>
                    </ul> -->
                </div>
                <div class="logo-element">
                    IN+
                </div>
            </li>
            <li class="left1">
                <a href="<%=basePath%>q&a">
                	<i class="fa fa-comments-o"></i><span class="nav-label">问题讨论</span><br/>
                	<i class="fa fa-comments-o" style="opacity: 0;"></i><span class="nav-label">Q&A</span>
                </a>
            </li>
            <li class="left2">
                <a href="<%=basePath%>file">
                	<i class="fa fa-file-text-o"></i><span class="nav-label">文件管理</span><br />
                	<i class="fa fa-file-text-o" style="opacity: 0;"></i><span class="nav-label">File Manage</span>
               	</a>
            </li>
            <li class="left6">
                <a href="<%=basePath%>animation">
                	<i class="fa fa-star-o"></i><span class="nav-label">活动</span><br />
                	<i class="fa fa-star-o" style="opacity: 0;"></i><span class="nav-label">Animation</span>
                	<span class="fa arrow"></span>
                	<ul class="nav nav-second-level collapse">
            			<li class="left11">
			                <a href="<%=basePath%>animation/new">
			                	<span class="nav-label">新建活动</span><br/>
			                	<span class="nav-label">New Animation</span>
			                </a>
			            </li>
            			<li class="left9">
			                <a href="<%=basePath%>animation/all">
			                	<span class="nav-label">全部活动</span><br/>
			                	<span class="nav-label">All Animation</span>
			                </a>
			            </li>
            			<li class="left10">
			                <a href="<%=basePath%>animation/my">
			                	<span class="nav-label">我的活动</span><br/>
			                	<span class="nav-label">My Animation</span>
			                </a>
			            </li>
                	</ul>
               	</a>
            </li>
            <li class="left7">
                <a href="<%=basePath%>data_collection">
                	<i class="fa fa-database"></i><span class="nav-label">数据收集</span><br />
                	<i class="fa fa-database" style="opacity: 0;"></i><span class="nav-label">Data Collection</span>
               	</a>
            </li>
            <li class="left8">
                <a href="<%=basePath%>execution">
                	<i class="fa fa-tasks"></i><span class="nav-label">执行</span><br />
                	<i class="fa fa-tasks" style="opacity: 0;"></i><span class="nav-label">Execution</span>
               	</a>
            </li>
            <sec:authorize access="hasAnyRole('ROLE_HO','ROLE_ADMIN')">
            <li>
            	<a href="#">
            		<i class="fa fa-flash"></i><span class="nav-label">快捷操作</span><br/>
                	<i class="fa fa-flash" style="opacity: 0;"></i><span class="nav-label">Fast Operation</span>
                	<span class="fa arrow"></span>
                	<ul class="nav nav-second-level collapse">
            			<sec:authorize access="hasAnyRole('ROLE_HO','ROLE_ADMIN')">
			            <li class="left3">
			                <a href="<%=basePath%>file/fastUpload">
			                	<i class="fa fa-upload"></i><span class="nav-label">文件上传</span><br/>
			                	<i class="fa fa-upload" style="opacity: 0;"></i><span class="nav-label">File Upload</span>
			                </a>
			            </li>
			            </sec:authorize>
                	</ul>
            	</a>
            </li>
            </sec:authorize>
            <sec:authorize access="hasAnyRole('ROLE_HO','ROLE_ADMIN')">
            <li>
            	<a href="#">
            		<i class="fa fa-wrench"></i><span class="nav-label">管理</span><br/>
                	<i class="fa fa-wrench" style="opacity: 0;"></i><span class="nav-label">Management</span>
                	<span class="fa arrow"></span>
                	<ul class="nav nav-second-level collapse">
                		<li class="left4">
			                <a href="<%=basePath%>manage/topic">
			                	<i class="fa  fa-sitemap"></i><span class="nav-label">主题管理</span><br/>
			                	<i class="fa  fa-sitemap" style="opacity: 0;"></i><span class="nav-label">Topic Manage</span>
			                </a>
			            </li>
                		<li class="left5">
			                <a href="<%=basePath%>manage/authorize">
			                	<i class="fa  fa-users"></i><span class="nav-label">权限管理</span><br/>
			                	<i class="fa  fa-users" style="opacity: 0;"></i><span class="nav-label">Authorize Manage</span>
			                </a>
			            </li>
                	</ul>
            	</a>
            </li>
            </sec:authorize>
        </ul>

    </div>
</nav>