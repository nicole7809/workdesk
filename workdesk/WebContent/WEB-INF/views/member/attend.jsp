<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>근태 사항</title>

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
							<h1 class="col-md-5">근태 사항</h1>
						</div>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>체크인 시간</th>
								<th>체크옷 시간</th>
								<th>체크 상태</th>
							</tr>
						</thead>
						<tbody>
						
						<c:forEach var="article" items="${id}" >  <!-- items 뭘로 써야하는지?? -->
			 				<tr>
								<td width="400">${article.signin}</td>
								<td width="400">${article.signout}</td>
								<td width="150">${article.attend_status}</td>
							</tr>
						</c:forEach>
						
						
						</tbody>
					</table>
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


</html>
