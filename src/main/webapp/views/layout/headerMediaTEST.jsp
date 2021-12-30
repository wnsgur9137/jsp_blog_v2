<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹을 위한 미디어쿼리 선언부 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>	
<title>Insert title here</title>
<style type="text/css">
	div {
		width : auto;
		height : auto;
		background-color : black;
	}
	@media (max-width:100px;) {
		div{background-color : blue;}
	}
	@media (min-width:100px) and (max-width:200px) {
		div{background-color : red;}
	}
	@media (min-width:200px) {
		div{backgorund-color : green;}
	}
</style>
</head>
<body>
	<div>
		<p>테스트</p>
	</div>
	<div class="container">
		<h3>부트스트랩 테스트 1 : container</h3>
	</div>
	<div class="container-fluid">
		<h3>부트스트랩 테스트 2 : container-fluid</h3><br>
	</div>
	
	<div class="row">
		
	</div>
</body>
</html>