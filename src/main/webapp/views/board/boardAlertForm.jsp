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
		
		if(select.equals("save")) {
			if(alert.equals("saveFail")) {
				%>
					<script type="text/javascript">
						alert("게시글 작성 실패");
						location.href="saveForm.jsp";
					</script>
				<%
			} else if(alert.equals("saveSuccess")) {
				%>
					<script type="text/javascript">
						alert("게시글 작성 성공");
						location.href="list.jsp";
					</script>
				<%
			}
		}
		
		else if(select.equals("update")) {
			if(alert.equals("updateFail")) {
				%>
					<script type="text/javascript">
						alert("게시글 수정 실패");
						location.href="list.jsp";
					</script>
				<%
			} else if(alert.equals("updateSuccess")) {
				%>
					<script type="text/javascript">
						alert("게시글 수정 성공");
						location.href="list.jsp";
					</script>
				<%
			}
		}
		
		else if(select.equals("delete")) {
			if(alert.equals("deleteFail")) {
				%>
					<script type="text/javascript">
						alert("게시글 삭제 실패");
						location.href="list.jsp";
					</script>
				<%
			} else if(alert.equals("deleteSuccess")) {
				%>
					<script type="text/javascript">
						alert("게시글 삭제 성공");
						location.href="list.jsp";
					</script>
				<%
			}
		}
		
		else if(select.equals("commentSave")) {
			if(alert.equals("commentSaveFail")) {
				%>
					<script type="text/javascript">
						alert("댓글 등록 실패");
						location.href="list.jsp";
					</script>
				<%
			} else if(alert.equals("commentSaveSuccess")) {
				%>
					<script type="text/javascript">
						alert("댓글 등록 성공");
						location.href="list.jsp";
					</script>
				<%
			}
		}
		
		else if(select.equals("commentUpdate")) {
			if(alert.equals("commentUpdateFail")) {
				%>
					<script type="text/javascript">
						alert("댓글 수정 실패");
						location.href="list.jsp";
					</script>
				<%
			} else if(alert.equals("commentUpdateSuccess")) {
				%>
					<script type="text/javascript">
						alert("댓글 수정 성공");
						location.href="list.jsp";
					</script>
				<%
			}
		}
		
		else if(select.equals("commentDelete")) {
			if(alert.equals("commentDeleteFail")) {
				%>
					<script type="text/javascript">
						alert("댓글 삭제 실패");
						location.href="list.jsp";
					</script>
				<%
			} else if(alert.equals("commentDeleteSuccess")) {
				%>
					<script type="text/javascript">
						alert("댓글 삭제 성공");
						location.href="list.jsp";
					</script>
				<%
			}
		}
		
	%>
</body>
</html>