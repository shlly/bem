<%@ page pageEncoding="utf-8" %>

<!-- Mainly scripts -->
<script src="<%=basePath%>js/jquery-2.1.1.js"></script>
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<%-- <script src="<%=basePath%>js/less.min.js"></script> --%>
<script src="<%=basePath%>js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<%=basePath%>js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="<%=basePath%>js/inspinia.js"></script>
<script src="<%=basePath%>js/plugins/pace/pace.min.js"></script>

<!-- Sweet alert -->
<script src="<%=basePath%>js/plugins/sweetalert/sweetalert.min.js"></script>

<script src="<%=basePath%>js/my_js.js"></script>

<script>
$(document).ready(function(){
	$(".left" + "${leftbar}").addClass("active");
	if ($(".left" + "${leftbar}").parent().is("ul")) {
		$(".left" + "${leftbar}").parent().parent().addClass("active");
		$(".left" + "${leftbar}").parent().addClass("in");
	}
});
</script>