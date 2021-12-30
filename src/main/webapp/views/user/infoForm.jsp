<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath(); // => /jspProject
	pageContext.setAttribute("cp", cp);
%>
<%@ page import="jspProject_final.domain.user.User" %>
<%@ page import="jspProject_final.domain.user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>blog-userInfo</title>
<style>
	h3.title{
		margin-top : 30px;
		margin-right : 10px;
		margin-bottom : 10px;
		margin-left : 50px;
	}
	
	div.content {
		margin-top : 30px;
		margin-right : 10px;
		margin-bottom : 10px;
		margin-left : 50px;
	}
</style>
</head>
<body>
	<% //로그인이 되어있지 않을 시 
		Object userInfo = session.getAttribute("userInfo");
		System.out.println(userInfo);
		if(userInfo == null || userInfo.equals("null")) {
			%>
				<script type='text/javascript'>
					alert('로그인을 우선 해 주십시오.');
					location.href="../user/loginForm.jsp";
				</script>
			<%
		}
	%>
	<%
		String userId = (String) session.getAttribute("userId");
		String userPassword = request.getParameter("userPassword");
		
		System.out.println("-----------------");
		System.out.println(userId);
		System.out.println(userPassword);
		System.out.println("-----------------");
	
		User user = new User();
		UserDAO userDAO = new UserDAO();
		
		int result = userDAO.passwordCheck(userId, userPassword);
		if (result == -1) {
			%>
				<script type='text/javascript'>
					alert('다시 비밀번호를 입력해 주십시오.');
					location.href="passwordCheck.jsp";
				</script>
			<%
		}
	%>
	<jsp:include page="../layout/header.jsp"/>
	<div class="titleDiv">
		<h3 class="title">계정 정보</h3><br><hr>
		<div class="content">
			<h4>비밀번호 변경</h4> <br>
			<form action="${cp }/userController?cmd=infoAction" method="post">
				<table>
					<td>
						현재 비밀번호 : 
					</td>
					<td>
						<input type="password" placeholder="현재 비밀번호를 입력하십시오." name="nowPassword" required="required"/>
					</td>
					<tr>
					<td>
						변경할 비밀번호 : 
					</td>
					<td>
						<input type="password" placeholder="변경할 비밀번호를 입력하십시오." name="updatePassword" required="required"/>
					</td>
					<tr>
					<td>
						비밀번호 확인 : 
					</td>
					<td>
						<input type="password" placeholder="변경할 비밀번호를 입력하십시오." name="updatePasswordCheck" required="required"/>
					</td>
				</table>
				<input type="hidden" value="updatePassword" name="select"/>
				<button type="submit">비밀번호 변경</button>
			</form>
		</div>
		<br>
		<hr><hr>
		<br>
		<div class="content">
			<h4>계정 삭제</h4>
			<p><span style="color : red;">*경고*</span>계정삭제시 되돌릴 수 없습니다. </p>
			<hr>
			<form action="${cp }/userController?cmd=infoAction" method="post">
				<table>
					<td>
						비밀번호 : 
					</td>
					<td>
						<input type="password" placeholder="현재 비밀번호를 입력하십시오." name="userPassword" required="required"/>
					</td>
				</table>
				<input type="hidden" value="delete" name="select"/>
				<button type="submit">탈퇴</button>
			</form>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>