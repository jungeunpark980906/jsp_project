<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>

	<h1>list 전체 게시글</h1>
	<br>
	
	<form action="/brd/page" method="post">
		<div>
		<c:set value="${pgh.pgvo.type }" var="typed"></c:set>
			<select name="type">
				<option ${typed == null? 'selected': ''}>choose 선택하세요</option>
				<option value="t" ${typed eq 't' ? 'selected' : ''}>title 제목</option>
				<option value="c" ${typed eq 'c' ? 'selected' : ''}>content 내용</option>
				<option value="w" ${typed eq 'w' ? 'selected' : ''}>writer 작성자</option>
				<option value="tc" ${typed eq 'tc' ? 'selected' : ''}>title or contnent 제목/내용</option>
				<option value="tw" ${typed eq 'tw' ? 'selected' : ''}>title or writer 제목/작성자</option>
				<option value="cw" ${typed eq 'cw' ? 'selected' : ''}>content or writer 내용/작성자</option>
				<option value="tcw" ${typed eq 'tcw' ? 'selected' : ''}>all 전체</option>
			</select>
			<input type="text" name="keyword" placeholder="Search 검색내용 입력">
			<input type="hidden" name="pageNo" value="${pgh.pgvo.pageNo }">
			<input type="hidden" name="qty" value="${pgh.pgvo.qty }">
			<button type="submit">Search 검색</button>
			<button type="button" class="btn btn-primary position-relative">
			결과<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
				${pgh.totalCount } <span class="visually-hidden">unread messages</span>
			</span>
</button>
		</div>
	
	</form>
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th>bno</th>
				<th>title 제목</th>
				<th>writer 작성자</th>
				<th>reg_date 작성일자</th>				
				<th>count 조회수</th>				
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${list }" var="list">
			<tr>
				<td>${list.bno }</td>	
				<td>
					<c:if test="${list.image_file ne null && list.image_file ne ''}">
						<img alt="사진이 없으요" src="/_fileUpload/th_${list.image_file}">
					</c:if>
					<a href="detail?bno=${list.bno}">${list.title }</a>
				</td>
				<td>${list.writer }</td>
				<td>${list.reg_date }</td>
				<td>${list.count }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<br><br><br>
	
	<div align="center">

		<c:if test="${pgh.prev }">
			<a href="/brd/page?pageNo=${pgh.startPage-1 }&qty=${pgh.pgvo.qty}
				&type=${pgh.pgvo.type}&keyword=${pgh.pgvo.keyword}">이전</a> 
		</c:if>
		
	
		<c:forEach begin="${pgh.startPage }" end="${pgh.endPage }" var="i">
			<a href="/brd/page?pageNo=${i }&qty=${pgh.pgvo.qty}
				&type=${pgh.pgvo.type}&keyword=${pgh.pgvo.keyword}">${i } /</a>
		</c:forEach>
		
		<c:if test="${pgh.next }">
			<a href="/brd/page?pageNo=${pgh.endPage+1 }&qty=${pgh.pgvo.qty}
				&type=${pgh.pgvo.type}&keyword=${pgh.pgvo.keyword}">다음</a> 
		</c:if>
	
		<br><br>
	
		<a href="/"><button>기본화면으로 돌아가기</button></a>
	</div>
</body>
</html>