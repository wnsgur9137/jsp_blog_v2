<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- SmartEditor2 라이브러리 -->
<script type="text/javascript" src="/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>


</head>
<body>

<!-- SmartEditor2 -->
<div>
	<div class="form-group">
		<textarea class="form-control" rows="20" name="bo_content" id="bo_content">${smarteditorVO.bo_content }</textarea>>
	</div>
</div>


</body>
</html>
<script type="text/javascript">
$(function() {
	var oEditors=[];
	var ctx = getContextPath();
	var formBtn = $("#formBtn");
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "bo_content",
		sSkinURI : "/smarteditor2/SmartEditor2Skin.html",
		fCreator : "createSEditor2"
	});
	
	formBtn.on("click", function(e) {
		e.preventDefault();
		if($("#bo_title").val() == "") {
			alert("제목을 입력하십시오.");
			$("#bo_title").focus();
			return;
		}
	})
})
</script>