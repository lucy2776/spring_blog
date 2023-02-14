<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>로그인</h1>
	
		<form action="" name="login" method="post">
			<table border="0" width="400">
				<tr>
					<td>ID</td>
					<td><input type="text" name="id" id="id"></td>
				</tr>
				<tr>
					<td>PW</td>
					<td><input type="password" name="pwd" id="pwd"></td>
				</tr>
			</table>
			
			<br>
			
			<a href="${cPath }/member/find_id">ID 찾기</a>
			<a href="${cPath }/member/find_pw">PW 찾기</a>
			&nbsp;&nbsp;
			<input type="button" id="btnLogin" class="btn btn-primary" value="로그인">
		</form>

	</div>

	<script src="https://code.jquery.com/jquery-3.6.3.js"
		integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(function() {
			$("#btnLogin").click(function() {
				var id = $("#id").val();
				var pwd = $("#pwd").val();

				var login = {id:id, pwd:pwd}

				if (id == "") {
					alert("아이디를 입력하세요.");
					$("#id").focus();
					return;
				}
				if (pwd == "") {
					alert("비밀번호를 입력하세요.");
					$("#pwd").focus();
					return;
				}
				else{
					$.ajax({
						type : "post",
						url : "${cPath}/member/login.do",
						data : JSON.stringify(login),
						contentType : "application/json",
						
						success : function(login) {
							console.log("성공")
							console.log(login)
							if(login.length == 0){
								alert("아이디가 존재하지 않거나 비밀번호가 일치하지 않습니다.")
							}
							else {
								location.href = "${cPath}/member/list.do";
							}
						},
						
						error : function() {
							console.log("실패");
						}
						
					}) // ajax
				} // else
			
			})
		})

	</script>

</body>
</html>