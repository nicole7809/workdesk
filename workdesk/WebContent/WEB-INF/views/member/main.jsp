<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>인사관리 시스템</title>
		<link rel="stylesheet" type="text/css" href="css/main.css">
	</head>
	
<body>
	<div id="main">
		<div id="top">
			<div id="top_title">인사관리 시스템</div>
				<div id="top_info">
					<c:if test="${not empty Teacher}">
						<h3>안녕하세요 ：${Teacher.teacherName}${Teacher.role.getRoleName()} 님
						<a href="<%=path%>/ActionServlet?method=loginout">로그옷</a></h3>
						
					</c:if>
					<c:if test="${not empty User}">
						<h3>안녀하세요 ${User.userName}${User.role.getRoleName()} 님
						<a href="<%=path%>/ActionServlet?method=loginout">로그</a></h3>		
					</c:if>
					<c:if test="${not empty Student}">
						<h3>안녀하세요 ${Student.studentName}${Student.role.getRoleName()} 님
						<a href="<%=path%>/ActionServlet?method=loginout">로그</a></h3>		
					</c:if>
				
				<!-- $操作符及其强大，不光能读request作用域中的attribute，也能读session作用域中的attribute -->
				</div>		
			</div>
		<!-- top部分是标题栏 -->
		<div id="left">
			<ul>
				<c:forEach var="roleMenu" items="${roleMenu}"><!-- 获取对应角色菜单信息 -->
					<li>
						<a href="<%=path%>/ActionServlet?method=${roleMenu[1]}&entity=${roleMenu[2]}">${roleMenu[0]}</a>
					</li>
				</c:forEach>
			</ul>
		</div>
		<!-- left部分是菜单栏 -->
		<div id="right">
			<!-- right部分是具体内容显示区 -->
			<c:if test="${empty actionURL}">
				 인사관리 시스템
			</c:if>
			<c:if test="${not empty actionURL}">
				<jsp:include page="${actionURL}" flush="true"></jsp:include>
			</c:if>
		</div>
	</div>
</body>
</html>
