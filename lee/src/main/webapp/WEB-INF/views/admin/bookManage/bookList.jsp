<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서전체 관리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

</head>
<%@include file="/WEB-INF/views/admin/adminHeader.jsp" %>
<%@include file="/WEB-INF/views/admin/adminSideMenu.jsp"%>
<h2>도서관리 페이지</h2>
<span style="margin-left:33em">
<select name="bk_tag" id="bk_tag">
	<option>===선택===</option>
	<option value="0">등록순</option>
	<option value="1">출간일 오름차순</option>
	<option value="2">출간일 내림차순</option>
</select>
</span>

<body id="bookListBody">
<form name="listForm">
<table border="1" cellspacing="0" width="800px">
<thead>
	<tr>
		<th>도서코드</th>
		<th>도서명</th>
		<th>저자명</th>
		<th>출판사</th>
		<th>출간일</th>
		<th>파손상태</th>
	</tr>
</thead>
<tbody>
	<c:if test="${empty list}">
			<tr>
				<td colspan="6" align="center">
					등록된 도서가 없습니다.
				</td>
			</tr>
	</c:if>
	<c:forEach var="dto" items="${list}">
		<tr>
			<td>${dto.bk_idx}</td>
			<td><a href="bookInfo.ju?bk_idx=${dto.bk_idx}">${dto.bk_subject}</a></td>
			<td>${dto.bk_writer}</td>
			<td>${dto.bk_publisher}</td>
			<td>${dto.bk_writedate}</td>
			<td id="bk_break">${dto.bk_breakStr}
			<!-- <script>
			var bk = ${dto.bk_break}
				switch(bk){
				case 0 : document.write('정상');break;
				case 1 : document.write('분실');break;
				case 2 : document.write('파손'); break;
				case 3 : document.write('교체 예정'); break;
				case 4 : document.write('폐기'); break;
				}
			</script> -->
			</td>
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

<input type="button" value="도서등록" onclick="bookAddForm()">
</form>


<span id="tagBookTable"></span>

<script type="text/javascript" src="resource/js/jquery-3.2.1.min.js"></script>
<script>
/* function tag(){
	var tagNum = document.getElementById('bk_tag').value;
	location.href="bookList.ju?value="+tagNum;
} */
$(document).on('change','#bk_tag',function() {
	var params = new Object();
	params.tagNum = document.getElementById('bk_tag').value;
	$.ajax({
		type : "POST",
		url : "bookList.ju",
		data : params,
		success : function(args) {
			document.getElementById("bookListBody").innerHTML = args;
		}
	});
});
function bookAddForm(){
	location.href="bookAdd.ju";
}

</script>
</body>
</html>