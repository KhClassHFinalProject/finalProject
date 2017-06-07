<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>모든 사원 리스트</h2>
<table border="1" cellspacing="0" width="400">
	<thead>
		<tr>
			<th>사원번호</th>
			<th>사원이름</th>
			<th>E-mail</th>
			<th>부서</th>
			
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty list}">
			<tr>
				<td>
				등록된 사원이 없습니다.
		</td>
		</tr>
		</c:if>
		<c:forEach var="dto" items="${list}">
		<tr>
			<td>${dto.idx}</td>
			<td>${dto.name}</td>
			<td>${dto.email}</td>
			<td>${dto.dept}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>