<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath(); // => /jspProject
	pageContext.setAttribute("cp", cp);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>blog-pwdCheck</title>
</head>
<body>
	<% //로그인이 되어있지 않을 시 
		Object userInfo = session.getAttribute("userInfo");
		if(userInfo == null || userInfo.equals("null")) {
			%>
				<script type='text/javascript'>
					alert('로그인을 우선 해 주십시오.');
					location.href="../user/loginForm.jsp";
				</script>
			<%
		}
	%>
	<jsp:include page="../layout/header.jsp"/>
	
	<div class="titleDiv" style="padding-left : 20px">
		<h3>비밀번호</h3> <br><hr>
		<form action="${cp}/userController?cmd=infoForm" method="post">
			<input type="password" placeholder="PASSWORD를 입력하십시오." name="userPassword" required="required"/>
			<button type="submit">확인</button>
		</form>
	</div>
	
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>