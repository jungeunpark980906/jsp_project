<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 정보 페이지</title>
</head>
<body>
	<h3>detail 제품 상세 정보 페이지</h3>
	<table border="1">
		<tr>
			<th>번호 pno</th>
			<td>${pvo.pno }</td>
		</tr>
		<tr>
			<th>상품명 pname</th>
			<td>${pvo.pname }</td>
		</tr>
		<tr>
			<th>가격 price</th>
			<td>${pvo.price }</td>
		</tr>
		<tr>
			<th>등록일자 regdate</th>
			<td>${pvo.regdate }</td>
		</tr>
		<tr>
			<th>세부내용 madeby</th>
			<td>${pvo.madeby }</td>
		</tr>
	</table>
	
	<!-- 이동 버튼 -->
	<a href="modify.pd?pno=${pvo.pno }"><button type="button">수정</button></a>
	<a href="remove.pd?pno=${pvo.pno }"><button type="button">삭제</button></a>
	
	
</body>
</html>