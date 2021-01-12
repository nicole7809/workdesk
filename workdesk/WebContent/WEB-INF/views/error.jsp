<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>error 페이지</title>
</head>
<body>
<meta http-equiv="refresh" content="60;url=${pageContext.request.contextPath}/" property="">
<!-- content="60, 60초 후 메인화면으로....삭제 몇 시간수정가능-->
<link href="${pageContext.request.contextPath}/css/error.css" rel="stylesheet" type="text/css"/>
<!-- 시작 -->
<div id="container"><img class="png" src="${pageContext.request.contextPath}/resource/images/error/404.png"/> <img
        class="png msg" src="${pageContext.request.contextPath}/resource/images/error/404_msg.png"/>

    <p><a href="${pageContext.request.contextPath}/" >
        <img class="png"
             src="${pageContext.request.contextPath}/resource/images/error/404_to_index.png"/></a>
    </p>
</div>
<div id="cloud" class="png"></div>
<!-- 끝 -->

</body>
</html>
