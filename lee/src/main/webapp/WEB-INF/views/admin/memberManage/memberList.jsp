<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원전체 관리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body id="memList">
<h2>회원 전체 리스트</h2>
<c:set var="dto" value="${dto}"/>
<table border="1" cellspacing="1">
	<thead>
		<tr>
			<th>회원번호</th>
			<th>회원이름</th>
			<th>생년월일</th>
			<th>ID</th>
			<th>연락처</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty list}">
			<tr>
				<td colspan="6" align="center">
					등록된 회원이 없습니다.
				</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${list}"> 
			<tr>
				<td>${dto.mem_idx}</td>
				<td><a href="memberInfo.ju?mem_idx=${dto.mem_idx}">${dto.mem_name}</a></td>
				<td>${dto.mem_birth}</td>
				<td>${dto.mem_id}</td>
				<td>${dto.mem_hp}</td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
	<tr>
		<td colspan="6">
		<nav>
		  <ul class="pagination">
		    <li>
		      <a href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    ${pageStr}
		    <li>
		      <a href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
		</td>
	</tr>
	</tfoot>
</table>
<form name="memSearch">
	<input type="text" id="mem_name">&nbsp;
	<input type="button" value="검색" id="mem_search">
</form>
<script type="text/javascript" src="resource/js/jquery-3.2.1.min.js"></script>
<script>
$(document).on('click','#mem_search',function() {
	var params = new Object();
	params.mem_name = document.getElementById('mem_name').value;
	$.ajax({
		type : "POST",
		url : "memberList.ju",
		data : params,
		success : function(args) {
			document.getElementById("memList").innerHTML=args;
		}
	});
});
</script>
</body>
</html>