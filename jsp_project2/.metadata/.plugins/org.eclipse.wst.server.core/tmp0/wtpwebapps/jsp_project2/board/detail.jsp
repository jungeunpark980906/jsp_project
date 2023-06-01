<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<title>detail 상세정보</title>
</head>
<body>
<h3>-- detail 게시판 상세 페이지 --</h3>
	
	<table class="table table-hover">
		<tr>
			<th>번호</th>
			<td>${bvo.bno }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${bvo.title }</td>
		</tr>
		<tr>
			<th>사용자</th>
			<td>${bvo.writer }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${bvo.content }</td>
		</tr>
		<tr>
			<th>작성일자</th>
			<td>${bvo.reg_date }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${bvo.count }</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<c:if test="${bvo.image_file ne null && bvo.image_file ne ''}">
					<img alt="사진안떠욥" src="/_fileUpload/${bvo.image_file}">
				</c:if>
			</td>
		</tr>
	</table>
	<a href="/brd/modify?bno=${bvo.bno }"><button type="button">수정</button></a>
	<a href="/brd/remove?bno=${bvo.bno }&fileName=${bvo.image_file}"><button type="button">삭제</button></a>
	<a href="/brd/page"><button type="button">리스트로 돌아가기</button></a>
	
	<br><br><hr><br><br>
	
	
	<h3>-- Comment line --</h3><br>
	<!-- 댓글 작성 라인 -->
	<h4>댓글 작성</h4>
	<!-- js로 가져와 사용할 예정이라 id, button type="button" 사용 -->
	<input type="text" id="cmtWriter" value="${ses.id }" placeholder="writer" readonly="readonly"> <br>
	<input type="text" id="cmtText" placeholder="Add Comment">
	<button type="button" id="cmtAddBtn">댓글 등록</button><br>
	</div>
	
	<br><br><hr><br><br>
	
	<!-- 댓글 표시 라인 -->
	<h4>작성된 댓글</h4>
	<div class="accordion accordion-flush" id="accordionFlushExample">
	  	<div class="accordion-item">
		    <h2 class="accordion-header" id="flush-headingOne">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
		       cno ,writer
		      </button>
		    </h2>
		    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body">
		      	content, reg_date
		      </div>
		    </div>
	  </div>
  </div>
	
	<script type="text/javascript"> //번호 보내기
	const bnoVal = `<c:out value = "${bvo.bno}" />`;
	</script>
	
	<script src="/resources/board_detail.js"></script>
	<!-- 상단에 번호 보내기 사용가능 -->
	
	<script type="text/javascript">
		printCommentList(bnoVal);
	</script>
	
</html>