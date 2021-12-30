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
<title>blog-login</title>
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
		<h3><span>로그인</span></h3><br><hr>
		<form action="${cp }/userController?cmd=login" method="post">
			<table>
				<tr>
					<td class="column">
						ID
					</td>
					<td>
						<input type="text" placeholder="ID를 입력하십시오." name="userId" required="required"/>
					</td>
				</tr>
				<tr>
					<td class="column">
						PASSWORD
					</td>
					<td>
						<input type="password" placeholder="PASSWORD를 입력하십시오." name="userPassword" required="required"/>	
					</td>
				</tr>
			</table>
			<br>
			<button type="submit">로그인</button>
		</form>
	</div>
	
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>