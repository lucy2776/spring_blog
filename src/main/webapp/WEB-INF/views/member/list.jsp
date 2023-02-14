<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member list</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>회원 목록</h1>
		
		<div class="d-flex justify-content-end">
			<c:choose>
				<c:when test="${list eq null }">
					<input type="button" value="로그인" id="btnLogin" class="btn btn-primary"
							onclick="location.href='${cPath}/member/sign.in'" />
					&nbsp;
					<input type="button" value="회원가입" id="btnSignUp" class="btn btn-primary"
							onclick="location.href='${cPath}/member/sign.up'" />
				</c:when>
				<c:when test="${list ne null }">
					<span>${list[0].id}님 환영합니다!</span>
					&nbsp;
					<input type="button" value="로그아웃" id="btnLogout" class="btn btn-primary"
							onclick="location.href='${cPath}/member/logout.do'" />
				</c:when>
			</c:choose>
		</div>
		
		<br>
				
		<table class="table" width="800">
			<tr>
				<td>ID</td>
				<td>name</td>
				<td>email</td>
				<td>가입일자</td>
			</tr>
			<c:forEach var="row" items="${items }">
				<tr>
					<td>${row.id }</td>
					<td>
						<a href="${cPath }/member/detail.do?id=${row.id }">
							${row.name }
						</a>
					</td>
					<td>${row.email }</td>
					<td>${row.joindate }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>