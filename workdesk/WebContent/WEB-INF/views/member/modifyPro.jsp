<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resource/css/bootstrap.min.css">
<!-- JQuery  bootstrap.js-->
<script
	src="<%=request.getContextPath()%>/resource/scripts/jquery-3.2.1.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resource/scripts/bootstrap.min.js"></script>
<body>
	<!-- top -->
	<jsp:include page="top.jsp"></jsp:include>
	<!-- menu -->
	<div class="container" id="content">
		<div class="row">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="col-md-10">

				<jsp:useBean id="member"
					class="workdesk.member.model.MemberDataBean">
					<jsp:setProperty name="member" property="*" />
				</jsp:useBean>


				<link href="style.css" rel="stylesheet" type="text/css">

				<table width="270" border="0" cellspacing="0" cellpadding="50"
					align="center">
					<tr bgcolor="">
						<td height="39" align="center"><font size="+1">
						<b>회원정보가
									수정되었습니다.</b></font></td>
					</tr>
					<tr>
						<td bgcolor="" align="center">
							<p>입력하신 내용대로 수정이 완료되었습니다.</p>
						</td>
					</tr>
					<tr>
						<td bgcolor="" align="center">
							<form>
								<input type="button" value="메인으로"
									onclick="window.location='/workdesk/member/information.do'">
							</form> 5초후에 메인으로 이동합니다.
							<meta http-equiv="Refresh" content="5;url=/workdesk/member/information.do">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
