<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원정보 수정</h2>
<form name="empUpdate" action="empUpdate.do" method="post">
<table>
<tr>
	<th>이름</th>
	<td><input type="text" name="name" value="${dto.name}" readonly="readonly"></td>
</tr>
<tr>
	<th>이메일</th>
	<td><input type="text" name="email" value="${dto.email}"></td>
</tr>
<tr>
	<th>부서명</th>
	<td><input type="text" name="dept" value="${dto.dept}"></td>
</tr>
<tr>
	<td colspan="2"><input type="submit" value="수정하기"></td>
</tr>
</table>
</form>
</body>
</html>