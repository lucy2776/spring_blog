<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member insert</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>회원가입</h1>
		<form action="${cPath }/member/list.do" method="post">
			<table border="0" width="400">
				<tr>
					<td>ID</td>
					<td><input type="text" name="id" id="id"></td>
				</tr>
				<tr>
					<td>PW</td>
					<td><input type="password" name="pwd" id="pwd"></td>
				</tr>
				<tr>
					<td>name</td>
					<td><input type="text" name="name" id="name"></td>
				</tr>
				<tr>
					<td>email</td>
					<td><input type="email" name="email" id="email"></td>
				</tr>
			</table>
			
			<br>
			
			<input type="submit" id="sign_up" value="회원가입" class="btn btn-primary">
		</form>
	</div>

	<!-- <div id="rs1"></div>
	<div id="rs2"></div> -->

	<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(function(){
			$('#sign_up').click(function(e){
				/* e.preventDefault() */
				
				let id = $("#id").val();
				let pwd = $("#pwd").val();
				let name = $("#name").val();
				let email = $("#email").val();
				
				var member = {id:id, pwd:pwd, name:name, email:email}
				
				console.log(member)
				
 				$.ajax({
					/* 보내는거 */
					type: "POST",
					url: "${cPath}/member/insert.do",
					data: JSON.stringify(member),
					contentType: "application/json; charset=utf-8", 
					/* 받는거 */
					dataType: "text", 
					
					success: function(data, status){
						console.log(data, status)
						/* $("#rs1").html("성공") */	
					},
					
					error: function(data, status){
						console.log(data, status)
						/* $("#rs2").html("실패") */
					}
				})
			})
		})
	</script>
</body>
</html>