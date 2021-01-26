<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title>로그인</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- 引入bootstrap -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/bootstrap.min.css">
	<!-- 引入JQuery  bootstrap.js-->
	<script src="<%=request.getContextPath()%>/resource/script/jquery-3.2.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/resource/script/bootstrap.min.js"></script>
	<style type="text/css">
	body{
	   background: url(<%=request.getContextPath()%>/resource/etc/images/a.jpg)repeat;
	}
	#login-box {
		/*border:1px solid #F00;*/
		padding: 35px;
		border-radius:15px;
		background: #56666B;
		color: #fff;
	}

	</style>
</head>
<body>
	<div class="container" id="top">
		<p style="font-size: xx-large;flood-color: #2b569a;margin-top: 150px;" class="text-center">근태 시스템 로그인</p>
		<div class="row" style="margin-top: 20px; ">
			<div class="col-md-4"></div>
			<div class="col-md-4" id="login-box">
				<form class="form-horizontal" role="form" action="<%=request.getContextPath()%>/member/loginPro.do" id="from1" method="post">
				  <div class="form-group">
				    <label for="staffId" class="col-sm-3 control-label">아이디</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="staffId" placeholder="ID입력 하세요~!" name="id">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="password" class="col-sm-3 control-label">비밀번호</label>
				    <div class="col-sm-9">
				      <input type="password" class="form-control" id="password" placeholder="비밀번호 입력하세요~!" name="password">
				    </div>
				  </div>
				  <%--<div class="form-group">--%>
				    <%--<div class="col-sm-offset-2 col-sm-10">--%>
				      <%--<div class="checkbox">--%>
				        <%--<label class="checkbox-inline">--%>
							<%--<input type="radio" name="role" value="1" checked>관리자--%>
						<%--</label>--%>
						<%--<label class="checkbox-inline">--%>
							<%--<input type="radio" name="role" value="2">강사--%>
						<%--</label>--%>
						<%--<label class="checkbox-inline">--%>
							<%--<input type="radio" name="role" value="3">학생--%>
						<%--</label>--%>
				      <%--</div>--%>
				    <%--</div>--%>
				  <%--</div>--%>
				  <div class="form-group pull-right" style="margin-right: 15px;">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="submit" class="btn btn-default btn-info">로그인</button>
				    </div>
				  </div>
				</form>
			</div>
			<div class="col-md-4"></div>
		</div>		
	</div>
</body>
</html>