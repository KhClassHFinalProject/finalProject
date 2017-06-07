<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>선생님 리스트</h2>
<ul>
	<li><a href="learningList.ju">수업 리스트</a></li>
	<li><a href="learningTeacherList.ju">강사 관리</a></li>
</ul>
<c:set var="dto" value="${dto}"/>
<form name="teacherList" action="learningTeacherAdd.ju" method="get">
<table>
<thead>
	<tr>
		<th>강사 이름</th>
		<th>생년월일</th>
		<th>연락처</th>
		<th>주소</th>
		<th>강사 설명</th>
	</tr>
</thead>
<tbody>
	<c:if test="${empty list}">
		<tr>
			<td colspan="5" align="center">
				등록된 강사가 없습니다.
			</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${list}">
		<tr>
			<td>${dto.tc_name}</td>
			<td>${dto.tc_birth}</td>
			<td>${dto.tc_hp}</td>
			<td>${dto.tc_addr}</td>
			<td>${dto.tc_sum}</td>
		</tr>
	</c:forEach>
</tbody>
</table>

<input type="button" value="강사 등록" onclick="teacherAdd()">
</form>
<script>
function teacherAdd(){
	location.href="learningTeacherAdd.ju";
}
</script>
</body>
</html>