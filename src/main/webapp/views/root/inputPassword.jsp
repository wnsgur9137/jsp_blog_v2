<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>blog-root-pwdCheck</title>
</head>
<body>
	<% // 관리자 계정이 아닐 시
		String sessionUserId = (String)session.getAttribute("userId");
		if(sessionUserId == null || sessionUserId.equals("root") == false) {
			%>
				<script type='text/javascript'>
					alert('권한이 없습니다.');
					location.href="../user/loginForm.jsp";
				</script>
			<%
		}
	%>
	<jsp:include page="../layout/header.jsp"/>
	<%
		String select = request.getParameter("select");
		String userId = request.getParameter("userId");
		
	%>
	<div class="titleDiv">
	<h3>비밀번호 설정</h3><br><hr>
		<form action="rootUpdate.jsp" method="post">
			<table>
				<tr>
					<td>ID : </td><td><%=userId %></td>
				</tr>
				<tr>
					<td>PASSWORD : </td><td><input type="password" name="userPassword" required="required"/>
				</tr>
			</table>
			<input type="hidden" name="select" value="<%=select %>"/>
			<input type="hidden" name="userId" value="<%=userId %>"/>
			<input type="submit" value="비밀번호 설정">
		</form>
	</div>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>