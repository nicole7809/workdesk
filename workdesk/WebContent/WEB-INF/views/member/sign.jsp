<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>체크인/체크아웃</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resource/css/bootstrap.min.css">
<!-- JQuery  bootstrap.js-->
<script
	src="<%=request.getContextPath()%>/resource/script/jquery-3.2.1.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resource/script/bootstrap.min.js"></script>

<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>

</head>
<body>
	<!-- top -->
	<jsp:include page="top.jsp"></jsp:include>
	<!-- menu -->
	<div class="container" id="content">
		<div class="row">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="col-md-10">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="row">
							<h2 class="col-md-10">체크인/체크아웃</h2>
						</div>
					</div>
					<br> <br>
					<p>
						<input id="sign_in" type="button" class="btn btn-primary btn-lg"
							style="margin-left: 50px;" value="체크인"
							onclick="javascript:window.location='/workdesk/member/signRecord.do'">
						<input id="sign_out" type="button" class="btn btn-primary btn-lg"
							style="margin-left: 260px;" value="체크아웃"
							onclick="javascript:window.location='/workdesk/member/signRecord.do'">

					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="container" id="footer">
		<div class="row">
			<div class="col-md-12"></div>
		</div>
	</div>
</body>


<script type="text/javascript">
    $("#nav li:nth-child(2)").addClass("active");
	$("#sign_in").click(function () {
        var url = "<%=request.getContextPath()%>/member/signIn";
        $.post(url,function (data) {
            alert("체크인 성공\n"+"체크인 시간:"+data);
        });

	});
    $("#sign_out").click(function () {
        var url = "<%=request.getContextPath()%>
	/member/signOut";
		$.post(url, function(data) {
			alert(data);
		});
	});
</script>

</html>