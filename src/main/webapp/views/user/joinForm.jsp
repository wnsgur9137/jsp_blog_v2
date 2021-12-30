<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jspProject_final.domain.user.User" %>
<%
	String cp = request.getContextPath(); // => /jspProject
	pageContext.setAttribute("cp", cp);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>blog-userJoin</title>
<style>
	td.column {
		text-align : center;
		width : 120px;
		height : 45px;
	}
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"/>
	<div class="titleDiv">
		<h3><span>회원가입</span></h3><br><hr>
		<form action="${cp}/userController?cmd=join" method="post">
			<table border="0">
				<td class="column"> <!-- 이름 -->
					이름
				</td>
				<td>
					<input type="text" placeholder="이름을 입력하십시오." name="userName" required="required"/>
				</td>
				<tr> <!-- 아이디 -->
				<td class="column">
					아이디 
				</td>
				<td>
					<input type="text" placeholder="아이디를 입력하십시오." name="userId" required="required"/>
				</td>
				<tr> <!-- 비밀번호 -->
				<td class="column">				
					비밀번호
				</td>
				<td>
					<input type="password" name="userPassword" required="required"/>
				</td>
				<tr> <!-- 비밀번호 확인 -->
				<td class="column">
					비밀번호 확인 
				</td>
				<td>
					<input type="password" name="userPasswordCheck" required="required"/>
				</td>
				<tr> <!-- 이메일 -->
				<td class="column">
					이메일
				</td>
				<td>
					<input type="email" name="userEmail" required="required"/>
				</td>
			</table>
			<br>
			<button style="margin-left : 370px" type="submit">회원가입</button>
		</form>
	</div>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>