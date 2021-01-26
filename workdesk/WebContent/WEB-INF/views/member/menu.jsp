<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<div class="col-md-2">
	<ul class="nav nav-pills nav-stacked" id="nav">
		
		<li class="disabled"><a href="##">${sessionScope.memId}님&nbsp;방문중</a></li>
		<li><a href="<%=request.getContextPath()%>/member/information.do">개인정보<span
				class="glyphicon glyphicon-pencil pull-right"></span></a></li>
		<li><a href="<%=request.getContextPath()%>/member/sign.do">체크인/체크아옷<span
				class="badge pull-right"></span></a></li>
		<li><a href="<%=request.getContextPath()%>/member/signRecord.do">근태
				사항<span class="badge pull-right"></span>
		</a></li>
		<%--  <li><a href="<%=request.getContextPath()%>/staff/leave">휴가 신청<span class="badge pull-right"></span></a></li> --%>
		<%--  <li><a href="<%=request.getContextPath()%>/staff/leaveRecord">휴가 기록<span class="badge pull-right"></span></a></li> --%>
		<%--  <li><a href="<%=request.getContextPath()%>/staff/passwordReset">비밀번호 수정<sapn class="glyphicon glyphicon-pencil pull-right" /></a></li> --%>
		<li><a href="<%=request.getContextPath()%>/member/logout.do">로그아옷<span
				class="glyphicon glyphicon-log-out pull-right"></span></a></li>
		<li class="disabled"><a href="##">글로벌IT학원</a></li>
	</ul>
</div>