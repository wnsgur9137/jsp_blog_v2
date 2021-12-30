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
<title>blog-boardupdateform</title>
</head>
<body>
	<% //로그인이 되어있지 않을 시 
		String sessionUserId = (String) session.getAttribute("userId");
		if(sessionUserId == null || sessionUserId.equals("null")) {
			%>
				<script type='text/javascript'>
					alert('로그인을 우선 해 주십시오.');
					location.href="../user/loginForm.jsp";
				</script>
			<%
		}
	%>
	<%
		request.setCharacterEncoding("utf-8");
		String boardKey = request.getParameter("boardKey");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
	%>
	<jsp:include page="../layout/header.jsp"/>
	<div class="titleDiv">
		<h3><span>게시글 수정</span></h3><br><hr>
		<form action="${cp }/boardController?cmd=update" method="post">
			<div>
				<p>제목 : <input type="text" style="width : 94%" maxlength=10 placeholder="제목을 입력하십시오." name="boardTitle" required="required" value="<%=boardTitle %>"/></p>
			</div>
			<div>
				<p>내용</p>
				<textarea style="width : 100%" rows="20" cols="" name="boardContent" required="required"><%=boardContent %></textarea>
			</div>
			<input type="hidden" name="boardKey" value="<%=boardKey %>"/>
			<button type="submit" class="btn btn-primary">수정</button>
		</form>
	</div>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>