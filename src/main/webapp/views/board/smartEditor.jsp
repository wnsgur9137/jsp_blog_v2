<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp"/>
	<pre>${cp }</pre>
	<!-- Smart Editor -->
	<script type="text/javascript" src="../../smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript" src="../se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
	
	<textarea style="width:100%;"  name="content" id="content"></textarea>
	
	<script type="text/javascript">
	  var oEditors = [];
	  nhn.husky.EZCreator.createInIFrame({
	  oAppRef: oEditors,
	  elPlaceHolder: "content",
	  sSkinURI: "../se2/SmartEditor2Skin.html",
	  fCreator: "createSEditor2"
	  });
	
	  //‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
	  function submitContents(elClickedObj) {
	  // 에디터의 내용이 textarea에 적용된다.
	  oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);
	  document.getElementById("form").submit();
	  // 에디터의 내용에 대한 값 검증은 이곳에서
	  // document.getElementById("textAreaContent").value를 이용해서 처리한다.
	
	  try {
	  elClickedObj.form.submit();
	  } catch(e) {
	
	  }
	  }
	
	  // textArea에 이미지 첨부
	  function pasteHTML(filepath){
	  var sHTML = '<img src="<%=request.getContextPath()%>/uploadFolder/'+filepath+'">';
	  oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
	  }
	</script>
	
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>
