<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 수정 페이지</title>
</head>
<body>
	<h3>modify 제품 수정 페이지</h3>
	
	<br>
	
	<form action="edit.pd" method="post">
		<input type="hidden" name="pno" value="${pvo.pno }"> <!--pno의 값을 가져가기위해 만들었음  -->
		<input type="hidden" name="pno" value="${pvo.regdate }">
		상품번호 pno : <input type="text" name="pno" value="${pvo.pno }" disabled="disabled"> <br> 
		상품명 name : <input type="text" name="pname" value="${pvo.pname }"> <br>
		가격 price : <input type="text" name="price" value="${pvo.price }"> <br>
		등록일자 regdate : <input type="text" name="regdate" value="${pvo.regdate }" disabled="disabled"> <br>
		상세정보 madeby : <input type="text" name="madeby" value="${pvo.madeby }"> <br>
		
		<button type="submit">수정하기 modify</button>
	</form>
</body>
</html>