<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/resource/etc/color.jsp"%>
<<head>
<title>IDüũ</title>

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
<body bgcolor="">
	<c:if test="">
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr bgcolor="">
				<td height="39">${id}�̹̻������ ���̵��Դϴ�.</td>
			</tr>
		</table>
		<form name="checkForm" method="post"
			action="/workdesk/member/confirmId.do">
			<table width="270" border="0" cellspacing="0" cellpadding="5">
				<tr>
					<td bgcolor="" align="center">�ٸ� ���̵� �����ϼ���.
						<p>
							<input type="text" size="10" maxlength="12" name="id"> <input
								type="submit" value="ID�ߺ�Ȯ��">
					</td>
				</tr>
			</table>
		</form>

	</c:if>
	<c:if test="${check != 1}">
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr bgcolor="${title_c}">
				<td align="center">
					<p>�Է��Ͻ� ${id} �� ����Ͻ� �� �ִ� ID�Դϴ�.</p> <input type="button"
					value="�ݱ�" onclick="setid()">
				</td>
			</tr>
		</table>
	</c:if>
</body>
</html>
<script language="javascript">
	function setid() {
		opener.document.userinput.id.value = "${id}";
		self.close();
	}
</script>