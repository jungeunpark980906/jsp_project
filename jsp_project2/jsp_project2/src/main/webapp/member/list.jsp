<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list 고객 리스트 출력하기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<h1>고객 리스트</h1>
	<table class="table table-hover">
		<thead>
			<tr>
				<td>id 아이디</td>
				<td>email 이메일</td>
				<td>age 나이</td>				
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="list">
			<tr>
				<td>${list.id }</td>
				<td>${list.email }</td>
				<td>${list.age }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>