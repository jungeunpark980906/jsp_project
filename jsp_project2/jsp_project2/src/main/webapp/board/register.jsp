<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Register Page</title>
</head>
<body>
	<h1>register page</h1>
	
	<form action="/brd/insert" method="post" enctype="multipart/form-data">
		title : <input type="text" name="title"> <br>
		writer : <input type="text" name="writer" value="${ses.id }" readonly="readonly"> <br>
		content : <textarea rows="3" cols="30" name="content"></textarea> <br>
		imageFile : <input type="file" id="file" name="image_file" 
				accept="image/png, image/jpg, image/jpeg, image/bmp, image/gif"> <br>
				<!-- accept = placeholder처럼 사용하는거라 선택! -->
		<button type="submit">등록</button>
	</form>
</body>
</html>