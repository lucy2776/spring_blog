<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member detail</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>회원 정보</h1>
	
		<form action="" name="form1" method="post">
			<table border="0" width="400">
				<tr>
					<td>ID</td>
					<td><input type="test" name="id" id="id" value="${dto.id }" disabled /></td>
				</tr>
				<tr>
					<td>PW</td>
					<td><input type="password" name="pwd" id="pwd"></td>
				</tr>
				<tr>
					<td>name</td>
					<td><input type="text" name="name" id="name"
						value="${dto.name }"></td>
				</tr>
				<tr>
					<td>email</td>
					<td><input type="email" name="email" id="email"
						value="${dto.email }"></td>
				</tr>
				<tr>
					<td>join date</td>
					<td>${dto.joindate }</td>
				</tr>
			</table>
			
			<br>
			
			<input type="button" value="수정" id="btnUpdate" class="btn btn-primary" />
			<input type="button" value="삭제" id="btnDelete" class="btn btn-primary" />
			<input type="button" value="목록" id="btnList" class="btn btn-primary" />
			
			<div style="color: red" id="message">${message }</div>
			
		</form>
	</div>



	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(function() {
			$("#btnUpdate").click(function() {
				if(confirm("수정하시겠습니까?")){
					$("#id").attr("disabled", false);
					document.form1.action="${cPath}/member/update.do";
					document.form1.method="post";
					document.form1.submit();
				}
			});
				
			$("#btnDelete").click(function() {
				if(confirm("삭제하시겠습니까?")){
					document.form1.action="${cPath}/member/delete.do";
					document.form1.method="get";
					document.form1.submit();
				}
			});
			
			$("#btnList").click(function() {
				document.form1.action="${cPath}/member/list.do";
				document.form1.method="get";
				document.form1.submit();
			});
		});
	</script>
</body>
</html>