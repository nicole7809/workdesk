<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<head>
<title>정보 입력</title>

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
</head>

<script language="JavaScript">
	function checkIt() {
		var userinput = eval("document.userinput");
		if (!userinput.id.value) {
			alert("ID를 입력하세요");
			return false;
		}

		if (!userinput.password.value) {
			alert("비밀번호를 입력하세요");
			return false;
		}
		if (userinput.password.value != userinput.password2.value) {
			alert("비밀번호를 동일하게 입력하세요");
			return false;
		}

		if (!userinput.username.value) {
			alert("사용자 이름을 입력하세요");
			return false;
	
		}
	}

	// 아이디 중복 여부를 판단
	function openConfirmid(userinput) {
		// 아이디를 입력했는지 검사
		if (userinput.id.value == "") {
			alert("아이디를 입력하세요");
			return;
		}
		// url과 사용자 입력 id를 조합합니다.
		url = "/workdesk/member/confirmId.do?id=" + userinput.id.value;

		// 새로운 윈도우를 엽니다.
		open(
				url,
				"confirm",
				"toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
	}

	function ajaxConfirmid(userinput) {
		$.ajax({
			url : "/workdesk/member/confirmId2.do",
			data : {
				id : $("#id").val()
			},
			success : function(result) {
				if (result == '1') {
					$("#confirm").html("<font color=red>사용불가</font>");
				} else {
					$("#confirm").html("<font color=green>사용가능</font>");
				}
			}
		});
	}
</script>
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
							<h2>회원정보입력</h2>
						</div>
					</div>
					<form method="post" action="/workdesk/member/inputPro.do"
						name="userinput" onSubmit="return checkIt()">
						<table width="600" border="1" cellspacing="0" cellpadding="3"
							align="center">
							<tr>
								<td colspan="2" height="39" align="center" bgcolor=""><font
									size="+1"><b>가입</b></font></td>
							</tr>
							<tr>
								<td width="200">사용자 ID</td>
								<td width="400"><input type="text" name="id" size="10"
									maxlength="12" id="id"> <input type="button"
									name="confirm_id" value="ID중복확인"
									OnClick="ajaxConfirmid(this.form)"> <label id="confirm"></label></td>
							</tr>
							<tr>
								<td width="200">비밀번호</td>
								<td width="400"><input type="password" name="password"
									size="15" maxlength="12"></td>
							<tr>
								<td width="200">비밀번호 확인</td>
								<td width="400"><input type="password" name="password2"
									size="15" maxlength="12"></td>
							</tr>

							<tr>

								<td width="200">사원 이름</td>
								<td width="400"><input type="text" name="name" size="15"
									maxlength="10"></td>
							</tr>

							<tr>
								<td width="200">생년월일</td>
								<td width="400"><input type="date" name="birthday"
									size="15" maxlength="10"></td>
							</tr>
							<tr>
								<td width="200">이메일</td>
								<td width="400"><input type="text" name="email" size="15"
									maxlength="10"></td>
							</tr>
							<tr>
								<td width="200">부석</td>
								<td width="400"><input type="text" name="department"
									size="15" maxlength="10"></td>
							</tr>
							<tr>
								<td width="200">직책</td>
								<td width="400"><input type="text" name="job" size="15"
									maxlength="10"></td>
							</tr>
							<tr>
								<td width="200">입사날짜</td>
								<td width="400"><input type="date" name="join_date"
									size="15" maxlength="10"></td>
							</tr>
							<tr>
								<td width="200">퇴사날짜</td>
								<td width="400"><input type="date" name="end_date"
									size="15" maxlength="10"></td>
							</tr>

							<tr>
								<td width="200">등급</td>
								<td width="400">
									<select name="level">
										<c:forEach items="${level}" var="dto">
											<option value="${dto.level}">${dto.department}</option>
										</c:forEach>
									</select>
								</td>
							<tr>
							<tr>
								<td colspan="2" align="center" bgcolor=""><input
									type="submit" name="confirm" value="등   록"> <input
									type="reset" name="reset" value="다시입력"> <input
									type="button" value="가입안함"
									onclick="javascript:window.location='/workdesk/member/loginForm.do'"></td>
							</tr>

						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>