<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
crossorigin="anonymous">
</head>
<body>
	<h1>list 회원리스트</h1>
	<table class="table table-hover">
		<thead>
			<tr>
				<td>id 아이디</td>
				<td>email 이메일</td>
				<td>age 나이</td>				
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${mvo }" var="mvo">
			<tr>
				<td>${mvo.id }</td>
				<td>${mvo.email }</td>
				<td>${mvo.age }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>