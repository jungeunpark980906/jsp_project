<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
</head>
<body align = "center">
	<h1>Index page</h1>

	<c:if test="${ses.id ne null}"> 
		<!-- ne = not equal /  eq = equal -->
		${ses.id}님이 login 하였습니다. <br>
		계정생성일 : ${ses.reg_date }<br>
		마지막 접속 : ${ses.last_login }<br>
		<br><br>
	</c:if>

	<a href="/mem/join"><button>join</button></a>
	
	
	
	<c:choose>
		<c:when test="${ses.id ne null}">		
		<a href="/mem/logout"><button>logout</button></a>
		<a href="/mem/modify_rdy"><button>회원정보수정</button></a>
		<br>
		<a href="/mem/list"><button>list</button></a>
		<a href="/brd/register"><button>게시글 작성</button></a>
		<a href="/brd/page"><button>전체 게시글보기</button></a>
		<a href="/brd/page?keyword=${ses.id}&type=w"><button type="submit">내 게시글보기</button></a>
		</c:when>
		
		<c:otherwise>
		<a href="/mem/login"><button>login</button></a>
		</c:otherwise>
		
	</c:choose>
	
	<script type="text/javascript"> //js를 사용하겠습니다
	
	const msg_login = `<c:out value="${msg_login}" />`;
	console.log(msg_login);
	// c:out은 sysout과 동일 효과
	// = c:out value="출력값"이며 리턴하는 값은 string임을 인지하기!
	
	if(msg_login === '0'){ //msj
		alert('로그인 실패');
	}
	
	</script>

	<!-- /mem/을 붙였다 = controller을 거쳐온다 -->
	
</body>
</html>