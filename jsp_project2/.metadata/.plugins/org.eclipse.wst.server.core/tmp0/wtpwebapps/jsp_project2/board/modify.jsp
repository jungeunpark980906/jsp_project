<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify 게시판 수정</title>
</head>
<body>
	<h3>modify 게시판 수정 페이지</h3>
	<form action="/brd/edit" method="post" enctype="multipart/form-data">
		<table class="table table-hover">
			<tr>
				<th>번호</th>
				<td><input type="text" name="bno" value="${bvo.bno }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${bvo.title }"></td>
			</tr>
			<tr>
				<th>사용자</th>
				<td><input type="text" name="writer" value="${bvo.writer }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content">${bvo.content }</textarea></td>
			</tr>
			<tr>
				<th>작성일자</th>
				<td><input type="text" name="reg_date" value="${bvo.reg_date }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<img alt="이미지 없슈" src="/_fileUpload/th_${bvo.image_file}"> <!-- 기존 이미지 -->
					<input type="hidden" name="image_file" value="${bvo.image_file}"><!-- 기존이미지 주소 -->
					<input type="file" name="new_file"> <!-- 새 이미지 -->
				</td>
			</tr>
		</table>	
		<button type="submit" onclick="handClick()">수정</button>
	</form>
	
	<script type="text/javascript"> //js를 사용하겠습니다
		function handClick() {
			alert("수정하였습니다.");
		}
	</script>
		

</body>
</html>