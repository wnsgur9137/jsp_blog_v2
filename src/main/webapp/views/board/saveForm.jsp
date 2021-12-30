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
<title>blog-boardsaveform</title>
<style>
	select.form-control {
		display : inline-block;
		width : 30%;
	}
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"/>
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
	<div class="titleDiv">
		<h3><span>게시글 작성</span></h3><br><hr>
		<!-- <form action="save.jsp" method="post" enctype="multipart/form-data">
			<input type="file" name="fileName"/>
			<input type="submit" value="대표 이미지"/>
		</form> -->
		<form action="${cp }/boardController?cmd=save" method="post">
			<div>
				목록 : <select name="listType" required="required" class="form-control">
				  <option value="java">JAVA</option>
				  <option value="jsp">JSP</option>
				  <option value="cs">C#</option>
				  <option value="phyton">PHYTON</option>
				  <option value="theory">이론 과목</option>
				  <option value="mac">MAC</option>
				</select>
				<hr>
				<p>제목 : <input type="text" style="width : 94%" maxlength=30 placeholder="제목을 입력하십시오." name="boardTitle" required="required"/></p>
			</div>
			<div>
				<p>내용</p>
				<textarea style="width : 100%" rows="20" cols="" name="boardContent" required="required"></textarea>
			</div>
			<button type="submit" class="btn btn-primary">글쓰기</button>
		</form>
	</div>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>