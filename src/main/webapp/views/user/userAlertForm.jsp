<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String select = request.getParameter("select");
		String alert = request.getParameter("alert");
		
		if(select.equals("join")) {
			if(alert.equals("idCheck")) {
				%>
					<script type="text/javascript">
						alert("아이디 중복");
						location.href="joinForm.jsp";
					</script>
				<%
			} else if(alert.equals("passwordCheck")) {
				%>
					<script type="text/javascript">
						alert("비밀번호 불일치");
						location.href="joinForm.jsp";
					</script>
				<%
			} else if(alert.equals("joinFail")) {
				%>
					<script type="text/javascript">
						alert("회원가입 실패");
						location.href="joinForm.jsp";
					</script>
				<%
			} else if(alert.equals("joinSuccess")) {
				%>
					<script type="text/javascript">
						alert("회원가입 성공");
						location.href="loginForm.jsp";
					</script>
				<%
			}
		}
		
		if(select.equals("login")) {
			if(alert.equals("loginSuccess")) {
				%>
					<script type="text/javascript">
						alert("로그인 성공");
						location.href="../../index.jsp";
					</script>
				<%
			} else if(alert.equals("loginFail")) {
				%>
					<script type="text/javascript">
						alert("아이디/비밀번호를 확인해 주십시오.");
						location.href="loginForm.jsp";
					</script>
				<%
			}
		}
		
		if(select.equals("logout")) {
			if(alert.equals("logoutSuccess")) {
				%>
					<script type="text/javascript">
						alert("로그아웃되었습니다.");
						location.href="loginForm.jsp";
					</script>
				<%
			}
		}
		
		if(select.equals("infoForm")) {
			if(alert.equals("updatePasswordFail")) {
				%>
					<script type="text/javascript">
						alert("회원 정보가 일치하지 않습니다.");
						location.href="infoForm.jsp";
					</script>
				<%
			} else if(alert.equals("updatePasswordCheckFail")) {
				%>
					<script type="text/javascript">
						alert("변경할 비밀번호 불일치");
						location.href="infoForm.jsp";
					</script>
				<%
			} else if(alert.equals("updateFail")) {
				%>
					<script type="text/javascript">
						alert("비밀번호 변경 실패");
						location.href="infoForm.jsp";
					</script>
				<%
			} else if(alert.equals("updateSuccess")) {
				%>
					<script type="text/javascript">
						alert("비밀번호 변경 성공");
						location.href="infoForm.jsp";
					</script>
				<%
			} else if(alert.equals("deletePasswordFail")) {
				%>
					<script type="text/javascript">
						alert("비밀번호 불일치");
						location.href="infoForm.jsp";
					</script>
				<%
			} else if(alert.equals("deleteFail")) {
				%>
					<script type="text/javascript">
						alert("회원 탈퇴 성공");
						location.href="infoForm.jsp";
					</script>
				<%
			} else if(alert.equals("deleteSuccess")) {
				%>
					<script type="text/javascript">
						alert("회원 탈퇴 성공");
						location.href="loginForm.jsp";
					</script>
				<%
			}
		}
		
	%>
</body>
</html>