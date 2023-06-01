<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리스트 보기</title>
</head>
<body>
	<h1>상품리스트보기 Product List Page</h1>
	<table border="1">
		<thead>
			<tr>
				<th>번호 pno</th>
				<th>상품명 pname</th>
				<th>등록일자 regdate</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="pvo">
			<tr>
				<td>${pvo.pno }</td>
				<td><a href="detail.pd?pno=${pvo.pno }">${pvo.pname }</a></td>
				<td>${pvo.regdate }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- 이동 버튼 -->
	<a href="register.pd"><button type="button">상품등록</button></a>
	<a href="index.pd"><button type="button">index</button></a>
</body>
</html>