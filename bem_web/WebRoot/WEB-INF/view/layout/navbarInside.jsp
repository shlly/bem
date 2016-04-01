<%@ page pageEncoding="utf-8" %>
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>bem</h2>
        <ol class="breadcrumb">
            <li>
                <a href="<%=basePath%>home">Home</a>
            </li>
            <c:forEach var="breadcrumb" items="${breadcrumbs}" varStatus="status">
	            <c:choose>
	            	<c:when test="${status.index < (fn:length(breadcrumbs) - 1)}">
	            		<li>
	            			<c:choose>
	            				<c:when test="${fn:length(breadcrumb) == 1 or breadcrumb[1] == ''}">
		                			<a href="javascript:void(0)">${breadcrumb[0]}</a>
	            				</c:when>
	            				<c:otherwise>
	            					<a href="<%=basePath%>${breadcrumb[1]}">${breadcrumb[0]}</a>
	            				</c:otherwise>
	            			</c:choose>
		            	</li>
	            	</c:when>
	            	<c:otherwise>
	            		<li class="active">
		                	<strong>${breadcrumb[0]}</strong>
		            	</li>
	            	</c:otherwise>
	            </c:choose>
            </c:forEach>
        </ol>
    </div>
    <div class="col-lg-2">

    </div>
</div>