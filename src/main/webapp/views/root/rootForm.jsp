<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>blog-root-form</title>
</head>
<body>
	<% // 관리자 계정이 아닐 시
		String userInfo = (String)session.getAttribute("userInfo");
		if(userInfo == null || userInfo.equals("root") == false) {
			%>
				<script language='javascript'>
					alert('권한이 없습니다.');
					location.href="../user/loginForm.jsp";
				</script>
			<%
		}
	%>
	
	<jsp:include page="../layout/header.jsp"/>
	<div class="titleDiv">
		<h3>관리자 목록</h3><br><hr>
		<a class="nav-link" href="rootUserInfo.jsp">유저 계정 관리</a>
		<a class="nav-link" href="rootUserBoardInfo.jsp">게시글 관리</a>
		<a class="nav-link" href="">댓글 관리</a>
	</div>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>