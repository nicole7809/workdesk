<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>개인 정보 수정</title>

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
							<c:if test="${sessionScope.memId != null}">
								<h1 class="col-md-10">${sessionScope.memId}회원님 &nbsp;
									개인정보</h1>
							</c:if>
						</div>
					</div>
					<form method="post" action="/workdesk/member/modifyPro.do"
						name="userinput" onsubmit="return checkIt()">

						<table width="600" border="1" cellspacing="0" cellpadding="3"
							align="center">
							<tr>
								<td colspan="2" height="39" bgcolor="" align="center">
								<font size="+1"><b>회원 정보수정</b></font>
							</tr>
							<tr>
								<td width="200">사용자 ID</td>
								<td width="400">
								<input type="id" name="id"
									size="10" maxlength="10" value="${c.id}">
								</td>
							</tr>
							<tr>
								<td width="200">비밀번호</td>
								<td width="400">
								<input type="password" name="password"
									size="10" maxlength="10" value="${c.password}">
								</td>
							</tr>
							<tr>
								<td width="200">이름</td>
								<td width="400">${c.name}</td>
							</tr>
							<tr>
								<td width="200">생년월일</td>
								<td width="400">
								<input type="birthday" name="birthday"
									size="10" maxlength="10" value="${c.birthday}">
								</td>
							</tr>
							<tr>
								<td width="200">이메일</td>
								<td width="400">
								<input type="email" name="email"
									size="10" maxlength="10" value="${c.email}">
								</td>
							</tr>
							<tr>
								<td width="200">부석</td>
								<td width="400">${department}</td>
							</tr>
							<tr>
								<td width="200">직책</td>
								<td width="400">${c.job}</td>
							</tr>
							<tr>
								<td width="200">입사날짜</td>
								<td width="400">${c.join_date}</td>
							</tr>
							<tr>
								<td width="200">퇴사날짜</td>
								<td width="400">${c.end_date}</td>
							</tr>

							<tr>
								<td width="200">등급</td>
								<td width="400">${c.level}</td>
							<tr>
							

							<tr>
								<td width="200">비밀번호</td>
								<td width="400">
								<input type="password" name="password"
									size="10" maxlength="10" value="${c.password}">
								</td>
							<tr>
							
							<tr>
								<td colspan="2" align="center" bgcolor="${value_c}"><input
									type="submit" name="modify" value="수   정"> <input
									type="button" value="취  소"
									onclick="javascript:window.location='/workdesk/member/information.do'">
								</td>
							</tr>

						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>