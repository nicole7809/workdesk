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
								<th>날짜</th>
								<th>사원번호</th>
								<th>체크인 시간</th>
								<th>체크인 상태</th>
								<th>체크옷 시간</th>
								<th>체크옷 상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${signList}" var="item">
								<%--输出考勤记录--%>
								<tr>
									<td><fmt:formatDate value='${item.signInTime}'
											pattern='yyyy-MM-dd' /></td>
									<td>${item.staffId}</td>
									<td><fmt:formatDate value='${item.signInTime}'
											pattern='HH:mm:ss' /></td>
									<c:if test="${item.signInState==0}">
										<td>정상</td>
									</c:if>
									<c:if test="${item.signInState==1}">
										<td style="color: red">지각</td>
									</c:if>
									<td><fmt:formatDate value='${item.signOutTime}'
											pattern='HH:mm:ss' /></td>
									<c:if test="${item.signOutState==0}">
										<td>정상</td>
									</c:if>
									<c:if test="${item.signOutState==1}">
										<td style="color: red">조퇴</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="panel-footer">
						<c:if test="${pagingVO != null}">
							<nav style="text-align: center">
								<ul class="pagination">
									<li><a
										href="<%=request.getContextPath()%>/member/attence?page=${pagingVO.upPageNo}">&laquo;위에</a></li>
									<li class="active"><a href="">${pagingVO.curentPageNo}</a></li>
									<c:if test="${pagingVO.curentPageNo+1 <= pagingVO.totalCount}">
										<li><a
											href="<%=request.getContextPath()%>/member/attence?page=${pagingVO.curentPageNo+1}">${pagingVO.curentPageNo+1}</a></li>
									</c:if>
									<c:if test="${pagingVO.curentPageNo+2 <= pagingVO.totalCount}">
										<li><a
											href="<%=request.getContextPath()%>/member/attence?page=${pagingVO.curentPageNo+2}">${pagingVO.curentPageNo+2}</a></li>
									</c:if>
									<c:if test="${pagingVO.curentPageNo+3 <= pagingVO.totalCount}">
										<li><a
											href="<%=request.getContextPath()%>/member/attence?page=${pagingVO.curentPageNo+3}">${pagingVO.curentPageNo+3}</a></li>
									</c:if>
									<c:if test="${pagingVO.curentPageNo+4 <= pagingVO.totalCount}">
										<li><a
											href="<%=request.getContextPath()%>/member/attence?page=${pagingVO.curentPageNo+4}">${pagingVO.curentPageNo+4}</a></li>
									</c:if>
									<li><a
										href="<%=request.getContextPath()%>/member/attence?page=${pagingVO.totalCount}">맨뒤&raquo;</a></li>
								</ul>
							</nav>
						</c:if>
					</div>
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
		<%--设置菜单中--%>
		$("#nav li:nth-child(3)").addClass("active");
        <c:if test="${pagingVO != null}">
        if (${pagingVO.curentPageNo} == ${pagingVO.totalCount}) {
            $(".pagination li:last-child").addClass("disabled")
        };

        if (${pagingVO.curentPageNo} == ${1}) {
            $(".pagination li:nth-child(1)").addClass("disabled")
        };
        </c:if>

	</script>
</html>
